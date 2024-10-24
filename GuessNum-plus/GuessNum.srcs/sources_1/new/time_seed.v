module TimeSeed (
    input        clk,
    output [7:0] seed
);

reg [7:0] tick = 0;

always @(posedge clk) begin
    tick <= tick + 1;
end

assign seed = tick;
    
endmodule