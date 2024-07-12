`timescale 1ns / 1ps
`include "DE2_S11andS13_G62.v"
module MainTestBench;

    parameter CLK_PERIOD = 10;  

    reg [2:0] D1, D2, D3, D4, D5, D6;  // Input signals for dice values
    wire P1, P2, P3, P4, P5, P6;       // Output signals for prizes

    Main uut (
        .D1(D1),
        .D2(D2),
        .D3(D3),
        .D4(D4),
        .D5(D5),
        .D6(D6),
        .P1(P1),
        .P2(P2),
        .P3(P3),
        .P4(P4),
        .P5(P5),
        .P6(P6)
    );

    // Test stimuli
    initial begin
        // Reset inputs

        $dumpfile("DE2_S11andS13_G62_tb.vcd");
        $dumpvars(0, MainTestBench);

        D1 = 0; D2 = 2; D3 = 3; D4 = 2; D5 = 1; D6 = 2;
        #10;

        // Test case 1: Single specific value
        D1 = 3'b100;
        #10;
        $display("Test Case 1: P = %b%b%b%b%b%b", P1, P2, P3, P4, P5, P6); 

        // Test case 2: Two specific values
        D2 = 3'b100;
        #10;
        $display("Test Case 2: P = %b%b%b%b%b%b", P1, P2, P3, P4, P5, P6); 

        D3 = 3'b100;
        #10;
        $display("Test Case 3: P = %b%b%b%b%b%b", P1, P2, P3, P4, P5, P6); 

        D4 = 3'b100;
        #10;
        $display("Test Case 4: P = %b%b%b%b%b%b", P1, P2, P3, P4, P5, P6); 

        D5 = 3'b100;
        #10;
        $display("Test Case 5: P = %b%b%b%b%b%b", P1, P2, P3, P4, P5, P6); 

        // Test case 5: Five 4s
        D5 = 3'b100;
        #10;
       $display("Test case 5: Five 4s = %b%b%b%b%b%b", P1,P2,P3,P4,P5,P6); 
        
        // Test case 6: 
        D5 = 3'b000;
        #10;
       $display("Test case 6: One 0 = %b%b%b%b%b%b", P1,P2,P3,P4,P5,P6); 

        // Test case 6: 
        D5 = 3'b111;
        #10;
       $display("Test case 7: One 7 = %b%b%b%b%b%b", P1,P2,P3,P4,P5,P6); 

        $finish;
    end

endmodule
