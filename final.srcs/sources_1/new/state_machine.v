`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/08/2017 07:51:14 PM
// Design Name: 
// Module Name: state_machine
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

`define IDLE 0;
`define RECORD 1;
`define PLAY 2;

module state_machine(clk, rst, record, play, stop, state);
    
    input wire clk;
    input wire stop;
    input wire rst;
    input wire record, play;
    output reg [1:0] state;
    
    
    initial begin
        state <= 0;
    end
    
    always @ (posedge(clk)) begin
        if (rst) begin
            state <= 0;
        end
        else begin
            case(state) 
                0: begin
                    if (record) begin
                        state <= 1;
                    end
                    else if (play) begin
                        state <= 2;
                    end
                    else state <= state;
                end
                1: begin
                    if (stop) begin
                        state <= 0;
                    end
                    else state <= state;
                end
                2: begin
                    if (stop) begin
                        state <= 0;
                    end
                    else state <= state;
                end
            endcase
        end
    end
    
endmodule
