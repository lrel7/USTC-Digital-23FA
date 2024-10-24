module Control (
    input            clk, rst, btn,
    input      [5:0] check_result,
    input            timer_finish,
    output           check_start,
    output           timer_en,
    output           timer_set,
    output reg [1:0] led_sel, seg_sel
);

localparam INIT = 3'b000;  // 初始阶段
localparam GUESS = 3'b001;  // 猜数阶段, 此时led呈现流水灯, 等待用户猜数并按下按钮
localparam CHECK = 3'b010;  // 检查结果阶段, 此时led显示猜数结果, 用户可按下按钮回到猜数阶段
localparam SUCCESS = 3'b011;  // 成功
localparam FAIL = 3'b100;  // 失败
reg [2:0] current_state = INIT, next_state = INIT;
wire success;  // 成功信号

// 1. 状态更新
always @(posedge clk) begin
    if (rst)
        current_state <= INIT;
    else
        current_state <= next_state;
end

// 2. 状态转移逻辑
always @(*) begin
    next_state = current_state;
    case (current_state)
        INIT: next_state = rst ? INIT : GUESS;  // 取消复位进入`GUESS`状态
        GUESS: next_state = timer_finish ? FAIL : btn ? CHECK : GUESS;  
        CHECK: next_state = success ? SUCCESS : timer_finish ? FAIL : btn ? GUESS : CHECK;
        SUCCESS: next_state = rst ? INIT : btn ? GUESS : SUCCESS;
        FAIL: next_state = rst ? INIT : btn ? GUESS : FAIL;
    endcase
end

// 3. 输出
assign check_start = btn;  // 检查开始信号
assign timer_set = ((current_state == INIT) || (current_state == SUCCESS) || (current_state == FAIL));  // 倒计时置数信号
assign timer_en = ((current_state == GUESS) || (current_state == CHECK));  // 倒计时使能信号
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