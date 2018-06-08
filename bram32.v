module bram32 #(
	parameter init_file = "hex_instr.hex",
	parameter adr_width = 11
) (
	input sys_clk,
	input sys_rst,
	
  input [31:0] do,
  output reg [31:0] di,
  input we,
  input [15:0] a
);

//-----------------------------------------------------------------
// Storage depth in 32 bit words
//-----------------------------------------------------------------
parameter word_width = adr_width - 2;
parameter word_depth = (1 << word_width);

//-----------------------------------------------------------------
// Actual RAM
//-----------------------------------------------------------------
reg [31:0] ram [0:word_depth-1];
wire [word_width-1:0] adr;

always @(posedge sys_clk) begin
  if (we) begin
    ram[adr] <= do;
  end
	di <= ram[adr];
end

assign adr = a[adr_width-1:2];

//-----------------------------------------------------------------
// RAM initialization
//-----------------------------------------------------------------
initial
begin
	if (init_file != "hex_instr.hex")
	begin
		$readmemh(init_file, ram);
	end
end

endmodule
