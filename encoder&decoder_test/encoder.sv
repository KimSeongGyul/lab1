module encoder(
	bin,
	gray
);

input [3:0] bin;

output reg [3:0]gray;

always_comb begin 
	if(bin[1]) gray[0] = ~bin[0];
	else gray[0] = bin[0];
end

always_comb begin 
	if(bin[2]) gray[1] = ~bin[1];
	else gray[1] = bin[1];
end

always_comb begin 
	if(bin[3]) gray[2] = ~bin[2];
	else gray[2] = bin[2];
end

always_comb begin 
	gray[3] = bin[3];
end

endmodule