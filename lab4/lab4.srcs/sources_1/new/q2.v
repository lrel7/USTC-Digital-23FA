module Adder2bit (
    input      [1:0] a,
    input      [1:0] b,
    output reg [1:0] out,
    output reg       cout
);

always @(*) begin
    cout = (a[1] && b[1]) || (a[1] && a[0] && b[0]) || (a[0] && b[1] && b[0]);
    out[1] = (a[1] && !b[1] && !b[0]) || (a[1] && !a[0] && !b[1]) || (!a[1] && !a[0] && b[1]) ||
                (!a[1] && b[1] && !b[0]) || (!a[1] && a[0] && !b[1] && b[0]) || (a[1] && a[0] && b[1] && b[0]);
    out[0] = (a[0] && !b[0]) || (!a[0] && b[0]);
end
    
endmodule
