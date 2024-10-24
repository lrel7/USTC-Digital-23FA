module MUL_Signed #(
    parameter WIDTH = 32
) (
    input                clk, rst, start,
    input  [WIDTH-1:0]   a, b,
    output [2*WIDTH-1:0] res,
    output               finish
);

wire [WIDTH-1:0] a_abs, b_abs;  // a和b的绝对值
wire [2*WIDTH-1:0] result, result_reverse;
wire co;

assign a_abs = (a[WIDTH-1]) ? (~a + 1) : a;  // 如果是负数需要取反加1, 如果是正数则不变
assign b_abs = (b[WIDTH-1]) ? (~b + 1) : b;

MUL #(.WIDTH(WIDTH)) m(.clk(clk), .rst(rst), .start(start), .a(a_abs), .b(b_abs), .res(result), .finish(finish));
Adder sub(.a(0), .b(~result), .ci(1), .s(result_reverse), .co(co));  // 取result的相反数

assign res = (a[WIDTH-1] == b[WIDTH-1]) ? result : result_reverse;  // a和b若符号相反, 则结果取反, 否则不变

endmodule