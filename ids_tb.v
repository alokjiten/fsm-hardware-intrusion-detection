/////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.06.2025 11:52:44
// Design Name: 
// Module Name: ids_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

module ids_tb;

    reg clk = 0;
    reg reset = 1;
    reg [7:0] signal_pattern = 0;
    reg [7:0] addr = 8'h05;
    wire [7:0] data_out;

    // Instantiate Top Module
    ids_top uut (
        .clk(clk),
        .reset(reset),
        .signal_pattern(signal_pattern),
        .addr(addr),
        .data_out(data_out)
    );

    // Clock Generator
    always #5 clk = ~clk;

    initial begin
        $display("Time\tPattern\tData_out");
        $monitor("%g\t%b\t%h", $time, signal_pattern, data_out);

        #10 reset = 0;

        // No Trojan
        #10 signal_pattern = 8'b00001111;

        // Trojan Detected
        #10 signal_pattern = 8'b10101010;

        // Trojan Cleared
        #20 signal_pattern = 8'b11110000;

        #20 $finish;
    end

endmodule

