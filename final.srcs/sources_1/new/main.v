`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/08/2017 06:49:44 PM
// Design Name: 
// Module Name: main
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

module main(clk, rst, record, play, stop, SDATA, SCLK, nCS, AUD_PWM, AUD_SD, LED);
    output wire [15:0] LED;
    input wire clk;
    input wire rst, record, play, stop;
    input wire SDATA;
    output wire SCLK;
    output wire nCS;
    output wire AUD_PWM;
    output wire AUD_SD;
    
    wire [1:0] state;
    wire [18:0] addr;
    wire [15:0] data;
    wire DONE;
    wire enParalelLoad;
    wire counter_en, mic_en, local_rst;
    wire [11:0] dout;
    wire load_en;
    assign LED = addr[18:3];
    assign AUD_SD = 1;
    state_machine sm(clk, rst, record, play, stop, state);
    decode dcd(state, counter_en, mic_en, local_rst, load_en);
    mic_in SPI_R(clk, local_rst, SDATA, SCLK, nCS, data, mic_en, DONE, enParalelLoad);
    mem_counter mem_c(enParalelLoad, local_rst, counter_en, addr);
    blk_mem_gen_0 mem(clk, mic_en, load_en, addr, data[12:1], dout);
    PWM_gen pg_test(clk, dout[11:1], AUD_PWM);
    
endmodule
