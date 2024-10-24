module ProductReg #(
    parameter WIDTH = 32
) (
    input                  clk, rst, set, en,
    input      [2*WIDTH:0] din,
    output reg [2*WIDTH:0] dout
);

always @(posedge clk) begin
    if (rst) begin  // 复位
        dout <= 0;
    end    
    else if (set && en) begin  // 先置数再右移(用于CALC阶段)
        dout <= {1'b0, din[2*WIDTH:WIDTH], dout[WIDTH-1:1]};
    end
    else if (set) begin  // 只置数(用于INIT阶段)
        dout <= din;
    end
    else if (en) begin  // 只右移(用于CALC阶段)
        dout <= {1'b0, dout[2*WIDTH:1]};                
    end
end
    
endmodule