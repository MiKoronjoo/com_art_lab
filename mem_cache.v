`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.10.2019 22:50:41
// Design Name: 
// Module Name: mem_cache
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


module mem_cache(
    clk,instrction_out,hit
    );

    parameter PROG_LENGTH= 10;
    parameter data_width = 152;
    parameter instruction_in_width = 128;
    parameter set_width = 32;
    reg [set_width-1:0] PC;
    wire [127:0] com;
    input clk;
    output [set_width-1:0] instrction_out;
    output hit;

    initial begin
        PC <= 32'hA75D53D8;
    end

    always @(posedge clk ) begin
        if (hit == 1'b0) begin
            #100;
        end
        PC <= PC + 4'd4;
    end

    insmem 
    #(
        .PROG_LENGTH (PROG_LENGTH )
    )
    u_insmem(
    	.PC          (PC          ),
        .Instruction (com )
    );


    cache 
    #(
        .data_width           (data_width           ),
        .instruction_in_width (instruction_in_width ),
        .set_width            (set_width            )
    )
    u_cache(
    	.PC             (PC             ),
        .clk            (clk            ),
        .instrction_in  (com  ),
        .instrction_out (instrction_out ),
        .hit            (hit            )
    );
    
    
    
endmodule
