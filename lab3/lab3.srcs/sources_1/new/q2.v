// 平台上时钟为1MHz, 要求LED[7:0]亮0.5s, 灭0.5s
module Flash (
    input            clk,
    input            btn,
    output reg [7:0] led 
);

wire [7:0] flag;

Counter #(
    .MAX_VALUE(32'd50000000)
) counter (
    .clk(clk),
    .rst(btn),
    .out(flag)
);
initial led = {8{1'b0}};  // 初始化led为8位的0
always @(posedge clk) begin
    if (btn) begin
        led <= {8{1'b0}};
    end
    else if (flag) begin
        led <= ~led;        
    end
end
    
endmodule
