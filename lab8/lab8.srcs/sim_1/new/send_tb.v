`timescale 1ns / 1ps
module Send_tb();
reg clk, rst, dout_vld;
reg [7:0] dout_data;
wire dout;

initial begin
    rst = 1;
    #10;
    rst = 0;
end

initial begin
    clk = 0;
    forever begin
        #5 clk = ~clk;
    end
end

initial begin
    dout_vld = 0;
    #50;
    dout_vld = 1;
    dout_data = "0";
    #100;
    dout_vld = 0;
    dout_data = 0;
    #100000;
    $finish;
end

Send send (
    .clk            (clk), 
    .rst            (rst),
    .dout           (dout),
    .dout_vld       (dout_vld),
    .dout_data      (dout_data)
);
endmodule
