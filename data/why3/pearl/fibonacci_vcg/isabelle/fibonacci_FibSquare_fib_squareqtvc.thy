theory fibonacci_FibSquare_fib_squareqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.int_Fibonacci"
begin
theorem fib_square'vc:
  fixes n :: "int"
  assumes fact0: "(0 :: int) \<le> n"
  shows "fib n = n * n \<longleftrightarrow> n = (0 :: int) \<or> n = (1 :: int) \<or> n = (12 :: int)"
  sorry
end
