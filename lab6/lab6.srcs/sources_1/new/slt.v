module SLT (
    input  [31:0] a,b,
    output [31:0] res
);

wire [31:0] s;
wire co;

Adder sub(.a(a), .b(~b), .ci(1), .s(s), .co(co));
assign res = (a[31] ^ b[31]) ? {{31{1'b0}}, a[31]} : {{31{1'b0}}, s[31]};

endmodule