`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.10.2019 14:32:02
// Design Name: 
// Module Name: cache
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


module cache(PC, instrction_in,instrction_out,hit,clk);
    parameter data_width = 152;
    parameter instruction_in_width = 128;
    parameter set_width = 32;
    input [31:0] PC;
    input clk;
    input [instruction_in_width-1:0] instrction_in;
    output reg [set_width-1:0] instrction_out;
    output reg hit;
    reg [data_width-1:0] cache_file [0:set_width-1];

    initial begin
        hit <= 0; // cold start
    end

    always @(posedge clk) begin        
        if (cache_file[PC[8:4]][151] == 1) begin
            if (cache_file[PC[8:4]][150:128] == PC[31:9] /*tag*/) begin
                hit <= 1;
                case (PC[3:2])
                    2'b00: instrction_out <= cache_file[PC[8:4]][127-31*(2'b00):96-31*(2'b00)];
                    2'b01: instrction_out <= cache_file[PC[8:4]][127-31*(2'b01):96-31*(2'b01)];
                    2'b10: instrction_out <= cache_file[PC[8:4]][127-31*(2'b10):96-31*(2'b10)];
                    2'b11: instrction_out <= cache_file[PC[8:4]][127-31*(2'b11):96-31*(2'b11)];
                    default: 
                    instrction_out <= cache_file[PC[8:4]][127-31*(2'b11):96-31*(2'b11)];
                endcase
            end
        end
        else begin
            hit <= 0;
            cache_file[PC[8:4]] <=  {1'b1,PC[31:9],instrction_in};
            //#100;
        end
    end





endmodule
