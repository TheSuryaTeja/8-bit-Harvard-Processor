module processor(clk);
input clk;

reg [5:0]pc;
reg [31:0] IR;
reg [2:0]type;
reg [7:0]A,B;
reg [15:0]ALU_out;

reg [7:0]regbank[0:31];
reg [7:0]D_mem[0:255];
reg [31:0]I_mem[0:63];

parameter MVI = 6'b000000, MOV = 6'b000001, LOAD = 6'b000010, STORE = 6'b000011, ADD = 6'b000100,
	  SUB = 6'b000101, NEG = 6'b000110, MUL = 6'b000111, DIV = 6'b001000, OR = 6'b001001,
	  XOR = 6'b001010, NAND = 6'b001011, NOR = 6'b001100, NXOR = 6'b001101, NOT = 6'b001110,
	  LLSH = 6'b001111, LRSH = 6'b010000 , HLT = 6'b111111;

parameter im = 3'b000 , rm= 3'b001 ,  ld = 3'b010 , st = 3'b011 , al = 3'b100 , halt = 3'b101;

reg halted;

always @(posedge clk)  //fetch
begin
	if(halted == 0)
	begin
		IR <= I_mem[pc];
		#2 pc <= pc + 1; 
	end
end

always @(IR)//decode
begin
	if(halted == 0)
	begin
		case(IR[31:26])
			MVI : type <= im;
			MOV : type <= rm;
			LOAD : type <= ld;
			STORE : type <= st;
			ADD,SUB,NEG,MUL,DIV,OR,XOR,NAND,NOR,NXOR,NOT,LLSH,LRSH : type <= al;
			HLT : type <=  halt;
			default : type <= halt;
		endcase
	end
end

always@(IR)//EXECUTE
begin
	if(halted == 0)
	begin
		#2
		case(type)
			im : regbank[IR[25:21]] <= IR[7:0];
			rm : regbank[IR[25:21]] <= regbank[IR[4:0]];
			ld : regbank[IR[25:21]] <= D_mem[IR[7:0]];
			st : D_mem[IR[25:18]] <= regbank[IR[4:0]];
			al : begin
					A = regbank[IR[4:0]];
					B = regbank[IR[9:5]];
					case(IR[31:26])
						ADD : ALU_out <=  A + B;
						SUB : ALU_out <=  B - A;
						NEG : ALU_out <=  -A; 
						MUL : ALU_out <=  B*A;
						DIV : ALU_out <=  B/A;
						OR : ALU_out <=   B|A;
						XOR : ALU_out <=  B^A;
						NAND : ALU_out <= ~(B & A);
						NOR : ALU_out <=  ~(B | A);
						NXOR : ALU_out <= ~(B^A);
						NOT : ALU_out <=  ~A;
						LLSH : ALU_out <= B<<A;
						LRSH  : ALU_out <= B>>A;
					endcase
				end
			default : ALU_out <= 16'dX;
		endcase
	end
end

always@(ALU_out)//writeback
begin
	if(halted == 0)
	begin
		case(type)
			al: regbank[IR[25:16]] <= ALU_out;
			halt : halted <= 1;
			default: $display("ERROR at Writeback");
		endcase
	end
end

endmodule



