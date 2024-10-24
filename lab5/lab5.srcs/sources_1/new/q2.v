`timescale 1ns / 1ps
module Timer (
    input        clk, rst,
    output [3:0] seg_data,
    output [2:0] seg_an
);

reg [3:0] h;  // 小时
reg [3:0] m1;  // 分钟十位
reg [3:0] m0;  // 分钟个位
reg [3:0] s1;  // 秒钟十位
reg [3:0] s0;  // 秒钟个位
reg [26:0] count;  // 计数器
parameter SECOND = 100000000;  // 1秒中的时钟周期数

initial begin
    h = 0;
    m1 = 0;
    m0 = 0;
    s1 = 0;
    s0 = 0;
    count = 0;
end

// 计数器, 每一个小时复位一次
always@ (posedge clk) begin
    if (rst) begin
        count <= 1;
    end
    else begin
        if (count != SECOND)  // 1h
            count <= count + 1;
        else
            count <= 1;
    end
end

/*使用 Lab3 实验练习中编写的数码管显示模块*/
Segment segment(
    .clk                (clk),
    .rst                (rst),
    .output_data        ({h, m1, m0, s1, s0}),
    .seg_data           (seg_data),
    .seg_an             (seg_an)
);

always@ (posedge clk) begin
    // 复位值: 1h23min45s
    if (rst) begin
        h <= 1;
        m1 <= 2;
        m0 <= 3;
        s1 <= 4;
        s0 <= 5;
    end
    else if (count == SECOND) begin
        s0 <= (s0 != 9) ? s0 + 1 : 0;  // 更新秒钟个位
        s1 <= (s0 != 9) ? s1 : (s1 != 5) ? s1 + 1 : 0;  // 更新秒钟十位(若个位不是9, 则保持; 否则若自己不是5, 直接加1, 否则置0)
        m0 <= (s1 != 5 || s0 != 9) ? m0 : (m0 != 9) ? m0 + 1 : 0;  // 更新分钟个位(若秒钟不是59, 则保持; 否则若自己不是9, 直接加1, 否则置0)
        m1 <= (m0 != 9) ? m1 : (m1 != 5) ? m1 + 1 : 0;  // 更新分钟十位(若个位不是9, 则保持; 否则若自己不是5, 直接加1, 否则置0)
        h <= (m1 != 5 || m0 != 9 || s1 != 5 || s0 != 9) ? h : (h != 9) ? h + 1 : 0;  // 更新时钟(若不是59m59s, 则保持; 否则若自己不是9, 直接加1, 否则置0)
    end
end

endmodule
