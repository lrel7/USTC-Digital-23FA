module Top (
    input        clk, rst, start,
    input  [2:0] a, 
    input  [3:0] b,
    output       seg_an,
    output [3:0] seg_data
);

wire [7:0] res;
wire finish;

MUL #(.WIDTH(4)) m(.clk(clk), .rst(rst), .start(start), .a({1'b0, a}), .b(b), .res(res), .finish(finish));

Segment segment(
    .clk(clk),
    .output_data(res),
    .seg_data(seg_data),
    .seg_an(seg_an)
);
    
endmodule
