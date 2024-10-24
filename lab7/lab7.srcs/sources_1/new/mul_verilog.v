module MUL #(
    parameter WIDTH = 4
) (
    input                    clk, rst, start,
    input      [WIDTH-1:0]   a,b,  // 被乘数和乘数
    output reg [2*WIDTH-1:0] res,
    output reg               finish  
);

always @(posedge clk) begin
    if (rst) begin
        res <= 0;
        finish <= 1'b0;
    end   
    else if (start) begin
        res <= a * b;
        finish <= 1'b1;
    end
    else begin
        finish <= 1'b0;
    end
end
    
endmodule
