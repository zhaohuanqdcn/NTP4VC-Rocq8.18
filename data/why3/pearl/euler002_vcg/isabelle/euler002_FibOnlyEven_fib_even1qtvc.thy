theory euler002_FibOnlyEven_fib_even1qtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.int_Fibonacci"
begin
definition fib_even :: "int \<Rightarrow> int"
  where "fib_even n = fib ((3 :: int) * n)" for n
theorem fib_even1'vc:
  shows "fib_even (1 :: int) = (2 :: int)"
  sorry
end
