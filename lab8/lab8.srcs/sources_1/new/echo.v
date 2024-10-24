module Echo (
    input  uart_din,
    output uart_dout
);

assign uart_dout = uart_din;
    
endmodule