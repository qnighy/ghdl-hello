library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sample_tb is
end;

-- コメント

architecture simulational of sample_tb is
  -- ここではコンポーネントを利用するarchitectureの中で宣言しているが、
  -- 利用するときにいちいちcomponentを再度宣言するのは手間なので、
  -- packageでまとめて宣言し、それを利用するのがよい
  component sample is
    port (
      clk : in std_logic;
      in0 : in std_logic;
      in1 : in std_logic;
      in2 : in unsigned(31 downto 0);
      in3 : in unsigned(31 downto 0);
      out0 : out std_logic;
      out1 : out std_logic;
      out2 : out std_logic;
      out3 : out unsigned(31 downto 0));
  end component;

  signal simclk : std_logic;

  -- ゼロで初期化
  signal sim_in0 : std_logic := '0';
  signal sim_in1 : std_logic := '0';
  signal sim_in2 : unsigned(31 downto 0) := (others => '0');
  signal sim_in3 : unsigned(31 downto 0) := (others => '0');

  signal sim_out0 : std_logic;
begin

  -- このプロセスは繰り返し呼び出され、simclkの値に交互に0と1を代入する。
  -- これによってクロックが生成されたことになる。
  clockgen : process
  begin
    simclk <= '0';
    wait for 7.5 ns;
    simclk <= '1';
    wait for 7.5 ns;
  end process;

  gensignal : process(simclk)
  begin
    if rising_edge(simclk) then
      sim_in1 <= not sim_in0;
      sim_in0 <= sim_in1;
      sim_in2 <= sim_in2 + 1;
      sim_in3 <= sim_in3 + 2;
    end if;
  end process;

  unit : sample
  port map (
    clk => simclk,
    in0 => sim_in0,
    in1 => sim_in1,
    in2 => sim_in2,
    in3 => sim_in3,
    out0 => sim_out0,
    out1 => open,
    out2 => open,
    out3 => open);
end;
