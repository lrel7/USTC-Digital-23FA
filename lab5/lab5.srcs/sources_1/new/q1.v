module Regfile (
    input                       clk,          // 时钟信号
    input           [4:0]       ra1,          // 读端口 1 地址
    input           [4:0]       ra2,          // 读端口 2 地址
    input           [4:0]       wa,           // 写端口地址
    input                       we,           // 写使能信号
    input           [31:0]      din,          // 写数据
    output          [31:0]      dout1,        // 读端口 1 数据输出
    output          [31:0]      dout2         // 读端口 2 数据输出
);
// Write your code here

reg [31:0] reg_file [31:0];  // 32个32位寄存器

initial begin
    reg_file[0] = 0;  // 0号寄存器始终为0
end

// 读端口
// 若当前写使能有效, 写端口地址等于读端口地址(且不为0), 则读出正在写的数据
// 否则读出原本数据
assign dout1 = ((we && wa != 0 && wa == ra1) ? din : reg_file[ra1]);
assign dout2 = ((we && wa != 0 && wa == ra2) ? din : reg_file[ra2]);

// 写端口
always @(posedge clk) begin
    if (we && wa != 0) begin  // 写使能信号有效且写端口地址不为0
        reg_file[wa] <= din;
    end    
end

// End of your code
endmodule 
