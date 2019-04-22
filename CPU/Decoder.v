module Decoder( instr_op_i, RegWrite_o,	ALUOp_o, ALUSrc_o, RegDst_o ,Branch_o,BranchType_o,Jump_o,MemRead_o,MemWrite_o,MemtoReg_o);
     
//I/O ports
input	[6-1:0] instr_op_i;

output			RegWrite_o;
output	[3-1:0] ALUOp_o;
output			ALUSrc_o;
output			RegDst_o;
 
//Internal Signals
wire	[3-1:0] ALUOp_o;
wire			ALUSrc_o;
wire			RegWrite_o;
wire			RegDst_o;

//lab4
output Branch_o,BranchType_o,Jump_o,MemRead_o,MemWrite_o,MemtoReg_o;
wire Branch_o,BranchType_o,Jump_o,MemRead_o,MemWrite_o,MemtoReg_o;

//Main function
/*your code here*/
	assign RegWrite_o=(instr_op_i==6'b111111||instr_op_i==6'b110111||instr_op_i==6'b110000||instr_op_i==6'b100001||instr_op_i==6'b100111)?1:0;
	assign ALUOp_o=(instr_op_i==6'b111111)?3'b010:
			(instr_op_i==6'b110111)?3'b100:
			(instr_op_i==6'b110000)?3'b101:
			(instr_op_i==6'b100001)?3'b000:
			(instr_op_i==6'b100011)?3'b000:
			(instr_op_i==6'b111011)?3'b001:
			(instr_op_i==6'b100101)?3'b110:3'b110;
	assign ALUSrc_o=(instr_op_i==6'b111111||instr_op_i==6'b111011||instr_op_i==6'b100101)?0:1;
	assign RegDst_o=(instr_op_i==6'b111111)?1:0;
	
	assign Branch_o=(instr_op_i==6'b111011||instr_op_i==6'b100101)?1:0;
	assign BranchType_o=(instr_op_i==6'b111011)?0:1;
	assign Jump_o=(instr_op_i==6'b100010)?1:0;
	assign MemRead_o=(instr_op_i==6'b100001)?1:0;
	assign MemWrite_o=(instr_op_i==6'b100011)?1:0;
	assign MemtoReg_o=(instr_op_i==6'b100001)?1:0;

endmodule
   