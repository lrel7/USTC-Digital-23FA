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

    // 输入第一个数字1
    next = 1;
    number = 1;
    #(`CYCLE * 2);

    next = 0;
    #(`CYCLE * 2);

    // 输入第二个数字1
    next = 1;
    number = 1;
    #(`CYCLE * 2);

    next = 0;
    #(`CYCLE * 2);

    // 输入第三个数字2
    next = 1;
    number = 2;
    #(`CYCLE * 2);

    next = 0;
    #(`CYCLE * 2 - 2);

    // 复位
    rst = 1;
    #(`CYCLE * 2 + 2);

    // 输入第四个数字3
    next = 1;
    number = 3;
    #(`CYCLE * 2 - 3);
    rst = 0;
    #(`CYCLE * 2 + 3);

    next = 0;
    #(`CYCLE * 2);

    // 输入第五个数字3
    next = 1;
    number = 1;
    #(`CYCLE * 2);

    next = 0;
    #(`CYCLE * 2);

    // 输入第六个数字1
    next = 1;
    number = 1;
    #(`CYCLE * 2);

    next = 0;
    #(`CYCLE * 2);


    // 输入第七个数字4
    next = 1;
    number = 4;
    #(`CYCLE * 2);

    next = 0;
    #(`CYCLE * 2);

    // 输入第八个数字4
    next = 1;
    number = 4;
    #(`CYCLE * 2);

    next = 0;
    #(`CYCLE * 2);

    // 输入第九个数字4
    next = 1;
    number = 4;
    #(`CYCLE * 2);

    next = 0;
    #(`CYCLE * 2);

    // 复位
    #(3);
    rst = 1;
    #(`CYCLE * 2 - 3);
    $finish;
end

endmodule
