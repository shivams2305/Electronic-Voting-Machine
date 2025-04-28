`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/27/2025 11:48:15 AM
// Design Name: 
// Module Name: TestBench
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


module TestBench(

    );
  reg clock;
  reg reset;
  reg mode;
  reg button1;
  reg button2;
  reg button3;
  reg button4;
  wire [7:0] led;

  votingmachine uut (
    .clk(clock),
    .reset(reset),
    .mode(mode),
    .button1(button1),
    .button2(button2),
    .button3(button3),
    .button4(button4),
    .leds(led)
  );

  initial begin
    clock = 0;
    forever #5 clock = ~clock;
  end

  initial begin
    reset = 1; mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    #100;

    #5 reset = 0; mode = 0; button1 = 1; button2 = 0; button3 = 0; button4 = 0;
    #100 reset = 0; mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    
    #20 reset = 0; mode = 0; button1 = 0; button2 = 1; button3 = 0; button4 = 0;
    #100 reset = 0; mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    
    #20 reset = 0; mode = 0; button1 = 1; button2 = 0; button3 = 0; button4 = 0;
    #100 reset = 0; mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    
    #20 reset = 0; mode = 0; button1 = 0; button2 = 0; button3 = 1; button4 = 0;
    #100 reset = 0; mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    
    #20 reset = 0; mode = 1; button1 = 0; button2 = 0; button3 = 1; button4 = 0;
    #200 reset = 0; mode = 1; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
   
    #20 reset = 0; mode = 1; button1 = 1; button2 = 0; button3 = 0; button4 = 0;
    #200 reset = 0; mode = 1; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    
    #20 reset = 0; mode = 1; button1 = 0; button2 = 1; button3 = 0; button4 = 0;
    #200 reset = 0; mode = 1; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    
    #20 reset = 0; mode = 1; button1 = 0; button2 = 0; button3 = 0; button4 = 1;
    #200 reset = 0; mode = 1; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    
    #20 reset = 1; mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    #100 reset = 0; mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    
    #20 reset = 0; mode = 1; button1 = 1; button2 = 0; button3 = 0; button4 = 0;
    #200 reset = 0; mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;

    #20 $finish;
  end
endmodule
