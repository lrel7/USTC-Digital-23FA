`timescale 1ns / 1ps
module ShiftReg_tb();

reg clk = 0, rst = 1;
reg [5:0] sw = 0;
wire [3:0] hex;
wire pulse;
wire [11:0] dout;
always #5 clk = ~clk;

Input in (
    .clk(clk),
    .rst(rst),
    .sw(sw),
    .hex(hex),
    .pulse(pulse)
);

ShiftReg shift_reg (
    .clk(clk),
    .rst(rst),
    .hex(hex),
    .pulse(pulse),
    .dout(dout)
);

initial begin
    #15;
    rst = 0;
    sw[4] = 1;  // 拨上sw[4], dout = 12'h004
    #50;
    sw[1] = 1;  // 拨上sw[1], dout = 12'h041
    #50;
    sw[5] = 1;  // 拨上sw[5], dout = 12'h415
    #50;
    sw[4] = 0;  // 拨下sw[4]
    #50;
    sw[6] = 1;  // 拨上sw[6] 
    #50;
    sw[5] = 0;  // 拨下sw[5]
    #50;
    sw[0] = 1;  // 拨上sw[0], dout = 12'h150
    #50;
    $finish;
end

endmodule
