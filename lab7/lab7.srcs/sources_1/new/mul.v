module MUL #(
    parameter WIDTH = 32
) (
    input                clk, rst, start,
    input  [WIDTH-1:0]   a,b,  // 被乘数和乘数
    output [2*WIDTH-1:0] res,
    output               finish  
);

wire [2*WIDTH-1:0] multiplicand;  // 被乘数寄存器的输出
wire [WIDTH-1:0] multiplier;  // 乘数寄存器的输出
wire [2*WIDTH-1:0] sum;  // 被乘数寄存器和乘积寄存器相加的和
wire [2*WIDTH-1:0] product;  // 乘积寄存器的输出
wire reg_init, reg_shift_left, reg_shift_right, reg_write, finish, rst_or_init;

// 被乘数寄存器(左移)
ShiftReg #(.WIDTH(2*WIDTH), .MODE(0)) r1(.clk(clk), .rst(rst), .din({{WIDTH{1'b0}},a}), .set(reg_init), .en(reg_shift_left), .dout(multiplicand));
// 乘数寄存器(右移)
ShiftReg #(.WIDTH(WIDTH), .MODE(1)) r2(.clk(clk), .rst(rst), .din(b), .set(reg_init), .en(reg_shift_right), .dout(multiplier));
// 乘积寄存器(写使能)
Register #(.WIDTH(2*WIDTH)) r(.clk(clk), .rst(rst_or_init), .din(sum), .we(reg_write), .dout(product));
// 加法器
assign sum = multiplicand + product;
// 控制电路
Control #(
    .N(WIDTH)
)c(
    .clk(clk), .rst(rst), .start(start), .lsb(multiplier[0]), 
    .reg_init(reg_init), .reg_shift_left(reg_shift_left), .reg_shift_right(reg_shift_right), 
    .reg_write(reg_write), .finish(finish)
);

assign rst_or_init = reg_init | rst;
assign res = product;

endmodule