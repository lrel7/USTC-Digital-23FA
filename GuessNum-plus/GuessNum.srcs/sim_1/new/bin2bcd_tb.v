module BIN2BCD_tb  ();

reg clk = 0, rst = 1, start = 0;
always #5 clk = ~clk;

reg [11:0] bin;
wire [11:0] bcd;
wire done;

BIN2BCD #(.BIN_WIDTH(12)) bin2bcd (
    .clk(clk),
    .rst(rst),
    .start(start),
    .bin(bin),
    .bcd(bcd),
    .done(done)
);

initial begin
    #15;
    rst = 0;
    start = 1; 
    bin = 12'ha;  // bcd = 010
    #10;
    start = 0;
    #300;
    start = 1; 
    bin = 12'h3e7;  // bcd = 999
    #10;
    start = 0;
    #300;
    start = 1;
    bin = 12'h1af;  // bcd = 431
    #10;
    start = 0;
    #300;
    start = 1;
    bin = 12'h3b;  // bcd = 059
    #10;
    start = 0;
    #300;
    $finish;
end
    
endmodule