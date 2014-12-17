library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity hello is
end;

architecture behavioral of hello is
begin
  main: process
  begin
    -- report文でメッセージを表示することができる。
    -- 正確な構文は "assert ... report ... severity ...;"
    report "Hello, world!";
    -- report文は、無条件で停止するものを除いて、合成のときは無視されます。
    wait;
  end process;
end;
