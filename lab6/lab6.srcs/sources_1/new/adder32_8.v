module Adder (
    input  [31:0] a, b,
    input         ci,
    output [31:0] s,
    output        co
);

wire co1, co2, co3;

Adder8 m1(.a(a[7:0]), .b(b[7:0]), .ci(ci), .s(s[7:0]), .co(co1));
Adder8 m2(.a(a[15:8]), .b(b[15:8]), .ci(co1), .s(s[15:8]), .co(co2));
Adder8 m3(.a(a[23:16]), .b(b[23:16]), .ci(co2), .s(s[23:16]), .co(co3));
Adder8 m4(.a(a[31:24]), .b(b[31:24]), .ci(co3), .s(s[31:24]), .co(co));

endmodule
