module q2_tb ();
    
reg [1:0] a;
reg [1:0] b;
wire [1:0] out;
wire cout;
wire [1:0] ans_out;
wire ans_cout;

Adder2bit m (.a(a), .b(b), .out(out), .cout(cout));
assign {ans_cout, ans_out} = a + b + 0;

initial begin
    a = 2'b00;
    b = 2'b10;
    #5;
    a = 2'b00;
    b = 2'b11;
    #5;
    a = 2'b01;
    b = 2'b00;
    #5;
    a = 2'b01;
    b = 2'b01;
    #5;
    a = 2'b10;
    b = 2'b11;
    #5;
    a = 2'b11;
    b = 2'b00;
    #5;
    a = 2'b01;
    b = 2'b10;
    #5;
    a = 2'b01;
    b = 2'b11;
    #5;
    a = 2'b10;
    b = 2'b00;
    #5;
    a = 2'b10;
    b = 2'b01;
    #5;
    a = 2'b00;
    b = 2'b00;
    #5;
    a = 2'b00;
    b = 2'b01;
    #5;
    a = 2'b10;
    b = 2'b10;
    #5;
    a = 2'b11;
    b = 2'b01;
    #5;
    a = 2'b11;
    b = 2'b10;
    #5;
    a = 2'b11;
    b = 2'b11;
    #5;
    $finish;
end

endmodule
