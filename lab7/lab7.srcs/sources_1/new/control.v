module Control #(
    parameter N = 32
)(
    input  clk, rst, start, lsb,
    output reg_init, reg_shift_left, reg_shift_right, reg_write, finish
);
    
localparam IDLE = 2'b00;  // 空闲状态, 保持各寄存器的值不变, start=1时跳转到INIT
localparam INIT = 2'b01;  // 初始化各寄存器的值, 下个周期跳转到CALC
localparam CALC = 2'b10;  // 计算中, 计算完成后跳转到DONE
localparam DONE = 2'b11;  // 计算完成, 下个周期跳转到IDLE
reg [1:0] current_state = IDLE, next_state;
integer count = 0;  // 移位次数记录

// 状态更新
always @(posedge clk) begin
    if (rst) begin  // 复位
        current_state <= IDLE;
    end
    else begin  // 转移到下一个状态
        current_state <= next_state;
        count <= current_state == CALC ? count + 1 : 0;  // 更新移位次数count
    end
end

// 状态转移
always @(*) begin
    next_state = current_state;    
    case (current_state)
        IDLE: next_state = start ? INIT : IDLE;
        INIT: next_state = CALC;
        CALC: next_state = count == (N - 1) ? DONE : CALC;
        DONE: next_state = IDLE;
    endcase
end

// 输出
assign reg_init = current_state == INIT;
assign reg_shift_left = current_state == CALC;
assign reg_shift_right = current_state == CALC;
assign reg_write = (current_state == CALC) && lsb;  // 乘数寄存器最低位为1时才对乘积寄存器写入
assign finish = current_state == DONE;

endmodule