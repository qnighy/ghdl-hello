library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sample is
  -- この部品の持つ入出力をここに書く
  -- in     ... 入力 (中から見ると、読み取り専用)
  -- out    ... 出力 (中から見ると、書き込み専用)
  -- inout  ... 入出力両方 (読み書き可能)
  -- buffer ... 出力のみだが、自分が出力したものを読み込める
  port (
    -- std_logicは1本の信号
    clk : in std_logic;
    in0 : in std_logic;
    in1 : in std_logic;
    -- std_logic_vector, unsigned, signedは複数本の信号 (ここでは32本)
    in2 : in unsigned(31 downto 0);
    in3 : in unsigned(31 downto 0);
    out0 : out std_logic;
    out1 : out std_logic;
    out2 : out std_logic;
    out3 : out unsigned(31 downto 0));
end;

architecture behavioral of sample is
  -- 内部配線をここに書く
  signal foo : std_logic;
  signal bar : unsigned(31 downto 0);
begin
  -- 同時処理文による組み合わせ回路の例
  out0 <= in0 and in1;

  -- 順序処理文による組み合わせ回路の例
  combinational : process(in0, in1)
    variable var0 : std_logic;
  begin
    var0 := in0;
    out1 <= var0 and in1;
  end process;

  -- 順序処理文による順序回路の例
  -- クロックに同期して実行されるので、
  -- 上で書いた回路に比べて、出力が1クロック遅れる
  sequential : process(clk)
  begin
    if rising_edge(clk) then
      out2 <= in0 and in1;
    end if;
  end process;

  -- 整数演算の例
  out3 <= in2 + in3;
end;
