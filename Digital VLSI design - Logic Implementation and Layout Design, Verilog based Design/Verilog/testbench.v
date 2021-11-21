`timescale 1ns/10ps
`include "serial_adder.v"
module serial_adder_tb;
    reg [7:0] A,B;
    wire Cout;
    reg Cin;
    reg clock; 
    wire [7:0] Sum;
    reg load;
    serial_adder SA(
        .clock(clock),
        .DA(A),
        .DB(B),
        .Cin1(Cin),
        .Cout(Cout),
        .load(load),
        .Sum(Sum)
        );

    initial
    begin
        $dumpfile("serial_adder.vcd");
        $dumpvars(0, serial_adder_tb);
        #5 A = 8'b00001010; B = 8'b00001111; Cin = 0; load = 1;
        #5 load = 0;
        clock=1'b1;
        forever #5 clock=~clock;
    end
           initial #90
            $finish;

endmodule