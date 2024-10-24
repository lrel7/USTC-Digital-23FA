module Adder (
    input  [31:0] a, b,
    input         ci,
    output [31:0] s,
    output        co
);

wire co1, co2, co3, co4, co5, co6, co7;

Adder4 m1(.a(a[3:0]), .b(b[3:0]), .ci(ci), .s(s[3:0]), .co(co1));
Adder4 m2(.a(a[7:4]), .b(b[7:4]), .ci(co1), .s(s[7:4]), .co(co2));
Adder4 m3(.a(a[11:8]), .b(b[11:8]), .ci(co2), .s(s[11:8]), .co(co3));
Adder4 m4(.a(a[15:12]), .b(b[15:12]), .ci(co3), .s(s[15:12]), .co(co4));
Adder4 m5(.a(a[19:16]), .b(b[19:16]), .ci(co4), .s(s[19:16]), .co(co5));
Adder4 m6(.a(a[23:20]), .b(b[23:20]), .ci(co5), .s(s[23:20]), .co(co6));
Adder4 m7(.a(a[27:24]), .b(b[27:24]), .ci(co6), .s(s[27:24]), .co(co7));
Adder4 m8(.a(a[31:28]), .b(b[31:28]), .ci(co7), .s(s[31:28]), .co(co));

endmodule
