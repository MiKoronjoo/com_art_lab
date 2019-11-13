`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.10.2019 15:18:57
// Design Name: 
// Module Name: regfile
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


module regfile(write_data,
                          read_data_1, read_data_2,
                          read_sel_1, read_sel_2,
                          write_address, RegWrite, clk
    );

    parameter data_width = 32;
    parameter select_width = 5;

    input clk, RegWrite;
    input [data_width-1:0] write_data;
    input [select_width-1:0] read_sel_1, read_sel_2, write_address;
    output [data_width-1:0] read_data_1, read_data_2;

    reg [data_width-1:0] register_file [0:data_width-1];

    assign read_data_1 = register_file[read_sel_1];
    assign read_data_2 = register_file[read_sel_2];

    always @( posedge clk ) begin
        if (RegWrite) begin
            register_file[write_address] <= write_data;
        end
    end
    



endmodule
