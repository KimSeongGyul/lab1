
module tb_top();

reg [3:0] data_in [15:0];

wire [3:0] data_out [15:0];

initial begin 
	$readmemb("vector.txt", data_in);
	for(i = 0, i<16, i++) begin 
		#1 
		top T1(.bin_before(data_in[i]), .bin_after(data_out[i]));			
	end		
end

//instantiate thr top module 
top T1(.bin_before(data_in), .bin_after(data_out));

endmodule