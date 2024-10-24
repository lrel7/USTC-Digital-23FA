`timescale 1ns / 1ps
module Multiple7_tb ();

reg clk = 0, rst = 0, src_valid = 1;
reg [7:0] src;
wire res, res_valid;

Multiple7 m(.clk(clk), .rst(rst), .src(src), .src_valid(src_valid), .res(res), .res_valid(res_valid));

always #1 clk = ~clk;  // 时钟信号

initial begin
    src = 21;
    #8;
    src = 9;
    #13;

    rst = 1;  // 复位
    src_valid = 0;  // 输入无效
    #10;

    rst = 0;
    #4;
    
    src_valid = 1;  // 输入有效
    src = 254;
    #20

    rst = 1;  // 复位
    src_valid = 0;  // 输入无效
    #4;

    rst = 0;
    src_valid = 1;  // 输入有效
    src = 245;
    #30

    $finish;
end

endmodule
