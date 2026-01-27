theory euler002_FibOnlyEven
  imports "NTP4Verif.NTP4Verif" "Why3STD.int_Fibonacci"
begin
definition fib_even :: "int \<Rightarrow> int"
  where "fib_even n = fib ((3 :: int) * n)" for n
end
