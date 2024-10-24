module Timer (
    input         clk, rst,
    input         set,  // 设置起始值为01分00秒000毫秒
    input         en,  // 有效时计时器才持续倒计时
    output [7:0]  minute, second,
    output [11:0] micro_second,
    output        finish  // 计时器值为0时为高电平
);

/*状态机*/
localparam OFF = 0;
localparam ON = 1;
reg current_state = OFF, next_state = OFF;

// 1. 状态更新
always @(posedge clk) begin
    if (rst)
        current_state <= OFF;
    else
        current_state <= next_state;
end

// 2. 状态转移逻辑
always @(*) begin
    next_state = current_state;
    case (current_state)
        OFF: next_state = en ? ON : OFF;
        ON: next_state = (~en || finish) ? OFF : ON; 
    endcase
end

/*串行计时模块*/
localparam TIME_1MS = 100_000_000 / 1000;
reg [31:0] counter_1ms = 1;
wire carry_in[2:0];

// 计数器, 每1ms复位一次
always @(posedge clk) begin
    if (rst)
        counter_1ms <= 1;
    else
        counter_1ms <= (counter_1ms == TIME_1MS) ? 1 : counter_1ms + 1;
end

// 根据1ms计数器产生最低位的进位信号
assign carry_in[0] = (counter_1ms == TIME_1MS);

Clock #(
    .WIDTH(8),
    .MIN_VALUE(0),
    .MAX_VALUE(59),
    .SET_VALUE(1)
) minute_clock (
    .clk(clk),
    .rst(rst),
    .set(set),
    .carry_in(carry_in[2]),
    .carry_out(finish),
    .value(minute)
);

Clock #(
    .WIDTH(8),
    .MIN_VALUE(0),
    .MAX_VALUE(59),
    .SET_VALUE(0)
) second_clock (
    .clk(clk),
    .rst(rst),
    .set(set),
    .carry_in(carry_in[1]),
    .carry_out(carry_in[2]),
    .value(second)
);

Clock #(
    .WIDTH(12),
    .MIN_VALUE(0),
    .MAX_VALUE(999),
    .SET_VALUE(0)
) micro_second_clock (
    .clk(clk),
    .rst(rst),
    .set(set),
    .carry_in(carry_in[0]),
    .carry_out(carry_in[1]),
    .value(micro_second)
);
    
endmodule