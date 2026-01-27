theory fibonacci_FibonacciLinear_fibqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "Why3STD.int_Fibonacci"
begin
theorem fib'vc:
  fixes n :: "int"
  assumes fact0: "(0 :: int) \<le> n"
  shows "let o1 :: int = n - (1 :: int) in ((0 :: int) \<le> o1 + (1 :: int) \<longrightarrow> (((0 :: int) \<le> (0 :: int) \<and> (0 :: int) \<le> n) \<and> fib ((0 :: int) + (1 :: int)) = (1 :: int) \<and> fib (0 :: int) = (0 :: int)) \<and> (\<forall>(x :: int) (y :: int). (\<forall>(i :: int). ((0 :: int) \<le> i \<and> i \<le> o1) \<and> ((0 :: int) \<le> i \<and> i \<le> n) \<and> fib (i + (1 :: int)) = x \<and> fib i = y \<longrightarrow> ((0 :: int) \<le> i + (1 :: int) \<and> i + (1 :: int) \<le> n) \<and> fib (i + (1 :: int) + (1 :: int)) = x + y \<and> fib (i + (1 :: int)) = x) \<and> (((0 :: int) \<le> o1 + (1 :: int) \<and> o1 + (1 :: int) \<le> n) \<and> fib (o1 + (1 :: int) + (1 :: int)) = x \<and> fib (o1 + (1 :: int)) = y \<longrightarrow> fib n = y))) \<and> (o1 + (1 :: int) < (0 :: int) \<longrightarrow> fib n = (0 :: int))"
  sorry
end
