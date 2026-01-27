theory euler002_FibOnlyEven_fib_evennqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.int_Fibonacci"
begin
definition fib_even :: "int \<Rightarrow> int"
  where "fib_even n = fib ((3 :: int) * n)" for n
theorem fib_evenn'vc:
  fixes n :: "int"
  assumes fact0: "(2 :: int) \<le> n"
  shows "fib_even n = (4 :: int) * fib_even (n - (1 :: int)) + fib_even (n - (2 :: int))"
  sorry
end
