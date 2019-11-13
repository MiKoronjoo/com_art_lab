`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.10.2019 14:31:04
// Design Name: 
// Module Name: ControlUnit
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


module ControlUnit(
    Opcode,ALUSrc,RegDst,ALUOp,MemWrite,Branch,RegWrite,MemRead,MemtoReg
    );
    output ALUSrc;
    output RegDst;
    output [1:0] ALUOp;
    output MemWrite;
    output MemRead;
    output Branch;
    output RegWrite;
    output MemtoReg;
    input [5:0] Opcode;
    case (Opcode)
        6'b00000: begin
            assign {ALUSrc,RegDst,ALUOp,MemWrite,MemRead,Branch,RegWrite,MemtoReg} = {0,1,2'b10,0,0,0,1,0};
          end
          6'b10011: begin
            assign {ALUSrc,RegDst,ALUOp,MemWrite,MemRead,Branch,RegWrite,MemtoReg} = {1,0,2'b00,0,1,0,1,1};
          end
          6'b101011: begin
            assign {ALUSrc,RegDst,ALUOp,MemWrite,MemRead,Branch,RegWrite,MemtoReg} = {0,1'bx,2'b00,1,0,0,0,1'bx};
          end
          6'b000100: begin
            assign {ALUSrc,RegDst,ALUOp,MemWrite,MemRead,Branch,RegWrite,MemtoReg} = {0,1'bx,2'b01,0,0,1,0,1'bx};
          end
          6'b00100: begin
            assign {ALUSrc,RegDst,ALUOp,MemWrite,MemRead,Branch,RegWrite,MemtoReg} = {1,0,2'b00,0,0,0,1,0};
          end 
          default: begin
            assign {ALUSrc,RegDst,ALUOp,MemWrite,MemRead,Branch,RegWrite,MemtoReg} = {0,1,2'b10,0,0,0,1,0};
          end
    endcase
endmodule
