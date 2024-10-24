module Clock #(
    parameter WIDTH = 32,
    parameter MIN_VALUE = 0,
    parameter MAX_VALUE = 999,
    parameter SET_VALUE = 500
) (
    input                  clk, rst, set,
    input                  carry_in,  // 来自低位的进位信号
    output                 carry_out,  // 向高位的进位信号
    output reg [WIDTH-1:0] value,
    output reg             changed  // 指示数值发生变化
);


always @(posedge clk) begin
    if (rst) begin  // 复位
        value <= 0;
        changed <= 0;
    end
    else if (set) begin  // 置位
        value <= SET_VALUE;
        changed <= 1;
    end
    else if (carry_in) begin  // 仅在`carry_in`有效时倒计时一次
        value <= (value == MIN_VALUE) ? MAX_VALUE : value - 1;
        changed <= 1;
    end
    else
        changed <= 0;
end

assign carry_out = (carry_in) && (value == MIN_VALUE);  // 产生向高位的进位信号
    
endmodule