`timescale 1ns / 1ps

module test;
    reg [7:0] num1, num2;
    wire [7:0] max;

    // 实例化 MAX2 模块
    MAX2 max2_inst (
        .num1(num1),
        .num2(num2),
        .max(max)
    );

    // 时钟生成（如果需要）
    // always begin
    //     #5 clk = ~clk;
    // end

    // 生成输入数据
    initial begin
        num1 = 8'b10101010; // 用您需要的值替换这些示例值
        num2 = 8'b11001100;
        
        // 延迟一些时间以观察输出
        #10;

        // 显示输入和输出值
        $display("num1 = %h, num2 = %h, max = %h", num1, num2, max);

        // 模拟完成
        $finish;
    end
endmodule
