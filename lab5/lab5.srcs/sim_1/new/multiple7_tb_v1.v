`timescale 1ns / 1ps
module Multiple7_tb ();

reg clk = 0, rst = 0, src_valid = 1;
reg [7:0] src;
wire res, res_valid;

Multiple7 m(.clk(clk), .rst(rst), .src(src), .src_valid(src_valid), .res(res), .res_valid(res_valid));

always #1 clk = ~clk;  // 时钟信号

initial begin
    #1;
    for (src = 0; src < 256; src = src + 1) begin
        // 取消复位
        rst = 0;
        src_valid = 1;
        #20;

        // 复位
        rst = 1;
        src_valid = 0;
        #8;
    end
    $finish;
end

endmodule