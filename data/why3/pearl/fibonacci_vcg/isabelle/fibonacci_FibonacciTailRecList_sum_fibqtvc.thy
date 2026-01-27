theory fibonacci_FibonacciTailRecList_sum_fibqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.int_Fibonacci"
begin
theorem sum_fib'vc:
  fixes l :: "int list"
  assumes fact0: "\<forall>(n :: int). n \<in> set l \<longrightarrow> (0 :: int) \<le> n"
  shows "case l of Nil \<Rightarrow> True | Cons x r \<Rightarrow> (\<forall>(n :: int). n \<in> set r \<longrightarrow> (0 :: int) \<le> n) \<and> (0 :: int) \<le> x"
  sorry
end
