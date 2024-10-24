module Register #(
    parameter WIDTH = 32
) (
    input                  clk, rst, we,
    input      [WIDTH-1:0] din,
    output reg [WIDTH-1:0] dout
);

always @(posedge clk) begin
    if (rst) begin  // 复位
        dout <= 0;
    end    
    else if (we) begin  // 写使能
        dout <= din;        
    end
end
    
endmodule