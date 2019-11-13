`timescale 1ns / 1ps

module insmem(PC,// PC (address) of instruction in IMem
            Instruction);
  parameter PROG_LENGTH= 10;
  //-------------Input Ports-----------------------------
  input [31:0] PC;
  reg [31:0] select;
  //-------------Output Ports----------------------------
  output reg [127:0] Instruction;
  genvar i;
  //------------Code Starts Here-------------------------

  
  always @(PC) begin
      Instruction <= {out(PC),out(PC+4'd4),out(PC+4'd8),out(PC+4'd12)};
      #100;
  end


  function [31:0] out; 
    input [31:0] sel;
    begin
    case(sel % PROG_LENGTH)
      0: out=  32'b110010_00000_00000_0000000000000001;
      1: out=  32'b110010_00001_00001_0000000000000001;
      2: out= 32'b010101_00000_00001_00010_00000000000;
      3: out=  32'b010010_00010_00000_00011_00000000000;
      4: out= 32'b010110_00001_00011_00100_00000000000;
      5: out= 32'b010111_00011_00100_00101_00000000000;
      6: out= 32'b000001_00000_00000_0000000000000010;
      7: out=  32'b010010_00011_00011_00110_00000000000;
      8: out=  32'b010010_00011_00011_00110_00000000000;
      9: out=  32'b111110_00011_00100_0000000000000001;
      10: out= 32'b111101_00011_00111_0000000000000001;
      default: out= 0; //NOOP
    endcase 
  end
endfunction

endmodule
