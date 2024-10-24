module Flash (
    input        clk, rst,
    output [2:0] seg_an,
    output [3:0] seg_data
);

reg [31:0] output_data = 32'h22000197;
wire [7:0] output_valid;

SegmentMask segment_mask (
    .clk(clk),
    .rst(rst),
    .output_valid(output_valid)
);

Segment segment (
    .clk(clk),
    .rst(rst),
    .output_data(output_data),
    .output_valid(output_valid),
    .seg_an(seg_an),
    .seg_data(seg_data)
);
    
endmodule