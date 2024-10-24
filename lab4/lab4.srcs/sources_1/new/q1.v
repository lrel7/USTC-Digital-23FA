module Encode (
    input      [3:0] I,
    output reg [1:0] Y,
    output reg       en
);

always @(*) begin
    en = 1'b1;
    casez (I)
        4'b1???: Y = 2'b11;
        4'b01??: Y = 2'b10;
        4'b001?: Y = 2'b01;
        4'b0001: Y = 2'b00; 
        default begin
            Y = 2'b00;
            en = 1'b0;
        end
    endcase 
end
    
endmodule
