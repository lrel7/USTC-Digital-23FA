module Send (
    input           clk, rst, dout_vld,
    input     [7:0] dout_data,
    output reg      dout
);

localparam FullT = 867;  // 发送每一位持续的时钟周期数
localparam TOTAL_BITS = 9;  // 位计数器的范围
reg [9:0] div_cnt;  // 分频计数器, 范围0~867
reg [4:0] dout_cnt;  // 位计数器, 范围0~9
reg [7:0] temp_data;  // 保存待发送数据

localparam WAIT = 0;  // 空闲状态
localparam SEND = 1;  // 发送状态
reg current_state = WAIT, next_state = 0;

// 1. 状态更新
always @(posedge clk) begin
    if (rst)  // 复位
        current_state <= WAIT;    
    else 
        current_state <= next_state;
end

// 2. 状态转移逻辑
always @(*) begin
    next_state = current_state;
    case (current_state)
        WAIT: next_state = dout_vld ? SEND : WAIT;
        SEND: next_state = (dout_cnt == TOTAL_BITS) ? WAIT : SEND;
    endcase
end

// 3. 输出
always @(posedge clk) begin
    if (rst)
        dout <= 1;
    else if (current_state == SEND && dout_cnt == 0)  // 起始位
        dout <= 0;
    else if (dout_cnt > 0 && dout_cnt < TOTAL_BITS)  // 有效数据
        dout <= temp_data[dout_cnt - 1];
    else  // 停止位或空闲帧
        dout <= 1;
end

// 分频计数器
always @(posedge clk) begin
    if (rst)  // 复位
        div_cnt <= 0;
    else if (current_state == SEND)  // 发送状态, 计数
        div_cnt <= (div_cnt == FullT) ? 0 : div_cnt + 1; 
    else  // 等待状态, 清零
        div_cnt <= 0;
end

// 位计数器
always @(posedge clk) begin
    if (rst)  // 复位
        dout_cnt <= 0;
    else if (current_state == SEND)  // 发送状态, 更新位
        dout_cnt <= (div_cnt == FullT) ? dout_cnt + 1 : dout_cnt;
    else  // 等待状态, 清零
        dout_cnt <= 0;
end

// 保存待发送数据
always @(posedge clk) begin
    if (rst)
        temp_data <= 0;
    else if (current_state == WAIT && dout_vld)
        temp_data <= dout_data;
end

endmodule