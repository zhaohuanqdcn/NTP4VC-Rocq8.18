theory euler002_FibOnlyEven_fib_even_3nqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.int_Fibonacci"
begin
theorem fib_even_3n'vc:
  fixes n :: "int"
  assumes fact0: "(0 :: int) \<le> n"
  shows "fib n cmod (2 :: int) = (0 :: int) \<longleftrightarrow> n cmod (3 :: int) = (0 :: int)"
  sorry
end
