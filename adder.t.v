`timescale 1 ns / 1 ps
`include "adder.v"

module testFullAdder();
    reg[3:0] a, b;
    wire[3:0] sum;
    wire carryout, overflow;

    // behavioralFullAdder adder (sum, carryout, a, b, carryin);
    FullAdder4bit adder (sum, carryout, overflow, a, b);

    initial begin
        a = 0; b = 0; #100
        $dumpfile("adder.vcd");
        $dumpvars(0, adder);

        $display("  a      b    | Cout  Sum  Overflow | Expected Output");     // Header for the truth table for nAandnB
        a = 4'b0000; b = 4'b0000; #1000
        $display(" %b   %b  |  %b    %b    %b     |   0", a, b, carryout, sum, overflow);
        a = 4'b1111; b = 4'b1111; #1000
        $display(" %b   %b  |  %b    %b    %b     |   -2", a, b, carryout, sum, overflow);
        a = 4'b0001; b = 4'b0001; #1000
        $display(" %b   %b  |  %b    %b    %b     |   2", a, b, carryout, sum, overflow);
        a = 4'b0001; b = 4'b0011; #1000
        $display(" %b   %b  |  %b    %b    %b     |   4", a, b, carryout, sum, overflow);
        a = 4'b0111; b = 4'b1111; #1000
        $display(" %b   %b  |  %b    %b    %b     |   6", a, b, carryout, sum, overflow);
        a = 4'b0100; b = 4'b1110; #1000
        $display(" %b   %b  |  %b    %b    %b     |   2", a, b, carryout, sum, overflow);
        a = 4'b1000; b = 4'b0111; #1000
        $display(" %b   %b  |  %b    %b    %b     |   -1", a, b, carryout, sum, overflow);
        a = 4'b0101; b = 4'b1001; #1000
        $display(" %b   %b  |  %b    %b    %b     |   -2", a, b, carryout, sum, overflow);
        a = 4'b1110; b = 4'b1101; #1000
        $display(" %b   %b  |  %b    %b    %b     |   -5", a, b, carryout, sum, overflow);
        a = 4'b0101; b = 4'b1011; #1000
        $display(" %b   %b  |  %b    %b    %b     |   0", a, b, carryout, sum, overflow);
        a = 4'b0110; b = 4'b0000; #1000
        $display(" %b   %b  |  %b    %b    %b     |   6", a, b, carryout, sum, overflow);
        a = 4'b1011; b = 4'b0000; #1000
        $display(" %b   %b  |  %b    %b    %b     |   -5", a, b, carryout, sum, overflow);
        $display("\nTest Overflow:");
        a = 4'b0011; b = 4'b0110; #1000
        $display(" %b   %b  |  %b    %b    %b     |   9/Overflow", a, b, carryout, sum, overflow);
        a = 4'b0111; b = 4'b0111; #1000
        $display(" %b   %b  |  %b    %b    %b     |   14/Overflow", a, b, carryout, sum, overflow);
        a = 4'b1100; b = 4'b1011; #1000
        $display(" %b   %b  |  %b    %b    %b     |   -9/Overflow", a, b, carryout, sum, overflow);
        a = 4'b1000; b = 4'b1000; #1000
        $display(" %b   %b  |  %b    %b    %b     |   -16/Overflow", a, b, carryout, sum, overflow);
    end
endmodule
