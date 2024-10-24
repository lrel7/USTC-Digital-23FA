module ShiftReg #(
    parameter WIDTH = 32,
    parameter MODE = 0  // 0表示左移, 1表示右移
) (
    input                  clk, rst, set, en,
    input      [WIDTH-1:0] din,
    output reg [WIDTH-1:0] dout
);

always @(posedge clk) begin
    if (rst) begin  // 复位
        dout <= 0;
    end    
    else if (set) begin  // 置位
        dout <= din;
    end
    else if (en) begin  // 移位
        if (MODE) begin  // 右移
            dout <= {1'b0, dout[WIDTH-1:1]};                
        end
        else begin  // 左移
            dout <= {dout[WIDTH-2:0], 1'b0};
        end
    end
end
    
endmodule