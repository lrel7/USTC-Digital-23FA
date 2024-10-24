module ALU_tb ();

reg [31:0] src0, src1;
reg [11:0] sel;
wire [31:0] res;
reg [31:0] ans;
wire is_correct;

ALU alu(.src0(src0), .src1(src1), .sel(sel), .res(res));
assign is_correct = (res == ans);

initial begin
    src0 = 32'haef51372; src1 = 32'h7f34bdca;

    sel = 12'h001;  // ADD
    ans = src0 + src1;
    #5;

    sel = 12'h002;  // SUB
    ans = src0 - src1;
    #5;

    sel = 12'h004;  // SLT
    ans = $signed(src0) < $signed(src1);
    #5;

    sel = 12'h008;  // SLTU
    ans = src0 < src1;
    #5;

    sel = 12'h010;  // AND
    ans = src0 & src1;
    #5;

    sel = 12'h020;  // OR
    ans = src0 | src1;
    #5;
    
    sel = 12'h040;  // NOR
    ans = ~(src0 | src1);
    #5;

    sel = 12'h080;  // XOR
    ans = src0 ^ src1;
    #5;

    sel = 12'h100;  // SLL
    ans = src0 << src1[4:0];
    #5;

    sel = 12'h200;  // SRL
    ans = src0 >> src1[4:0];
    #5;

    sel = 12'h400;  // SRA
    ans = $signed(src0) >>> src1[4:0];
    #5;

    sel = 12'h800;  // SRC1
    ans = src1;
    #5;

    $finish;
end
    
endmodule