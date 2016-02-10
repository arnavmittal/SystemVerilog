// 337 TA Provided Lab 2 Testbench
// This code serves as a test bench for the 4 bit adder design 

`timescale 1ns / 100ps

module tb_adder_16bit
();
	// Define local parameters used by the test bench
	localparam NUM_INPUT_BITS			= 16;
	localparam NUM_OUTPUT_BITS		= NUM_INPUT_BITS + 1;
	localparam MAX_OUTPUT_BIT			= NUM_OUTPUT_BITS - 1;
	localparam NUM_TEST_BITS 			= (NUM_INPUT_BITS * 2) + 1;
	localparam MAX_TEST_BIT				= NUM_TEST_BITS - 1;
	localparam NUM_TEST_CASES 		= 2 ** NUM_TEST_BITS;
	localparam MAX_TEST_VALUE 		= NUM_TEST_CASES - 1;
	localparam TEST_A_BIT					= NUM_INPUT_BITS;
	localparam TEST_B_BIT					= NUM_INPUT_BITS * 2;
	localparam TEST_CARRY_IN_BIT	= MAX_TEST_BIT;
	localparam TEST_SUM_BIT				= NUM_INPUT_BITS - 1;
	localparam TEST_CARRY_OUT_BIT	= MAX_OUTPUT_BIT;
	localparam TEST_DELAY					= 10;
	
	// Declare Design Under Test (DUT) portmap signals
        wire	[15:0] tb_a;
	wire	[15:0] tb_b;
	wire	tb_carry_in;
	wire	[15:0] tb_sum;
	wire	tb_carry_out;
	
	// Declare test bench signals
	integer tb_test_case;
	reg [MAX_TEST_BIT:0] tb_test_inputs;
	reg [MAX_OUTPUT_BIT:0] tb_expected_outputs;
	
	// DUT port map
	adder_16bit DUT(.a(tb_a), .b(tb_b), .carry_in(tb_carry_in), .sum(tb_sum), .overflow(tb_carry_out));
	
	// Connect individual test input bits to a vector for easier testing
	assign tb_a					= tb_test_inputs[TEST_A_BIT-1:0];
	assign tb_b					= tb_test_inputs[(TEST_B_BIT-1):TEST_A_BIT];
	assign tb_carry_in	= tb_test_inputs[TEST_CARRY_IN_BIT];
	
	// Test bench process
	initial
	begin
    		// TEST : 1
		tb_test_case = 1;
		// TEST : 1
		$info("/////////////////////TEST CASE %d!", tb_test_case);
		tb_test_inputs[15:0] = 16'h0001;
		tb_test_inputs[31:16] = 16'h0001;
		tb_test_inputs[32] = 1'b0;

		//Adding a delay here
		#1;
			
		// Calculate the expected outputs
		tb_expected_outputs = tb_a + tb_b + tb_carry_in;
			
		// Wait for DUT to process the inputs
		#(TEST_DELAY - 1);
			
		// Check the DUT's Sum output value
		if(tb_expected_outputs[NUM_INPUT_BITS-1:0] == tb_sum)
		begin
		  $info("Correct Sum value for test case %d!", tb_test_case);
		end
		else
		begin
			$error("-------------------------Incorrect Sum value for test case %d!", tb_test_case);
		end
			
		// Check the DUT's Carry Out output value
		if(tb_expected_outputs[TEST_CARRY_OUT_BIT] == tb_carry_out)
		begin
			$info("Correct Carry Out value for test case %d!", tb_test_case);
		end
		else
		begin
			$error("-------------------------Incorrect Carry Out value for test case %d!", tb_test_case);
		end

		// TEST : 2
		tb_test_case = 2;
		// TEST : 2
		$info("/////////////////////TEST CASE %d!", tb_test_case);
		tb_test_inputs[15:0] = 16'hFFFA;
		tb_test_inputs[31:16] = 16'h0001;
		tb_test_inputs[32] = 1'b0;

		//Adding a delay here
		#1;
			
		// Calculate the expected outputs
		tb_expected_outputs = tb_a + tb_b + tb_carry_in;
			
		// Wait for DUT to process the inputs
		#(TEST_DELAY - 1);
			
		// Check the DUT's Sum output value
		if(tb_expected_outputs[NUM_INPUT_BITS-1:0] == tb_sum)
		begin
		  $info("Correct Sum value for test case %d!", tb_test_case);
		end
		else
		begin
			$error("-------------------------Incorrect Sum value for test case %d!", tb_test_case);
		end
			
		// Check the DUT's Carry Out output value
		if(tb_expected_outputs[TEST_CARRY_OUT_BIT] == tb_carry_out)
		begin
			$info("Correct Carry Out value for test case %d!", tb_test_case);
		end
		else
		begin
			$error("-------------------------Incorrect Carry Out value for test case %d!", tb_test_case);
		end

		// TEST : 3
		tb_test_case = 3;
		// TEST : 3
		$info("/////////////////////TEST CASE %d!", tb_test_case);
		tb_test_inputs[15:0] = 16'h1122;
		tb_test_inputs[31:16] = 16'hFD11;
		tb_test_inputs[32] = 1'b0;

		//Adding a delay here
		#1;
			
		// Calculate the expected outputs
		tb_expected_outputs = tb_a + tb_b + tb_carry_in;
			
		// Wait for DUT to process the inputs
		#(TEST_DELAY - 1);
			
		// Check the DUT's Sum output value
		if(tb_expected_outputs[NUM_INPUT_BITS-1:0] == tb_sum)
		begin
		  $info("Correct Sum value for test case %d!", tb_test_case);
		end
		else
		begin
			$error("-------------------------Incorrect Sum value for test case %d!", tb_test_case);
		end
			
		// Check the DUT's Carry Out output value
		if(tb_expected_outputs[TEST_CARRY_OUT_BIT] == tb_carry_out)
		begin
			$info("Correct Carry Out value for test case %d!", tb_test_case);
		end
		else
		begin
			$error("-------------------------Incorrect Carry Out value for test case %d!", tb_test_case);
		end

		// TEST : 4
		tb_test_case = 4;
		// TEST : 4
		$info("/////////////////////TEST CASE %d!", tb_test_case);
		tb_test_inputs[15:0] = 16'hCCCC;
		tb_test_inputs[31:16] = 16'hBBAA;
		tb_test_inputs[32] = 1'b0;

		//Adding a delay here
		#1;
			
		// Calculate the expected outputs
		tb_expected_outputs = tb_a + tb_b + tb_carry_in;
			
		// Wait for DUT to process the inputs
		#(TEST_DELAY - 1);
			
		// Check the DUT's Sum output value
		if(tb_expected_outputs[NUM_INPUT_BITS-1:0] == tb_sum)
		begin
		  $info("Correct Sum value for test case %d!", tb_test_case);
		end
		else
		begin
			$error("-------------------------Incorrect Sum value for test case %d!", tb_test_case);
		end
			
		// Check the DUT's Carry Out output value
		if(tb_expected_outputs[TEST_CARRY_OUT_BIT] == tb_carry_out)
		begin
			$info("Correct Carry Out value for test case %d!", tb_test_case);
		end
		else
		begin
			$error("-------------------------Incorrect Carry Out value for test case %d!", tb_test_case);
		end

		// TEST : 5
		tb_test_case = 5;
		// TEST : 5
		$info("/////////////////////TEST CASE %d!", tb_test_case);
		tb_test_inputs[15:0] = 16'h0011;
		tb_test_inputs[31:16] = 16'h0022;
		tb_test_inputs[32] = 1'b0;

		//Adding a delay here
		#1;
			
		// Calculate the expected outputs
		tb_expected_outputs = tb_a + tb_b + tb_carry_in;
			
		// Wait for DUT to process the inputs
		#(TEST_DELAY - 1);
			
		// Check the DUT's Sum output value
		if(tb_expected_outputs[NUM_INPUT_BITS-1:0] == tb_sum)
		begin
		  $info("Correct Sum value for test case %d!", tb_test_case);
		end
		else
		begin
			$error("-------------------------Incorrect Sum value for test case %d!", tb_test_case);
		end
			
		// Check the DUT's Carry Out output value
		if(tb_expected_outputs[TEST_CARRY_OUT_BIT] == tb_carry_out)
		begin
			$info("Correct Carry Out value for test case %d!", tb_test_case);
		end
		else
		begin
			$error("-------------------------Incorrect Carry Out value for test case %d!", tb_test_case);
		end
		
		// TEST : 6
		tb_test_case = 6;
		// TEST : 6
		$info("/////////////////////TEST CASE %d!", tb_test_case);
		tb_test_inputs[15:0] = 16'hFFFF;
		tb_test_inputs[31:16] = 16'h0001;
		tb_test_inputs[32] = 1'b0;

		//Adding a delay here
		#1;
			
		// Calculate the expected outputs
		tb_expected_outputs = tb_a + tb_b + tb_carry_in;
			
		// Wait for DUT to process the inputs
		#(TEST_DELAY - 1);
			
		// Check the DUT's Sum output value
		if(tb_expected_outputs[NUM_INPUT_BITS-1:0] == tb_sum)
		begin
		  $info("Correct Sum value for test case %d!", tb_test_case);
		end
		else
		begin
			$error("-------------------------Incorrect Sum value for test case %d!", tb_test_case);
		end
			
		// Check the DUT's Carry Out output value
		if(tb_expected_outputs[TEST_CARRY_OUT_BIT] == tb_carry_out)
		begin
			$info("Correct Carry Out value for test case %d!", tb_test_case);
		end
		else
		begin
			$error("-------------------------Incorrect Carry Out value for test case %d!", tb_test_case);
		end
		$info("/////////////////////TEST CASE RANDOM!");

		// Initialize test inputs for DUT
		tb_test_inputs = 0;
		
		// Interative Exhaustive Testing Loop
		for(tb_test_case = 0; tb_test_case < 250; tb_test_case = tb_test_case + 1)
		begin
			// Send test input to the design
			tb_test_inputs = $random();
			
			// Wait for a bit to allow this process to catch up with assign statements triggered
			// by test input assignment above
			#1;
			
			// Calculate the expected outputs
			tb_expected_outputs = tb_a + tb_b + tb_carry_in;
			
			// Wait for DUT to process the inputs
			#(TEST_DELAY - 1);
			
			// Check the DUT's Sum output value
			if(tb_expected_outputs[TEST_SUM_BIT:0] == tb_sum)
			begin
				$info("Correct Sum value for test case %d!", tb_test_case);
			end
			else
			begin
				$error("-------------------------Incorrect Sum value for test case %d!", tb_test_case);
			end
			
			// Check the DUT's Carry Out output value
			if(tb_expected_outputs[TEST_CARRY_OUT_BIT] == tb_carry_out)
			begin
				$info("Correct Carry Out value for test case %d!", tb_test_case);
			end
			else
			begin
				$error("-------------------------Incorrect Carry Out value for test case %d!", tb_test_case);
			end
		end

	end
	
endmodule
