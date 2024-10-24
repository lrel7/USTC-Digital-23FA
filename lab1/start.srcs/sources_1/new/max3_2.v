`timescale 1ns / 1ps


module MAX3_2 (
    input      [7:0]    num1, num2, num3,
    output     [7:0]    max
);

wire [7:0] max_12;
MAX2 m1(.num1(num1), .num2(num2), .max(max_12));
MAX2 m2(.num1(max_12), .num2(num3), .max(max));

endmodule
