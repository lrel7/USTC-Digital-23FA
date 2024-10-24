`timescale 1ps / 1ps
module q3_debug();

reg clk;
reg btn;
wire [2:0] seg_an;
wire [3:0] seg_data;
initial clk = 0;
always #(5) clk = ~clk;
initial btn = 0;

Top top(
    .clk(clk),
    .btn(btn),
    .seg_an(seg_an),
    .seg_data(seg_data)
);

endmodule
