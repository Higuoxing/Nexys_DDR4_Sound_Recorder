`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/08/2017 07:38:11 PM
// Design Name: 
// Module Name: mem_counter
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


module mem_counter(clk, rst, en, cnt);

    input wire clk;
    input wire rst;
    input wire en;
 
    output reg [18:0] cnt;
    
    initial begin
        cnt <= 0;
    end
    
    always @ (posedge(clk)) begin
        if (rst) begin
            cnt <= 0;
        end
        else if (en) begin
            cnt <= cnt + 1;
        end
        else cnt <= 0;
    end

endmodule
