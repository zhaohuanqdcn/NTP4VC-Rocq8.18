theory int_Fibonacci
  imports "NTP4Verif.NTP4Verif"
begin
consts fib :: "int \<Rightarrow> int"
axiomatization where fib'def:   "if n = (0 :: int) then fib n = (0 :: int) else if n = (1 :: int) then fib n = (1 :: int) else fib n = fib (n - (1 :: int)) + fib (n - (2 :: int))"
 if "(0 :: int) \<le> n"
  for n :: "int"
end
