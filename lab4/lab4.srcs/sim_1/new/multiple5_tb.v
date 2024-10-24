module Multiple5_tb ();

reg [7:0] num;
wire is_multiple5;
reg ans_is_multiple5;
reg is_correct;
reg clk;

Multiple5 m(.num(num), .is_multiple5(is_multiple5));
initial begin
    clk = 0;
    num = 0;
end
always #1 clk = ~clk;

always @(posedge clk) begin
    if (num == 255) begin
        $finish;
    end
    ans_is_multiple5 <= (num % 5 == 0);
    is_correct <= (is_multiple5 == (num % 5 == 0));
    num <= num + 1;
end
    
endmodule
