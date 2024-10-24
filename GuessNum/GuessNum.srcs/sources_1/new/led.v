module FLOW_LED (
    input            clk,
    input            rst,
    output reg [7:0] led 
);

reg [31:0] count_1hz;
parameter TIME_CNT = 50_000_000;  // 计数器上限

// 计数器
always @(posedge clk) begin
    if (rst) 
        count_1hz <= 0;
    else if (count_1hz >= TIME_CNT)
        count_1hz <= 0;
    else
        count_1hz <= count_1hz + 1;
end

// led灯控制
always @(posedge clk) begin
    if (rst) 
        led <= 8'b0000_1111;
    else if (count_1hz == 1) begin
        led <= {led[6:0], led[7]};  // 让led信号的最高位挪到最低位, 其余位顺次左移
    end
end

endmodule