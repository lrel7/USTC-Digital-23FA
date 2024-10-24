`timescale 1ns / 1ps

module test_q2;

reg  [7:0] a, b;
wire [7:0] c, d, e, f, g, h, i, j, k, l;

q2 q2_inst (
    .a(a),
    .b(b),
    .c(c),
    .d(d),
    .e(e),
    .f(f),
    .g(g),
    .h(h),
    .i(i),
    .j(j),
    .k(k),
    .l(l)
);

// 生成输入数据
initial begin
    a = 8'b00110011;
    b = 8'b11110000;
    
    // 延迟一些时间以观察输出
    #10;

    // 显示输入和输出值
    // $display("num1 = %h, num2 = %h, max = %h", num1, num2, max);

    // 模拟完成
    $finish;
end
endmodule
