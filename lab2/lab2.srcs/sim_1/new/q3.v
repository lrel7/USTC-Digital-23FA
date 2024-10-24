`timescale 1ns / 1ps
`define CLOCK_CYCLE 5

module Module_tb ();

// 产生时钟信号
reg clk = 0, a, b;
reg [2:0] c;

initial clk = 1;
always #(`CLOCK_CYCLE) clk = ~clk;

initial begin
    #(`CLOCK_CYCLE * 2);
    a = 1;
    b = 0;
    c = 1;

    #(`CLOCK_CYCLE * 2);
    b = 1;

    #(`CLOCK_CYCLE);
    b = 0;

    #(`CLOCK_CYCLE);
    c = 2;

    #(`CLOCK_CYCLE * 2);
    a = 0;
    b = 1;

    #(`CLOCK_CYCLE * 2);
    a = 1;
    c = 3;

    #(`CLOCK_CYCLE * 4);
    a = 0;
    b = 0;

    #(`CLOCK_CYCLE);
    b = 1;

    #(`CLOCK_CYCLE);
    a = 1;
    c = 4;

    #(`CLOCK_CYCLE * 2);
    b = 0;
end

endmodule
