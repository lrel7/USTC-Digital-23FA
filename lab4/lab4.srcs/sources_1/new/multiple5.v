module Multiple5 (
    input      [7:0] num,
    output reg       is_multiple5
);

wire [1:0] a = num[1:0];
wire [1:0] b = num[3:2];
wire [1:0] c = num[5:4];
wire [1:0] d = num[7:6];
wire [2:0] sum_ac;
wire [2:0] sum_bd;

Adder2bit m1(.a(a), .b(c), .cout(sum_ac[2]), .out(sum_ac[1:0]));
Adder2bit m2(.a(b), .b(d), .cout(sum_bd[2]), .out(sum_bd[1:0]));

always @(*) begin
    is_multiple5 = (sum_ac == sum_bd) || (sum_ac == 1 && sum_bd == 6) || (sum_ac == 6 && sum_bd == 1) || 
                    (sum_ac == 0 && sum_bd == 5) || (sum_ac == 5 && sum_bd == 0);
end
    
endmodule
