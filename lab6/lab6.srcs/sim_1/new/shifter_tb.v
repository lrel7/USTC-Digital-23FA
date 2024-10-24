module Shifter_tb ();

reg [31:0] src0;
reg [4:0] src1;
wire [31:0] res1, res2;
reg [31:0] res1_ans, res2_ans;
wire correct_1, correct_2;
Shifter m(.src0(src0), .src1(src1), .res1(res1), .res2(res2));
assign correct_1 = (res1 == res1_ans);
assign correct_2 = (res2 == res2_ans);

initial begin
    src0 = 32'he1fff000; src1 = 32'h00000;
    repeat (32) begin
        res1_ans = src0 >> src1;
        res2_ans = $signed(src0) >>> src1;
        #5 src1 = src1 + 1;
    end
    $finish;
end
    
endmodule