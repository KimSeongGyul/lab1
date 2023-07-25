module top(
	bin_before,
	bin_after
);

input [3:0] bin_before;

output [3:0] bin_after;

wire [3:0] gray;

// instantiate decoder
decoder U1(.bin(bin_before), .gray(gray));

// instantiate encoder
encoder U2(.gray(gray), .bin(bin_after));

endmodule