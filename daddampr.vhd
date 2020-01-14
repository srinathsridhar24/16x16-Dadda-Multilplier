library ieee;
use ieee.std_logic_1164.all;

entity daddampr is 
	port (A: in std_logic_vector(15 downto 0);
			B: in std_logic_vector(15 downto 0);
			P: out std_logic_vector(31 downto 0));
end daddampr;

architecture arch_daddampr of daddampr is 
	component my_and is 
		port (ip1: in std_logic;
				ip2: in std_logic;
				opt: out std_logic);
	end component;
	
	component full_adder is 
		port (A,B,C: in std_logic;
			sum, Cout: out std_logic);
	end component;
	
	component half_adder is 
		port (a,b : in std_logic;
			sha: out std_logic;
			cha: out std_logic);
	end component;
	
	component bkadder is 
		port (A, B: in std_logic_vector(31 downto 0);
				sum: out std_logic_vector(31 downto 0);
				Cout: out std_logic);
	end component;

--partial product signals	
signal pp1: std_logic_vector(15 downto 0);
signal pp2: std_logic_vector(16 downto 1);
signal pp3: std_logic_vector(17 downto 2);
signal pp4: std_logic_vector(18 downto 3);
signal pp5: std_logic_vector(19 downto 4);
signal pp6: std_logic_vector(20 downto 5);
signal pp7: std_logic_vector(21 downto 6);
signal pp8: std_logic_vector(22 downto 7);
signal pp9: std_logic_vector(23 downto 8);
signal pp10: std_logic_vector(24 downto 9);
signal pp11: std_logic_vector(25 downto 10);
signal pp12: std_logic_vector(26 downto 11);
signal pp13: std_logic_vector(27 downto 12);
signal pp14: std_logic_vector(28 downto 13);
signal pp15: std_logic_vector(29 downto 14);
signal pp16: std_logic_vector(30 downto 15); 

--stage_1_signals --capacity 13

signal stg1_01: std_logic_vector(30 downto 0);
signal stg1_02: std_logic_vector(29 downto 1);
signal stg1_03: std_logic_vector(28 downto 2);
signal stg1_04: std_logic_vector(27 downto 3);
signal stg1_05: std_logic_vector(26 downto 4);
signal stg1_06: std_logic_vector(25 downto 5);
signal stg1_07: std_logic_vector(24 downto 6);
signal stg1_08: std_logic_vector(23 downto 7);
signal stg1_09: std_logic_vector(22 downto 8);
signal stg1_10: std_logic_vector(21 downto 9);
signal stg1_11: std_logic_vector(20 downto 10);
signal stg1_12: std_logic_vector(19 downto 11);
signal stg1_13: std_logic_vector(19 downto 12);

--stage_2_signals --capacity 9

signal stg2_01: std_logic_vector(30 downto 0);
signal stg2_02: std_logic_vector(29 downto 1);
signal stg2_03: std_logic_vector(28 downto 2);
signal stg2_04: std_logic_vector(27 downto 3);
signal stg2_05: std_logic_vector(26 downto 4);
signal stg2_06: std_logic_vector(25 downto 5);
signal stg2_07: std_logic_vector(24 downto 6);
signal stg2_08: std_logic_vector(23 downto 7);
signal stg2_09: std_logic_vector(23 downto 8);

--stage_3_signals --capacity 6

signal stg3_01: std_logic_vector(30 downto 0);
signal stg3_02: std_logic_vector(29 downto 1);
signal stg3_03: std_logic_vector(28 downto 2);
signal stg3_04: std_logic_vector(27 downto 3);
signal stg3_05: std_logic_vector(26 downto 4);
signal stg3_06: std_logic_vector(26 downto 5);

--stage_4_signals --capacity 4	

signal stg4_01: std_logic_vector(30 downto 0);
signal stg4_02: std_logic_vector(29 downto 1);
signal stg4_03: std_logic_vector(28 downto 2);
signal stg4_04: std_logic_vector(28 downto 3);

--stage_5_signals --capacity 3

signal stg5_01: std_logic_vector(30 downto 0);
signal stg5_02: std_logic_vector(29 downto 1);
signal stg5_03: std_logic_vector(29 downto 2);

--stage_6_signals --capacity 2

signal stg6_01: std_logic_vector(30 downto 0);
signal stg6_02: std_logic_vector(30 downto 1);
signal stg6_01bk: std_logic_vector(31 downto 0);
signal stg6_02bk: std_logic_vector(31 downto 0);
signal sumbk: std_logic_vector(31 downto 0);
signal Coutbk: std_logic;

begin

--partial product terms

PProw1: for i in 0 to 15 generate 
			my_and_inst1: my_and port map (ip1 => A(i), ip2 => B(0), opt => PP1(i));
			end generate PProw1;
			
PProw2: for i in 0 to 15 generate
			my_and_inst2: my_and port map (ip1 => A(i), ip2 => B(1), opt =>PP2(i+1));
			end generate PProw2;
			
PProw3: for i in 0 to 15 generate
			my_and_inst3: my_and port map (ip1 => A(i), ip2 => B(2), opt =>PP3(i+2));
			end generate PProw3;

PProw4: for i in 0 to 15 generate
			my_and_inst4: my_and port map (ip1 => A(i), ip2 => B(3), opt =>PP4(i+3));
			end generate PProw4;
			
PProw5: for i in 0 to 15 generate
			my_and_inst5: my_and port map (ip1 => A(i), ip2 => B(4), opt =>PP5(i+4));
			end generate PProw5;
			
PProw6: for i in 0 to 15 generate
			my_and_inst6: my_and port map (ip1 => A(i), ip2 => B(5), opt =>PP6(i+5));
			end generate PProw6;
			
PProw7: for i in 0 to 15 generate
		   	my_and_inst7: my_and port map (ip1 => A(i), ip2 => B(6), opt =>PP7(i+6));
			end generate PProw7;
			
PProw8: for i in 0 to 15 generate
			my_and_inst8: my_and port map (ip1 => A(i), ip2 => B(7), opt =>PP8(i+7));
			end generate PProw8;
			
PProw9: for i in 0 to 15 generate
			my_and_inst9: my_and port map (ip1 => A(i), ip2 => B(8), opt =>PP9(i+8));
			end generate PProw9;
			
PProw10: for i in 0 to 15 generate
			my_and_inst10: my_and port map (ip1 => A(i), ip2 => B(9), opt =>PP10(i+9));
			end generate PProw10;
			
PProw11: for i in 0 to 15 generate
			my_and_inst11: my_and port map (ip1 => A(i), ip2 => B(10), opt =>PP11(i+10));
			end generate PProw11;
			
PProw12: for i in 0 to 15 generate
			my_and_inst12: my_and port map (ip1 => A(i), ip2 => B(11), opt =>PP12(i+11));
			end generate PProw12;

PProw13: for i in 0 to 15 generate
			my_and_inst13: my_and port map (ip1 => A(i), ip2 => B(12), opt =>PP13(i+12));
			end generate PProw13;
			
PProw14: for i in 0 to 15 generate
			my_and_inst14: my_and port map (ip1 => A(i), ip2 => B(13), opt =>PP14(i+13));
			end generate PProw14;
			
PProw15: for i in 0 to 15 generate
			my_and_inst15: my_and port map (ip1 => A(i), ip2 => B(14), opt =>PP15(i+14));
			end generate PProw15;
			
PProw16: for i in 0 to 15 generate
			my_and_inst16: my_and port map (ip1 => A(i), ip2 => B(15), opt =>PP16(i+15));
			end generate PProw16;
			
--stage_1_terms

stg1row1_1: for i in 0 to 12 generate
			 stg1_01(i) <= PP1(i);
			 end generate stg1row1_1;
			 
HAinst1: half_adder port map (PP1(13), PP2(13),stg1_01(13),stg1_02(14));
FAinst1: full_adder port map (PP1(14), PP2(14), PP3(14), stg1_01(14), stg1_02(15));
FAinst2: full_adder port map (PP1(15), PP2(15), PP3(15), stg1_01(15), stg1_02(16));
FAinst3: full_adder port map (PP2(16), PP3(16), PP4(16), stg1_01(16), stg1_02(17));
FAinst4: full_adder port map (PP3(17), PP4(17), PP5(17), stg1_01(17), stg1_02(18));
FAinst5: full_adder port map (PP4(18), PP5(18), PP6(18), stg1_01(18), stg1_02(19));

stg1_01(19) <= PP5(19);
stg1row1_2: for i in 20 to 30 generate
				stg1_01(i) <= PP16(i);
				end generate stg1row1_2;

stg1row2_1: for i in 1 to 12 generate
			 stg1_02(i) <= PP2(i);
			 end generate stg1row2_1;
			 
stg1_02(13) <= PP3(13);

stg1row2_2: for i in 20 to 29 generate
				 stg1_02(i) <= PP15(i);
				 end generate stg1row2_2;
stg1row3_1: for i in 2 to 12 generate
			 stg1_03(i) <= PP3(i);
			 end generate stg1row3_1;
			 
stg1_03(13) <= PP4(13);

HAinst1031: half_adder port map (PP4(14), PP5(14), stg1_03(14), stg1_04(15));
FAinst1031: full_adder port map(PP4(15), PP5(15), PP6(15), stg1_03(15), stg1_04(16));
FAinst1032: full_adder port map(PP5(16), PP6(16), PP7(16), stg1_03(16), stg1_04(17));
FAinst1033: full_adder port map(PP6(17), PP7(17), PP8(17), stg1_03(17), stg1_04(18));

stg1_03(18) <= PP7(18);
stg1_03(19) <= PP6(19);

stg1row3_2: for i in 20 to 28 generate
				stg1_03(i) <= PP14(i);
				end generate stg1row3_2;
				
stg1row4_1: for i in 3 to 12 generate
				stg1_04(i) <= PP4(i);
				end generate stg1row4_1;
stg1_04(13) <= PP5(13);
stg1_04(14) <= PP6(14);
stg1_04(19) <= PP7(19);				

stg1row4_2: for i in 20 to 27 generate
				stg1_04(i) <= PP13(i);
				end generate stg1row4_2;
				
stg1row5_1: for i in 4 to 12 generate
				stg1_05(i) <= PP5(i);
				end generate stg1row5_1;
stg1_05(13) <=PP6(13);
stg1_05(14) <= PP7(14);

HAinst1051: half_adder port map (PP7(15), PP8(15), stg1_05(15), stg1_06(16));
HAinst1052: half_adder port map (PP8(16), PP9(16), stg1_05(16), stg1_06(17));

stg1_05(17) <= PP9(17);
stg1_05(18) <= PP8(18);
stg1_05(19) <= PP8(19);

stg1row5_2: for i in 20 to 26 generate
				stg1_05(i) <= PP12(i);
				end generate stg1row5_2;

stg1row6_1: for i in 5 to 12 generate
				stg1_06(i) <= PP6(i);
				end generate stg1row6_1;
				
stg1_06(13) <= PP7(13);
stg1_06(14) <= PP8(14);
stg1_06 (15) <= PP9(15);
stg1_06(18) <=  PP9(18);
stg1_06(19) <= PP9(19);

stg1row6_2: for i in 20 to 25 generate
				stg1_06(i) <= PP11 (i);
				end generate stg1row6_2;
				
stg1row7_1: for i in 6 to 12 generate
				stg1_07(i) <= PP7(i);
				end generate stg1row7_1;

stg1_07(13) <= PP8(13);
stg1_07(14) <= PP9(14);

stg1row7_m: for i in 15 to 19 generate
				stg1_07(i) <= PP10(i);
				end generate stg1row7_m;
				
stg1row7_2: for i in 20 to 24 generate
				stg1_07(i) <= PP10(i);
				end generate stg1row7_2;

stg1row8_1: for i in 7 to 12 generate
				stg1_08(i) <= PP8(i);
				end generate stg1row8_1;
				
stg1_08(13) <= PP9(13);
stg1_08(14) <= PP10(14);

stg1row8_m: for i in 15 to 19 generate
				stg1_08(i) <= PP11(i);
				end generate stg1row8_m;

stg1row8_2: for i in 20 to 23 generate
				stg1_08(i) <= PP9(i);
				end generate stg1row8_2;
				
stg1row9_1: for i in 8 to 12 generate
				stg1_09(i) <= PP9(i);
				end generate stg1row9_1;
				
stg1_09(13) <= PP10 (13);
stg1_09(14) <= PP11(14);

stg1row9_m : for i in 15 to 19 generate
				 stg1_09(i) <= PP12(i);
				end generate stg1row9_m;
			
stg1row9_2: for i in 20 to 22 generate
				 stg1_09(i) <= PP8(i);
				 end generate stg1row9_2;
				 
stg1row10_1: for i in 9 to 12 generate
				 stg1_10(i) <= PP10(i);
				 end generate stg1row10_1;
				 
stg1_10(13) <= PP11(13);
stg1_10(14) <= PP12(14);

stg1row10_m: for i in 15 to 19 generate
					stg1_10(i) <= PP13(i);
					end generate stg1row10_m;
					
stg1row10_2: for i in 20 to 21 generate
					stg1_10(i) <= PP7(i);
					end generate stg1row10_2;
					
stg1row11_1: for i in 10 to 12 generate
				 stg1_11(i) <= PP11(i);
				end generate stg1row11_1;

stg1_11(13) <= PP12(13);
stg1_11(14) <= PP13(14);

stg1row11_m: for i in 15 to 19 generate
				 stg1_11(i) <= PP14(i);
				 end generate stg1row11_m;
				 
stg1_11(20) <= PP6(20);

--row12
stg1_12(11) <= PP12 (11); stg1_12(12) <= PP12(12);

stg1_12(13) <= PP13(13);
stg1_12(14) <= PP14(14);

stg1row12_m: for i in 15 to 19 generate
				 stg1_12(i) <= PP15(i);
				 end generate stg1row12_m;
			
--row 13				 
stg1_13(12) <= PP13(12);
stg1_13(13) <= PP14(13); stg1_13(14) <= PP15(14);

stg1row13_m: for i in 15 to 19 generate
				stg1_13(i) <=PP16(i);
				end generate stg1row13_m;
		
--stage 2 terms

stg2row1_1: for i in 0 to 8 generate
				stg2_01(i) <= stg1_01(i);
				end generate stg2row1_1;
				
HA2101: half_adder port map (stg1_01(9), stg1_02(9), stg2_01(9), stg2_02(10));

FAgen1: for i in 10 to 22 generate
			FA2101: full_adder port map (stg1_01(i), stg1_02(i), stg1_03(i), stg2_01(i), stg2_02(i+1));
			end generate FAgen1;
			
stg2row1_2: for i in 23 to 30 generate 
				stg2_01(i) <= stg1_01(i);
				end generate stg2row1_2;
				
stg2row2_1: for i in 1 to 8 generate
				stg2_02(i) <= stg1_02(i);
				end generate stg2row2_1;
				
stg2_02(9) <= stg1_03(9);

stg2row2_2: for i in 24 to 29 generate
				stg2_02(i) <= stg1_02(i);
				end generate stg2row2_2;
				
stg2row3_1: for i in 2 to 8 generate
				stg2_03(i) <= stg1_03(i);
				end generate stg2row3_1;
				
stg2_03(9) <= stg1_04(9);

HA2301: half_adder port map (stg1_04(10), stg1_05(10), stg2_03(10), stg2_04(11));

FAgen3: for i in 11 to 21 generate
		  FA2301: full_adder port map (stg1_04(i), stg1_05(i), stg1_06(i), stg2_03(i), stg2_04(i+1));
		  end generate FAgen3;
		  
stg2_03(22) <= stg1_04(22);
stg2_03(23) <= stg1_02(23);
			
stg2row3_2: for i in 24 to 28 generate
				stg2_03(i) <= stg1_03(i);
				end generate stg2row3_2;
				
stg2row4_1: for i in 3 to 8 generate
				stg2_04(i) <= stg1_04(i);
				end generate stg2row4_1;
stg2_04(9)  <= stg1_05(9);
stg2_04(10) <= stg1_06(10);
stg2_04(23) <= stg1_03(23);

stg2row4_2: for i in 24 to 27 generate
				stg2_04(i) <= stg1_04(i);
				end generate stg2row4_2;

stg2row5_1: for i in 4 to 8 generate
				stg2_05(i) <= stg1_05(i);
				end generate stg2row5_1;
				
stg2_05(9) <= stg1_06(9);
stg2_05(10)<= stg1_07(10);

HA2501: half_adder port map (stg1_07(11), stg1_08(11), stg2_05(11), stg2_06(12));

FAgen5: for i in 12 to 20 generate
			FA2501: full_adder port map (stg1_07(i), stg1_08(i), stg1_09(i), stg2_05(i), stg2_06(i+1));
			end generate FAgen5;
stg2_05(21) <= stg1_07(21);
stg2_05(22) <= stg1_05(22);
stg2_05(23) <= stg1_04(23);

stg2row5_2: for i in 24 to 26 generate
				stg2_05(i) <= stg1_05(i);
				end generate stg2row5_2;
				
stg2row6_1: for i in 5 to 8 generate
				stg2_06(i) <= stg1_06(i);
				end generate stg2row6_1;
stg2_06(9)  <= stg1_07(9);
stg2_06(10) <= stg1_08(10);
stg2_06(11) <= stg1_09(11);
stg2_06(22) <= stg1_06(22);
stg2_06(23) <= stg1_05(23);
stg2_06(24) <= stg1_06(24);
stg2_06(25) <= stg1_06(25);

stg2row7_1: for i in 6 to 8 generate
				stg2_07(i) <= stg1_07(i);
				end generate stg2row7_1;
stg2_07(9)  <= stg1_08(9);
stg2_07(10) <= stg1_09(10);
stg2_07(11) <= stg1_10(11);

HA2701: half_adder port map (stg1_10(12), stg1_11(12), stg2_07(12), stg2_08(13));

FAgen7: for i in 13 to 19 generate
		  FA2701: full_adder port map (stg1_10(i), stg1_11(i), stg1_12(i), stg2_07(i), stg2_08(i+1));
		  end generate FAgen7;
		  
stg2_07(20) <= stg1_10(20);
stg2_07(21) <= stg1_08(21);
stg2_07(22) <= stg1_07(22);
stg2_07(23) <= stg1_06(23);
stg2_07(24) <= stg1_07(24);

--stage 2 row8
stg2_08(7) <= stg1_08(7);
stg2_08(8) <= stg1_08(8);
stg2_08(9) <= stg1_09(9);
stg2_08(10)<= stg1_10(10);
stg2_08(11)<= stg1_11(11);
stg2_08(12)<= stg1_12(12);
stg2_08(21)<= stg1_09(21);
stg2_08(22)<= stg1_08(22);
stg2_08(23)<= stg1_07(23); 		  

--stage 2 row 9

stg2_09(8) <= stg1_09(8);
stg2_09(9) <= stg1_10(9);
stg2_09(10)<= stg1_11(10);
stg2_09(11)<= stg1_12(11);
stg2_09(12) <= stg1_13(12);

stg2row9_1: for i in 13 to 19 generate
				stg2_09(i) <= stg1_13(i);
				end generate stg2row9_1;
				
stg2_09(20) <= stg1_11(20);
stg2_09(21) <= stg1_10(21);
stg2_09(22) <= stg1_09(22);
stg2_09(23) <= stg1_08(23);
				
-- stage 3 terms
				
stg3row1_1: for i in 0 to 5 generate
				stg3_01(i) <= stg2_01 (i);
				end generate stg3row1_1;
				
HA3101: half_adder port map (stg2_01(6), stg2_02(6), stg3_01(6), stg3_02(7));

FAgen31: for i in 7 to 25 generate
			FA3101: full_adder port map (stg2_01(i), stg2_02(i), stg2_03(i), stg3_01(i), stg3_02(i+1));
			end generate FAgen31;

stg3row1_2: for i in 26 to 30 generate
				stg3_01(i) <= stg2_01(i);
				end generate stg3row1_2;
				
stg3row2_1: for i in 1 to 5 generate
				stg3_02(i) <= stg2_02(i);
				end generate stg3row2_1;

stg3_02(6) <= stg2_03(6);

stg3row2_2: for i in 27 to 29 generate
				stg3_02(i) <= stg2_02(i);
				end generate stg3row2_2;
				
stg3row3_1: for i in 2 to 5 generate 
				stg3_03(i) <= stg2_03(i);
				end generate stg3row3_1;
				
stg3_03(6) <= stg2_04(6);

HA3301: half_adder port map (stg2_04(7), stg2_05(7), stg3_03(7), stg3_04(8));

FAgen33: for i in 8 to 24 generate
			FA3301: full_adder port map (stg2_04(i), stg2_05(i), stg2_06(i), stg3_03(i), stg3_04(i+1));
			end generate FAgen33;
			
stg3_03(25) <= stg2_04(25);
stg3_03(26) <= stg2_02(26);
stg3_03(27) <= stg2_03(27);
stg3_03(28) <= stg2_03(28);

stg3row4_1: for i in 3 to 5 generate
				stg3_04(i) <= stg2_04(i);
				end generate stg3row4_1;
				
 stg3_04(6) <= stg2_05(6);	
 stg3_04(7) <= stg2_06(7);
 stg3_04(26)<= stg2_03(26);
 stg3_04(27)<= stg2_04(27);
 
 stg3row5_1: for i in 4 to 5 generate
				 stg3_05(i) <= stg2_05(i);
				 end generate stg3row5_1;

stg3_05(6) <= stg2_06(6);
stg3_05(7) <= stg2_07(7);

HA3501: half_adder port map (stg2_07(8), stg2_08(8), stg3_05(8), stg3_06(9));

FAgen35: for i in 9 to 23 generate 
			FA3501: full_adder port map  (stg2_07(i), stg2_08(i), stg2_09(i), stg3_05(i), stg3_06(i+1));
			end generate FAgen35;
stg3_05(24) <= stg2_07(24);
stg3_05(25) <= stg2_05(25);
stg3_05(26) <= stg2_04(26);	

--stg3 row6

stg3_06(5) <= stg2_06(5);
stg3_06(6) <= stg2_07(6);
stg3_06(7) <= stg2_08(7);
stg3_06(8) <= stg2_09(8);
stg3_06(25)<= stg2_06(25);
stg3_06(26)<= stg2_05(26);		

--stage 4 terms

stg4row1_1: for i in 0 to 3 generate
				stg4_01(i) <= stg3_01(i);
				end generate stg4row1_1;
				
HA4101: half_adder port map (stg3_01(4), stg3_02(4), stg4_01(4), stg4_02(5));

FAgen41: for i in 5 to 27 generate
			FA4101: full_adder port map (stg3_01(i), stg3_02(i), stg3_03(i), stg4_01(i), stg4_02(i+1));
			end generate FAgen41;
			
stg4row1_2: for i in 28 to 30 generate
				stg4_01(i) <= stg3_01(i);
				end generate stg4row1_2;
				
stg4row2_1: for i in 1 to 3 generate
				stg4_02(i) <= stg3_02(i);
				end generate stg4row2_1;
				
stg4_02(4) <= stg3_03(4);
stg4_02(29) <= stg3_02(29);

--stg4row3
stg4_03(2) <= stg3_03(2);
stg4_03(3) <= stg3_03(3);
stg4_03(4) <= stg3_04(4);

HA4301: half_adder port map (stg3_04(5), stg3_05(5), stg4_03(5), stg4_04(6));

FAgen43: for i in 6 to 26 generate 
			FA4301: full_adder port map (stg3_04(i), stg3_05(i), stg3_06(i), stg4_03(i), stg4_04(i+1));
						end generate FAgen43;

stg4_03(27) <= stg3_04(27);
stg4_03(28) <= stg3_02(28);

--stg4row4

stg4_04(3) <= stg3_04(3);
stg4_04(4) <= stg3_05(4);
stg4_04(5) <= stg3_06(5);		
stg4_04(28) <= stg3_03(28);

--stage 5 terms

stg5row1_1 : for i in 0 to 2 generate
				stg5_01(i) <= stg4_01(i);
				end generate stg5row1_1;
				
HA5101: half_adder port map (stg4_01(3), stg4_02(3), stg5_01(3), stg5_02(4));
 
FAgen51: for i in 4 to 28 generate
			 FA5101: full_adder port map (stg4_01(i), stg4_02(i), stg4_03(i), stg5_01(i), stg5_02(i+1));
			 end generate FAgen51;

stg5_01(29) <= stg4_01(29);
stg5_01(30) <= stg4_01(30);

--stage5row2

stg5_02(1) <= stg4_02(1);
stg5_02(2) <= stg4_02(2);
stg5_02(3) <= stg4_03(3); 

--stage5row3

stg5_03(2) <= stg4_03(2);
stg5_03(3) <= stg4_04(3);

stg5row3: for i in 4 to 28 generate
			 stg5_03(i) <= stg4_04(i);
			 end generate stg5row3;
			 
stg5_03(29) <= stg4_02(29);

--stage6 terms

stg6_01(0) <= stg5_01(0);
stg6_01(1) <= stg5_01(1);

HA6101: half_adder port map (stg5_01(2), stg5_02(2), stg6_01(2), stg6_02(3));

FAgen61: for i in 3 to 29 generate
			FA6101: full_adder port map (stg5_01(i), stg5_02(i), stg5_03(i), stg6_01(i), stg6_02(i+1));
			end generate FAgen61;

stg6_01(30) <= stg5_01(30);

stg6_02(1) <= stg5_02(1);
stg6_02(2) <= stg5_03(2);

stg6_01bk <= '0' & stg6_01;
stg6_02bk <= '0' & stg6_02 & '0';

bkadder_inst: bkadder port map (stg6_01bk, stg6_02bk, sumbk, Coutbk);

P <= sumbk; 
end arch_daddampr;