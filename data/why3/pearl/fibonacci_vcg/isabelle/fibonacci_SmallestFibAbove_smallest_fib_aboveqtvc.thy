theory fibonacci_SmallestFibAbove_smallest_fib_aboveqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "Why3STD.int_Fibonacci"
begin
theorem smallest_fib_above'vc:
  fixes x :: "int"
  assumes fact0: "(0 :: int) \<le> x"
  shows "(0 :: int) \<le> (0 :: int)"
  and "(0 :: int) = fib (0 :: int)"
  and "fib (0 :: int) \<le> x"
  and "(1 :: int) = fib ((0 :: int) + (1 :: int))"
  and "(0 :: int) \<le> (0 :: int)"
  and "(1 :: int) \<le> (1 :: int)"
  and "\<forall>(k :: int). ((0 :: int) \<le> k \<and> fib k \<le> x) \<and> (0 :: int) \<le> fib k \<and> (1 :: int) \<le> fib (k + (1 :: int)) \<longrightarrow> (if fib (k + (1 :: int)) \<le> x then ((0 :: int) \<le> (2 :: int) * x - (fib k + fib (k + (1 :: int))) \<and> (2 :: int) * x - (fib (k + (1 :: int)) + (fib k + fib (k + (1 :: int)))) < (2 :: int) * x - (fib k + fib (k + (1 :: int)))) \<and> ((0 :: int) \<le> k + (1 :: int) \<and> fib (k + (1 :: int)) \<le> x \<and> fib k + fib (k + (1 :: int)) = fib (k + (1 :: int) + (1 :: int))) \<and> (0 :: int) \<le> fib (k + (1 :: int)) \<and> (1 :: int) \<le> fib k + fib (k + (1 :: int)) else \<exists>(k1 :: int). (0 :: int) \<le> k1 \<and> fib k1 \<le> x \<and> x < fib (k1 + (1 :: int)) \<and> fib (k1 + (1 :: int)) = fib (k + (1 :: int)))"
  sorry
end
