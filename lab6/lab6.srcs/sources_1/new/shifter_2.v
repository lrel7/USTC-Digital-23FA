module Shifter (
    input      [31:0] src0,
    input      [4:0]  src1,
    output reg [31:0] res1,  // 逻辑右移
    output reg [31:0] res2   // 算术右移
);

always @(*) begin
    res1 = src0; res2 = src0;  // 默认值
    if (src1[4]) begin  // 右移16位
        res1 = {16'b0, res1[31:16]}; res2 = {{16{src0[31]}}, res2[31:16]};
    end
    if (src1[3]) begin  // 右移8位
        res1 = {8'b0, res1[31:8]}; res2 = {{8{src0[31]}}, res2[31:8]};       
    end
    if (src1[2]) begin  // 右移4位
        res1 = {4'b0, res1[31:4]}; res2 = {{4{src0[31]}}, res2[31:4]};
    end
    if (src1[1]) begin  // 右移2位
        res1 = {2'b0, res1[31:2]}; res2 = {{2{src0[31]}}, res2[31:2]};
    end
    if (src1[0]) begin  // 右移1位
        res1 = {1'b0, res1[31:1]}; res2 = {src0[31], res2[31:1]};
    end
end
    
endmodule