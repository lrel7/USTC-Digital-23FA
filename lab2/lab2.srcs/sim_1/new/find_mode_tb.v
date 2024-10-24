`timescale 1ns / 1ps
`define CYCLE 5

module FindMode_tb ();

reg clk, rst, next;
reg [7:0] number;
wire [7:0] out;

// 例化FindMode模块
FindMode fm (
    .clk(clk),
    .rst(rst),
    .next(next),
    .number(number),
    .out(out)
);

// 生成时钟信号(10ns一周期)
always #(`CYCLE) clk = ~clk;

initial begin
    clk = 1;
    rst = 1;
    next = 0;
    #(`CYCLE * 4);

    rst = 0;
    #(`CYCLE * 2);

    // 输入第一个数字10
    next = 1;
    number = 10;
    #(`CYCLE * 2);

    next = 0;
    #(`CYCLE * 2);

    // 输入第二个数字20
    next = 1;
    number = 20;
    #(`CYCLE * 2);

    next = 0;
    #(`CYCLE * 2);

    // 输入第三个数字30
    next = 1;
    number = 30;
    #(`CYCLE * 2);

    next = 0;
    #(`CYCLE * 2);

    // 输入第四个数字10
    next = 1;
    number = 10;
    #(`CYCLE * 2);

    next = 0;
    #(`CYCLE * 2);

    // 输入第五个数字10
    next = 1;
    number = 10;
    #(`CYCLE * 2);

    next = 0;
    #(`CYCLE * 2);

    // 输入第六个数字20
    next = 1;
    number = 20;
    #(`CYCLE * 2);

    next = 0;
    #(`CYCLE * 2);

    // 输入第七个数字30
    next = 1;
    number = 30;
    #(`CYCLE * 2);

    next = 0;
    #(`CYCLE * 2);

    // 输入第八个数字30
    next = 1;
    number = 30;
    #(`CYCLE * 2);

    next = 0;
    #(`CYCLE * 2);

    // 输入第九个数字30
    next = 1;
    number = 30;
    #(`CYCLE * 2);

    next = 0;
    #(`CYCLE * 2);

    // 输入第十个数字10
    next = 1;
    number = 10;
    #(`CYCLE * 2);

    next = 0;
    #(`CYCLE * 2);

    // 输入第十一个数字10
    next = 1;
    number = 10;
    #(`CYCLE * 2);

    next = 0;
    #(`CYCLE * 2);

    // 输入第十二个数字10
    next = 1;
    number = 10;
    #(`CYCLE * 2);

    next = 0;
    #(`CYCLE * 10);
end

endmodule
