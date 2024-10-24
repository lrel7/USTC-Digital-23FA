module ALU (
    input  [31:0] src0, src1,
    input  [11:0] sel,
    output [31:0] res
);

wire [31:0] add_out, sub_out, and_out, slt_out, sltu_out, or_out, nor_out, xor_out, sll_out, srl_out, sra_out;
wire co;

Adder add(.a(src0), .b(src1), .ci(0), .s(add_out), .co(co));
Adder sub(.a(src0), .b(~src1), .ci(1), .s(sub_out), .co(co));
SLT slt(.a(src0), .b(src1), .res(slt_out));
assign sltu_out = sub_out[31];
assign and_out = src0 & src1;
assign or_out = src0 | src1;
assign nor_out = ~(src0 | src1);
assign xor_out = src0 ^ src1;
assign sll_out = src0 << src1[4:0];
assign srl_out = src0 >> src1[4:0];
assign sra_out = $signed(src0) >>> src1[4:0];

// 选择运算结果
assign res = ({32{sel[0]}} & add_out) |
             ({32{sel[1]}} & sub_out) |
             ({32{sel[2]}} & slt_out) |
             ({32{sel[3]}} & sltu_out) |
             ({32{sel[4]}} & and_out) |
             ({32{sel[5]}} & or_out) | 
             ({32{sel[6]}} & nor_out) |
             ({32{sel[7]}} & xor_out) |
             ({32{sel[8]}} & sll_out) |
             ({32{sel[9]}} & srl_out) |
             ({32{sel[10]}} & sra_out) |
             ({32{sel[11]}} & src1);

endmodule