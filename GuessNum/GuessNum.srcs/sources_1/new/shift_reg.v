module ShiftReg (
    input             clk, rst,
    input      [3:0]  hex,
    input             pulse,
    output reg [11:0] dout
);

always @(posedge clk) begin
    if (rst)
        dout <= 0;
    else if (pulse)
        dout <= {dout[7:0], hex};
end
    
endmodule