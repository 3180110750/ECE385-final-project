module sprite_yellow2 ( input         Clk,                // 50 MHz clock
                             Reset,              // Active-high reset signal
                             frame_clk,          // The clock indicating a new frame (~60Hz)
               input [9:0]   DrawX, DrawY,       // Current pixel coordinates
					input 		  rng,
               output logic  is_sprite_yellow,             // Whether current pixel belongs to ball or background
					output [9:0]  yellow_x_pos, yellow_y_pos
              );
    
    parameter [9:0] Sprite_X_Min = 10'd0;       // Leftmost point on the X axis
    parameter [9:0] Sprite_X_Max = 10'd639;     // Rightmost point on the X axis
    parameter [9:0] Sprite_Y_Min = 10'd0;       // Topmost point on the Y axis
    parameter [9:0] Sprite_Y_Max = 10'd479;     // Bottommost point on the Y axis
    parameter [9:0] Sprite_X_Step = 10'd3;      // Step size on the Y axis
    parameter [9:0] Sprite_Size = 10'd40;        // Ball size
	 
	 logic frame_clk_delayed, frame_clk_rising_edge;
	 logic [9:0] Sprite_X_Pos, Sprite_Y_Pos;
	 logic [9:0] Sprite_X_Motion;
	 logic [9:0] Sprite_X_Pos_in, Sprite_X_Motion_in;
	 
	 assign yellow_x_pos = Sprite_X_Pos;
	 assign yellow_y_pos = Sprite_Y_Pos;
	 
    always_ff @ (posedge Clk) begin
        frame_clk_delayed <= frame_clk;
        frame_clk_rising_edge <= (frame_clk == 1'b1) && (frame_clk_delayed == 1'b0);
    end
	 
	 always_ff @ (posedge Clk) begin
		if (Reset) begin
			Sprite_X_Pos <= 10'd639;
			Sprite_Y_Pos <= 10'd260;
			Sprite_X_Motion <= 0;
		end
		else begin
			Sprite_X_Pos <= Sprite_X_Pos_in;
			Sprite_X_Motion <= Sprite_X_Motion_in;
		end
	 end
	 
	 always_comb begin
		Sprite_X_Motion_in = Sprite_X_Motion;
		Sprite_X_Pos_in = Sprite_X_Pos;
		 if (frame_clk_rising_edge) begin
		 
			if (Sprite_X_Pos < Sprite_X_Min ) begin
				Sprite_X_Pos_in = 10'd639;
				Sprite_X_Motion_in = 10'd0;
			end
			else begin
				Sprite_X_Motion_in = Sprite_X_Motion;
				Sprite_X_Pos_in = Sprite_X_Pos - Sprite_X_Motion;
			end
			
			if (rng == 1'b1 && Sprite_X_Motion == 1'b0) begin
				Sprite_X_Motion_in = Sprite_X_Step;
			end
			
		end
	 end
	 
	 int Sprite_Y_Bound, Sprite_X_Bound;
	 assign Sprite_X_Bound = Sprite_X_Pos + Sprite_Size;
	 assign Sprite_Y_Bound = Sprite_Y_Pos + Sprite_Size;
    always_comb begin
        if (DrawX  >= Sprite_X_Pos && DrawX < Sprite_X_Bound && DrawY >= Sprite_Y_Pos && DrawY < Sprite_Y_Bound && Sprite_X_Motion == Sprite_X_Step) 
            is_sprite_yellow = 1'b1;
        else
            is_sprite_yellow = 1'b0;
    end
    
endmodule
   
	
	
	
module sprite_red2 ( input         Clk,                // 50 MHz clock
                             Reset,              // Active-high reset signal
                             frame_clk,          // The clock indicating a new frame (~60Hz)
               input [9:0]   DrawX, DrawY,       // Current pixel coordinates
					input 		  rng,
               output logic  is_sprite_red,             // Whether current pixel belongs to ball or background
					output [9:0]  red_x_pos, red_y_pos
              );
    
    parameter [9:0] Sprite_X_Min = 10'd0;       // Leftmost point on the X axis
    parameter [9:0] Sprite_X_Max = 10'd639;     // Rightmost point on the X axis
    parameter [9:0] Sprite_Y_Min = 10'd0;       // Topmost point on the Y axis
    parameter [9:0] Sprite_Y_Max = 10'd479;     // Bottommost point on the Y axis
    parameter [9:0] Sprite_X_Step = 10'd3;      // Step size on the Y axis
    parameter [9:0] Sprite_Size = 10'd40;        // Ball size
	 
	 logic frame_clk_delayed, frame_clk_rising_edge;
	 logic [9:0] Sprite_X_Pos, Sprite_Y_Pos;
	 logic [9:0] Sprite_X_Motion;
	 logic [9:0] Sprite_X_Pos_in, Sprite_X_Motion_in;
	 
	 assign red_x_pos = Sprite_X_Pos;
	 assign red_y_pos = Sprite_Y_Pos;
	 
    always_ff @ (posedge Clk) begin
        frame_clk_delayed <= frame_clk;
        frame_clk_rising_edge <= (frame_clk == 1'b1) && (frame_clk_delayed == 1'b0);
    end
	 
	 always_ff @ (posedge Clk) begin
		if (Reset) begin
			Sprite_X_Pos <= 10'd639;
			Sprite_Y_Pos <= 10'd260;
			Sprite_X_Motion <= 0;
		end
		else begin
			Sprite_X_Pos <= Sprite_X_Pos_in;
			Sprite_X_Motion <= Sprite_X_Motion_in;
		end
	 end
	 
	 always_comb begin
		Sprite_X_Motion_in = Sprite_X_Motion;
		Sprite_X_Pos_in = Sprite_X_Pos;
		 if (frame_clk_rising_edge) begin
		 
			if (Sprite_X_Pos < Sprite_X_Min ) begin
				Sprite_X_Pos_in = 10'd639;
				Sprite_X_Motion_in = 10'd0;
			end
			else begin
				Sprite_X_Motion_in = Sprite_X_Motion;
				Sprite_X_Pos_in = Sprite_X_Pos - Sprite_X_Motion;
			end
			
			if (rng == 1'b1 && Sprite_X_Motion == 1'b0) begin
				Sprite_X_Motion_in = Sprite_X_Step;
			end
			
		end
	 end
	 
	 int Sprite_Y_Bound, Sprite_X_Bound;
	 assign Sprite_X_Bound = Sprite_X_Pos + Sprite_Size;
	 assign Sprite_Y_Bound = Sprite_Y_Pos + Sprite_Size;
    always_comb begin
        if (DrawX  >= Sprite_X_Pos && DrawX < Sprite_X_Bound && DrawY >= Sprite_Y_Pos && DrawY < Sprite_Y_Bound && Sprite_X_Motion == Sprite_X_Step) 
            is_sprite_red = 1'b1;
        else
            is_sprite_red = 1'b0;
    end
    
endmodule

module sprite_green2 ( input         Clk,                // 50 MHz clock
                             Reset,              // Active-high reset signal
                             frame_clk,          // The clock indicating a new frame (~60Hz)
               input [9:0]   DrawX, DrawY,       // Current pixel coordinates
					input 		  rng,
               output logic  is_sprite_green,             // Whether current pixel belongs to ball or background
					output [9:0]  green_x_pos, green_y_pos
              );
    
    parameter [9:0] Sprite_X_Min = 10'd0;       // Leftmost point on the X axis
    parameter [9:0] Sprite_X_Max = 10'd639;     // Rightmost point on the X axis
    parameter [9:0] Sprite_Y_Min = 10'd0;       // Topmost point on the Y axis
    parameter [9:0] Sprite_Y_Max = 10'd479;     // Bottommost point on the Y axis
    parameter [9:0] Sprite_X_Step = 10'd3;      // Step size on the Y axis
    parameter [9:0] Sprite_Size = 10'd40;        // Ball size
	 
	 logic frame_clk_delayed, frame_clk_rising_edge;
	 logic [9:0] Sprite_X_Pos, Sprite_Y_Pos;
	 logic [9:0] Sprite_X_Motion;
	 logic [9:0] Sprite_X_Pos_in, Sprite_X_Motion_in;
	 
	 assign green_x_pos = Sprite_X_Pos;
	 assign green_y_pos = Sprite_Y_Pos;
	 
    always_ff @ (posedge Clk) begin
        frame_clk_delayed <= frame_clk;
        frame_clk_rising_edge <= (frame_clk == 1'b1) && (frame_clk_delayed == 1'b0);
    end
	 
	 always_ff @ (posedge Clk) begin
		if (Reset) begin
			Sprite_X_Pos <= 10'd639;
			Sprite_Y_Pos <= 10'd260;
			Sprite_X_Motion <= 0;
		end
		else begin
			Sprite_X_Pos <= Sprite_X_Pos_in;
			Sprite_X_Motion <= Sprite_X_Motion_in;
		end
	 end
	 
	 always_comb begin
		Sprite_X_Motion_in = Sprite_X_Motion;
		Sprite_X_Pos_in = Sprite_X_Pos;
		 if (frame_clk_rising_edge) begin
		 
			if (Sprite_X_Pos < Sprite_X_Min) begin
				Sprite_X_Pos_in = 10'd639;
				Sprite_X_Motion_in = 10'd0;
			end
			else begin
				Sprite_X_Motion_in = Sprite_X_Motion;
				Sprite_X_Pos_in = Sprite_X_Pos - Sprite_X_Motion;
			end
			
			if (rng != 1'b0 && rng == 1'b1 && Sprite_X_Motion == 1'b0 ) begin
				Sprite_X_Motion_in = Sprite_X_Step;
			end
			
		end
	 end
	 
	 int Sprite_Y_Bound, Sprite_X_Bound;
	 assign Sprite_X_Bound = Sprite_X_Pos + Sprite_Size;
	 assign Sprite_Y_Bound = Sprite_Y_Pos + Sprite_Size;
    always_comb begin
        if (DrawX  >= Sprite_X_Pos && DrawX < Sprite_X_Bound && DrawY >= Sprite_Y_Pos && DrawY < Sprite_Y_Bound && Sprite_X_Motion == Sprite_X_Step) 
            is_sprite_green = 1'b1;
        else
            is_sprite_green = 1'b0;
    end
    
endmodule



module sprite_blue2 ( input         Clk,                // 50 MHz clock
                             Reset,              // Active-high reset signal
                             frame_clk,          // The clock indicating a new frame (~60Hz)
               input [9:0]   DrawX, DrawY,       // Current pixel coordinates
					input 		  rng,
               output logic  is_sprite_blue,             // Whether current pixel belongs to ball or background
					output [9:0]  blue_x_pos, blue_y_pos
              );
    
    parameter [9:0] Sprite_X_Min = 10'd0;       // Leftmost point on the X axis
    parameter [9:0] Sprite_X_Max = 10'd639;     // Rightmost point on the X axis
    parameter [9:0] Sprite_Y_Min = 10'd0;       // Topmost point on the Y axis
    parameter [9:0] Sprite_Y_Max = 10'd479;     // Bottommost point on the Y axis
    parameter [9:0] Sprite_X_Step = 10'd3;      // Step size on the Y axis
    parameter [9:0] Sprite_Size = 10'd40;        // Ball size
	 
	 logic frame_clk_delayed, frame_clk_rising_edge;
	 logic [9:0] Sprite_X_Pos, Sprite_Y_Pos;
	 logic [9:0] Sprite_X_Motion;
	 logic [9:0] Sprite_X_Pos_in, Sprite_X_Motion_in;
	 
	 assign blue_x_pos = Sprite_X_Pos;
	 assign blue_y_pos = Sprite_Y_Pos;
	 
    always_ff @ (posedge Clk) begin
        frame_clk_delayed <= frame_clk;
        frame_clk_rising_edge <= (frame_clk == 1'b1) && (frame_clk_delayed == 1'b0);
    end
	 
	 always_ff @ (posedge Clk) begin
		if (Reset) begin
			Sprite_X_Pos <= 10'd639;
			Sprite_Y_Pos <= 10'd260;
			Sprite_X_Motion <= 0;
		end
		else begin
			Sprite_X_Pos <= Sprite_X_Pos_in;
			Sprite_X_Motion <= Sprite_X_Motion_in;
		end
	 end
	 
	 always_comb begin
		Sprite_X_Motion_in = Sprite_X_Motion;
		Sprite_X_Pos_in = Sprite_X_Pos;
		 if (frame_clk_rising_edge) begin
		 
			if (Sprite_X_Pos < Sprite_X_Min) begin
				Sprite_X_Pos_in = 10'd639;
				Sprite_X_Motion_in = 10'd0;
			end
			else begin
				Sprite_X_Motion_in = Sprite_X_Motion;
				Sprite_X_Pos_in = Sprite_X_Pos - Sprite_X_Motion;
			end
			
			if (rng == 1'b1 && Sprite_X_Motion == 1'b0) begin
				Sprite_X_Motion_in = Sprite_X_Step;
			end
			
		end
	 end
	 
	 int Sprite_Y_Bound, Sprite_X_Bound;
	 assign Sprite_X_Bound = Sprite_X_Pos + Sprite_Size;
	 assign Sprite_Y_Bound = Sprite_Y_Pos + Sprite_Size;
    always_comb begin
        if (DrawX  >= Sprite_X_Pos && DrawX < Sprite_X_Bound && DrawY >= Sprite_Y_Pos && DrawY < Sprite_Y_Bound && Sprite_X_Motion == Sprite_X_Step) 
            is_sprite_blue = 1'b1;
        else
            is_sprite_blue = 1'b0;
    end
    
endmodule
