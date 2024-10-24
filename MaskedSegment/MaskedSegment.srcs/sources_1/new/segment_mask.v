module SegmentMask (
    input        clk, rst,
    output [7:0] output_valid
);

reg [7:0] valid = 8'b1111_1111;
parameter TIME_1HZ = 50_000_000;
// parameter TIME_2HZ = 25_000_000;
reg [26:0] count;

always @(posedge clk) begin
    if (rst)
        count <= 1;
    else
        count <= (count == TIME_1HZ) ? 1 : count + 1;
end

always @(posedge clk) begin
    if (rst) begin
        valid <= 8'b1111_1111;
    end
    // if (second > 3 && second <= 10 && count == TIME_1HZ)
    //     valid <= ~valid;
    // else if (second > 0 && second <= 3 && count % TIME_2HZ == 0)
    //     valid <= ~valid;
    // else
    //     valid <= 8'b1111_1111;
    else if (count == TIME_1HZ)
        valid <= ~valid;
end

assign output_valid = valid;
    
endmodule