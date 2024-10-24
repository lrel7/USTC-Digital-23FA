`timescale 1ns / 1ps
module q1_tb ();

reg clk;
reg [4:0] ra1;
reg [4:0] ra2;
reg [4:0] wa;
reg we;
reg [31:0] din;
wire [31:0] dout1;
wire [31:0] dout2;

// 时钟信号
initial clk = 0;
always #5 clk = ~clk;

Regfile m(.clk(clk), .ra1(ra1), .ra2(ra2), .wa(wa), .we(we), .din(din), .dout1(dout1), .dout2(dout2));

initial begin
    #5;
    // 向R31写入100, 同时读出R0和R31
    ra1 = 0;
    ra2 = 31;
    wa = 31;
    we = 1;
    din = 100; 
    #10;

    // 向R18写入9, 同时读出R18和R31
    ra1 = 18;
    wa = 18;
    din = 9;
    #10;

    // 向R5写入23, 同时读出R18和R31
    wa = 5;
    din = 23;
    #10;

    // 向R0写入76, 同时读出R18和R31
    wa = 0;
    din = 76;
    #10;

    // 停止写入, 读出R0和R5
    ra1 = 0;
    ra2 = 5;
    we = 0;
    #10;

    $finish;
end

endmodule
