module Receive (
    input      clk, rst,
    input      din,  // 来自用户的串行数据
    output     din_vld,  // 指示当前`din_data`是否有效
    output reg [7:0] din_data  // 数据帧内的8位信息
);

localparam FullT = 867;
localparam HalfT = 433;
localparam TOTAL_BITS = 8;
reg [9:0] div_cnt;  // 分频计数器, 范围0~867
reg [3:0] din_cnt;  // 位计数器, 范围0~8
wire accept_din;  // 位采样信号
wire start;

localparam WAIT = 0;  // 空闲状态
localparam RECEIVE = 1;  // 接收状态
reg current_state = WAIT, next_state = WAIT;

// 1. 状态更新
always @(posedge clk) begin
    if (rst)
        current_state <= WAIT;
    else 
        current_state <= next_state;
end

// 2. 状态转移逻辑
always @(*) begin
    next_state = current_state;
    case (current_state)
        WAIT: next_state = (div_cnt == HalfT) ? RECEIVE : WAIT;  // `div_cnt`数到`HalfT`才转移到接收状态
        RECEIVE: next_state = din_vld ? WAIT : RECEIVE;
    endcase
end

// 3. 输出
always @(posedge clk) begin
    if (rst || current_state == WAIT)  // 复位或空闲状态
        din_data <= 0;
    else if (accept_din)  // 位采样
        din_data <= din_data | (din << din_cnt);
end
assign din_vld = (div_cnt == FullT && din_cnt == 8);  // 8bits数据已接收完

// 分频计数器
always @(posedge clk) begin
    if (rst)
        div_cnt <= 0;
    else if (current_state == RECEIVE)  // 接收状态计数
        div_cnt <= (div_cnt == FullT) ? 0 : div_cnt + 1;
    else if (current_state == WAIT && start)  // 空闲状态且起始信号有效
        div_cnt <= (div_cnt == HalfT) ? 0 : div_cnt + 1;
    else
        div_cnt <= 0;
end

// 位计数器
always @(posedge clk) begin
    if (rst)  // 复位
        din_cnt <= 0;
    else if (current_state == RECEIVE)  // 接收状态, 更新位
        din_cnt <= (div_cnt == FullT) ? din_cnt + 1 : din_cnt;
    else  // 等待状态, 清零
        din_cnt <= 0;
end

// 位采样信号
assign accept_din = (div_cnt == FullT);

// 起始信号
assign start = (current_state == WAIT && din == 0);  // 空闲状态， 且`din`出现低电平
    
endmodule