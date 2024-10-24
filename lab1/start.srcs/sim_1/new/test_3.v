`timescale 1ns / 1ps

module test;
    reg [2:0] in;
    wire [1:0] out;

    // 实例化 MAX2 模块
    Count4Ones count_inst (
        .in(in),
        .out(out)
    );

    // 时钟生成（如果需要）
    // always begin
    //     #5 clk = ~clk;
    // end

    // 生成输入数据
    initial begin
        in = 3'b111; 
        #5;
        in = 3'b110;
        #5;
        in = 3'b101;
        #5;
        in = 3'b100;
        #5;
        in = 3'b011;
        #5;
        in = 3'b010;
        #5;
        in = 3'b001;
        #5;
        in = 3'b000;
        #5;
        $finish;
    end
endmodule
