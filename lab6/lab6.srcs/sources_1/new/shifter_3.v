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
    
    case (src1[3:2])
        2'b01: begin  // 右移4位
            res1 = {4'b0, res1[31:4]}; res2 = {{4{src0[31]}}, res2[31:4]};
        end 
        2'b10: begin  // 右移8位
            res1 = {8'b0, res1[31:8]}; res2 = {{8{src0[31]}}, res2[31:8]};
        end 
        2'b11: begin  // 右移12位
            res1 = {12'b0, res1[31:12]}; res2 = {{12{src0[31]}}, res2[31:12]};
        end 
    endcase

    case (src1[1:0])
        2'b01: begin  // 右移1位
            res1 = {1'b0, res1[31:1]}; res2 = {src0[31], res2[31:1]};
        end 
        2'b10: begin  // 右移2位
            res1 = {2'b0, res1[31:2]}; res2 = {{2{src0[31]}}, res2[31:2]};
        end 
        2'b11: begin  // 右移3位
            res1 = {3'b0, res1[31:3]}; res2 = {{3{src0[31]}}, res2[31:3]};
        end 
    endcase

end
    
endmodule