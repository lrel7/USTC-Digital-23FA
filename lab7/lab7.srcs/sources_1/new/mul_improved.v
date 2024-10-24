module MUL #(
    parameter WIDTH = 32
) (
    input  clk, rst, start,
    input  [WIDTH-1:0]   a, b,
    output [2*WIDTH-1:0] res,
    output finish
);

wire [WIDTH-1:0] multiplicand;  // 被乘数寄存器的输出
wire [2*WIDTH:0] product;  // 乘积寄存器的输出
wire [WIDTH:0] sum;  // 被乘数寄存器和乘积寄存器高WIDTH位相加的和
wire [2*WIDTH:0] product_reg_input;  // 乘积寄存器的置数输入
wire reg_init, reg_shift_right, reg_write, finish, init_or_write;


// 被乘数寄存器(写使能)
Register #(.WIDTH(WIDTH)) r1(.clk(clk), .rst(rst), .din(a), .we(reg_init), .dout(multiplicand));
// 乘积寄存器(右移)
ProductReg #(.WIDTH(WIDTH)) r2(.clk(clk), .rst(rst), .din(product_reg_input), .set(init_or_write), .en(reg_shift_right), .dout(product));
// 加法器
assign sum = multiplicand + product[2*WIDTH:WIDTH];
// 控制电路
Control #(
    .N(WIDTH)
)c(
    .clk(clk), .rst(rst), .start(start), .lsb(product[0]), 
    .reg_init(reg_init), .reg_shift_right(reg_shift_right), 
    .reg_write(reg_write), .finish(finish)
);

assign init_or_write = reg_init | reg_write;
assign product_reg_input = reg_init ? {{(WIDTH+1){1'b0}}, b} : {sum, {WIDTH{1'b0}}};  // 确定乘积寄存器的置数输入
assign res = product;  // 结果
    
endmodule