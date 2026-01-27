theory fibonacci_FibRecGhost_fibqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.int_Fibonacci"
begin
theorem fib'vc:
  fixes n :: "int"
  assumes fact0: "(0 :: int) \<le> n"
  shows "(0 :: int) \<le> n"
  and "(0 :: int) \<le> (0 :: int)"
  and "(0 :: int) = fib (0 :: int)"
  and "(1 :: int) = fib ((0 :: int) + (1 :: int))"
  and "fib ((0 :: int) + n) = fib n"
  sorry
end
