module Top (
    input        clk,
    input        btn,
    output [2:0] seg_an,
    output [3:0] seg_data
);

Segment segment(
    .clk(clk),
    .rst(rst),
    .output_data(32'h22000197),
    .seg_data(seg_data),
    .seg_an(seg_an)
);
    
endmodule