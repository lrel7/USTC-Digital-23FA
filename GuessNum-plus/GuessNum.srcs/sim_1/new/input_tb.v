`timescale 1ns / 1ps
module Input_tb();

reg clk = 0, rst = 1;
reg [7:0] sw = 0;
wire [3:0] hex;
wire pulse;
always #5 clk = ~clk;

Input in (
    .clk(clk),
    .rst(rst),
    .sw(sw),
    .hex(hex),
    .pulse(pulse)
);

initial begin
    #15;
    rst = 0;
    sw[4] = 1;  // 拨上sw[4]
    #50;
    sw[1] = 1;  // 拨上sw[1]
    #50;
    sw[5] = 1;  // 拨上sw[5]
    #50;
    sw[4] = 0;  // 拨下sw[4]
    #50;
    sw[6] = 1;  // 拨上sw[6]
    #50;
    sw[5] = 0;  // 拨下sw[5]
    #50;
    $finish;
end

endmodule
