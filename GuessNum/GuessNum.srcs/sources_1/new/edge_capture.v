module EdgeCapture (
    input  clk, rst, sig_in,
    output pos_edge
);
    
reg r1 = 0, r2 = 0, r3 = 0;  // 三级寄存器边沿检测
always @(posedge clk) begin
    if (rst) begin
        r1 <= 0;
        r2 <= 0;
        r3 <= 0;
    end
    else begin
        r1 <= sig_in;
        r2 <= r1;
        r3 <= r2;        
    end
end

assign pos_edge = r2 & (~r3);

endmodule
