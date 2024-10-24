module MUL_4bits_tb ();

reg [3:0] a, b;
reg rst, clk = 0, start;
wire [7:0] res, ans;
wire finish, is_correct;

assign ans = a * b;
assign is_correct = !finish || (finish && (res == ans));

MUL #(.WIDTH(4)) mul(
    .clk        (clk),
    .rst        (rst),
    .start      (start),
    .a          (a),
    .b          (b),
    .res        (res),
    .finish     (finish)
);

always #5 clk = ~clk;

initial begin
    rst = 1;
    start = 0;
    #20;
    rst = 0;
    #10;

    for (a = 7; a <= 7; a = a + 1) begin
        for (b = 0; b <= 15; b = b + 1) begin
            start = 1;
            #20 start = 0;
            #50;            
        end
    end
    $finish;
end
    
endmodule