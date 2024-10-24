module Top (
    input        clk, rst,
    input  [7:0] sw,
    output [2:0] seg_an,
    output [3:0] seg_data
);

reg [31:0] output_data = 32'h22000197;
Segment segment (
    .clk(clk),
    .rst(rst),
    .output_data(output_data),
    .output_valid(sw),
    .seg_an(seg_an),
    .seg_data(seg_data)
);
    
endmodule