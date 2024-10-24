`timescale 1ns / 1ps

module Count4Ones(
    input      [2:0] in,
    output reg [1:0] out
);

always @(*) begin
    out = 2'b0;
    case (in)
        3'b001: out = 2'b01;
        3'b010: out = 2'b01;
        3'b011: out = 2'b10;
        3'b100: out = 2'b01;
        3'b101: out = 2'b10;
        3'b110: out = 2'b10;
        3'b111: out = 2'b11;
    endcase    
end

endmodule



