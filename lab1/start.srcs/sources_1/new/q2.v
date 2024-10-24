`timescale 1ns / 1ps

module q2( 
    input  [7:0]        a, b, 
    output [7:0]        c, d, e, f, g, h, i, j, k, l
); 
assign c = a & b; 
assign d = a || b; 
assign e = a ^ b; 
assign f = ~a; 
assign g = {a[2:0], b[3:0], {1'b1}}; 
assign h = b >>> 3; 
assign i = &b; 
assign j = (a > b) ? a : b; 
assign k = a - b; 
assign l = !a;
endmodule