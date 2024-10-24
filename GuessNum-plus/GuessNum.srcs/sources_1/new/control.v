module Control (
    input            clk, rst, btn,
    input      [5:0] check_result,
    input            timer_finish,
    input            print_answer,  // 用户输入"a;", 串口输出答案
    input            new_game,  // 用户输入"n;", 开始新一局
    input            pause,  // 用户输入"p;", 计时器暂停
    output           check_start,
    output           timer_en,
    output           timer_set,
    output reg [1:0] led_sel, seg_sel,
    output           generate_random
);

localparam IDLE = 3'b000;  // 空闲阶段
localparam PREPARE = 3'b001;  // 准备阶段
localparam GUESS = 3'b010;  // 猜数阶段, 此时led呈现流水灯, 等待用户猜数并按下按钮
localparam CHECK = 3'b011;  // 检查结果阶段, 此时led显示猜数结果, 用户可按下按钮回到猜数阶段
localparam SUCCESS = 3'b100;  // 成功
localparam FAIL = 3'b101;  // 失败
reg [2:0] current_state = IDLE, next_state = IDLE;
wire success;  // 成功信号
reg pause_flag = 1;  // 翻转一次为暂停, 再翻转一次为继续, 以此类推

// 1. 状态更新
always @(posedge clk) begin
    if (rst)
        current_state <= IDLE;
    else
        current_state <= next_state;
end

// 2. 状态转移逻辑
always @(*) begin
    next_state = current_state;
    case (current_state)
        IDLE: next_state = rst ? IDLE : PREPARE;  // 取消复位进入`PREPARE`状态
        PREPARE: next_state = GUESS;  // 直接进入`GUESS`阶段
        GUESS: next_state = timer_finish ? FAIL : btn ? CHECK : new_game ? PREPARE : GUESS;  
        CHECK: next_state = success ? SUCCESS : timer_finish ? FAIL : btn ? GUESS : new_game ? PREPARE : CHECK;
        SUCCESS: next_state = rst ? IDLE : btn ? PREPARE : SUCCESS;
        FAIL: next_state = rst ? IDLE : btn ? PREPARE : FAIL;
    endcase
end

// 3. 输出
assign check_start = btn;  // 检查开始信号
// assign timer_set = ((current_state == INIT) || (current_state == SUCCESS) || (current_state == FAIL));  // 倒计时置数信号
assign timer_set = (current_state == PREPARE);
assign timer_en = ((current_state == GUESS) || (current_state == CHECK)) ? pause_flag : 0;  // 倒计时使能信号
// assign generate_random = (current_state == INIT) || (current_state == SUCCESS) || (current_state == FAIL);  // 随机生成下一轮游戏目标
assign generate_random = (current_state == PREPARE);

always @(posedge clk) begin  // 暂停处理
    if (rst)
        pause_flag <= 1;
    else if (pause && (current_state == GUESS || current_state == CHECK))
        pause_flag <= ~pause_flag;
end

always @(*) begin  // led灯选择信号
    case (current_state)
        GUESS: led_sel = 2'b00;  // 流水灯
        CHECK: led_sel = 2'b01;  // 检查结果
        SUCCESS: led_sel = 2'b10;  // 全亮
        default: led_sel = 2'b11;  // 全灭
    endcase
end
always @(*) begin  // 数码管选择信号
    case (current_state)
        GUESS, CHECK: seg_sel = 2'b00;  // 显示倒计时
        SUCCESS: seg_sel = 2'b01;  // 显示全8
        FAIL: seg_sel = 2'b10;  // 显示全4
        default: seg_sel = 2'b11;  // 显示0
    endcase 
end
    
assign success = (current_state == CHECK) && check_result == 6'b100_000;  // 检查成功信号

endmodule