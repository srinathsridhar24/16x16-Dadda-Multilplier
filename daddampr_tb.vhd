library ieee;
use ieee.std_logic_1164.all;

entity daddampr_tb is end daddampr_tb;

architecture arch of daddampr_tb is 

component daddampr is 
	port (A: in std_logic_vector(15 downto 0);
			B: in std_logic_vector(15 downto 0);
			P: out std_logic_vector(31 downto 0));
	end component;
	
	signal A,B: std_logic_vector(15 downto 0);
	signal P: std_logic_vector(31 downto 0);
	
begin

uut: daddampr port map (A, B, P);

process begin
	A <= X"00FF";
	B <= X"00CC";
	wait for 25 ns;
	A <= X"AAAA";
	B <= X"AAAA";
--	wait for 25 ns;
--	A <= X"D84E";
--	B <= X"C9E8";
--	wait for 25 ns;
--        A <= X"0018";
--	B <= X"0002";
--	wait for 25 ns;
--	A <= X"0025";
--	B <= X"2501";
--	wait for 25 ns;
--	A <= X"D2DC";
--	B <= X"4005";
--	wait for 25 ns;
--	A <= X"BA25";
--	B <= X"CF01";
--	wait for 25 ns;
--	A <= X"0001";
--	B <= X"0020";
	wait;
end process;
end arch;
	
	