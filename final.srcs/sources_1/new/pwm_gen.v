`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/08/2017 06:51:38 PM
// Design Name: 
// Module Name: pwm_gen
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


module PWM_gen( 
    input clk,
    input [10:0] PWM_in, 
    output reg PWM_out
    );
    
    reg [10:0]new_pwm=0;
    reg [10:0] PWM_ramp=0; 
    
    always @(posedge clk) begin
        if (PWM_ramp==0) new_pwm<=PWM_in;
            PWM_ramp <= PWM_ramp + 1'b1;
            PWM_out<=(new_pwm>PWM_ramp);
    end

endmodule