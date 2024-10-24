`timescale 1ns / 1ps

module test;
    reg [7:0] num1, num2, num3;
    wire [7:0] max;

    // 实例化 MAX2 模块
    MAX3_2 max3_inst (
        .num1(num1),
        .num2(num2),
        .num3(num3),
        .max(max)
    );

    // 时钟生成（如果需要）
    // always begin
    //     #5 clk = ~clk;
    // end

    // 生成输入数据
    initial begin
        num1 = 4'b1110; // 用您需要的值替换这些示例值
        num2 = 8'b11001100;
        num3 = 2'b10;
        // 延迟一些时间以观察输出
        #10;

        // 显示输入和输出值
        $display("num1 = %h, num2 = %h, num3 = %h, max = %h", num1, num2, num3, max);

        // 模拟完成
        $finish;
    end
endmodule
