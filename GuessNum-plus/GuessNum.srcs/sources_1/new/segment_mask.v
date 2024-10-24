module SegmentMask (
    input         clk, rst,
    input  [7:0]  second,
    input  [11:0] micro_second,
    output [7:0]  output_valid
);

reg [7:0] valid = 8'b1111_1111;
parameter TIME_1HZ = 50_000_000;
parameter TIME_2HZ = 25_000_000;
reg [26:0] count;

always @(posedge clk) begin
    if (rst)
        count <= 1;
    else
        count <= (count == TIME_1HZ) ? 1 : count + 1;
end

always @(posedge clk) begin
    if (rst || second > 10 || (second == 0 && micro_second == 0))
        valid <= 8'b1111_1111;
    else if (second > 3 && second <= 10 && count == TIME_1HZ)
        valid <= ~valid;
    else if (second <= 3 && count % TIME_2HZ == 0)
        valid <= ~valid;
end

assign output_valid = valid;
    
endmodule