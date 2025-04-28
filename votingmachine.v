`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.07.2024 21:30:00
// Design Name: 
// Module Name: voting
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


module votingmachine(
    input reset,
    input clk,
    input mode,
    input button1,
    input button2,
    input button3,
    input button4,
    output [7:0] leds
);
    wire any_valid_vote;
    wire valid_vote1;
    wire valid_vote2;
    wire valid_vote3;
    wire valid_vote4;
    wire [7:0] candidate1;
    wire [7:0] candidate2;
    wire [7:0] candidate3;
    wire [7:0] candidate4;
    
    buttonControl bc1(reset,clk,button1,valid_vote1); 
    buttonControl bc2(reset,clk,button2,valid_vote2); 
    buttonControl bc3(reset,clk,button3,valid_vote3); 
    buttonControl bc4(reset,clk,button4,valid_vote4); 
    assign any_valid_vote=valid_vote1|valid_vote2|valid_vote3|valid_vote4;
    vote_logger candidates_register(reset,clk,mode,valid_vote1,valid_vote2,valid_vote3,valid_vote4,candidate1,candidate2,candidate3,candidate4);
    
    modeControl mC(reset,clk,mode,any_valid_vote,valid_vote1,valid_vote2,valid_vote3,valid_vote4,candidate1,candidate2,candidate3,candidate4,leds);
endmodule

module buttonControl(
    input reset,
    input clk,
    input button,
    output reg valid_vote
    );
    
    reg [30:0] counter;
    always@(posedge clk or posedge reset) begin
        if(reset) counter=0;
        else if(button & counter<11)
            counter=counter+1;
        else if(!button) counter=0;
    end 
    always@(posedge clk or posedge reset) begin
        if(reset) valid_vote=0;
        else begin
            if(counter==10) valid_vote=1;
            else valid_vote=0;
        end
    end
endmodule

module vote_logger(
    input reset,
    input clk,
    input mode,
    input valid_vote1,
    input valid_vote2,
    input valid_vote3,
    input valid_vote4,
    output reg [7:0] candidate1,
    output reg [7:0] candidate2,
    output reg [7:0] candidate3,
    output reg [7:0] candidate4
);
    always@(posedge clk or posedge reset) begin
        if(reset) begin
            candidate1=0;
            candidate2=0;
            candidate3=0;
            candidate4=0;
        end
        else if(mode==0) begin
            if(valid_vote1) candidate1=candidate1+1;
            else if(valid_vote2) candidate2=candidate2+1;
            else if(valid_vote3) candidate3=candidate3+1;
            else if(valid_vote4) candidate4=candidate4+1;
        end
    end
endmodule

module modeControl(
    input reset,
    input clk,
    input mode,
    input any_valid_vote,
    input valid_vote1,
    input valid_vote2,
    input valid_vote3,
    input valid_vote4,
    input [7:0] candidate1,
    input [7:0] candidate2,
    input [7:0] candidate3,
    input [7:0] candidate4,
    output reg [7:0] leds
);
    always@(posedge clk or posedge reset) begin
        if(reset) leds=0;
        else if(mode==0 & any_valid_vote) leds=8'hFF;
        else if(mode==0 & !any_valid_vote) leds=8'h00;
        else if(mode==1) begin
            if(valid_vote1) leds=candidate1;
            else if(valid_vote2) leds=candidate2;
            else if(valid_vote3) leds=candidate3;
            else if(valid_vote4) leds=candidate4;
            else leds=0;
        end            
    end
endmodule