theory fibonacci_FibRecNoGhost_fibqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.int_Fibonacci"
begin
theorem fib'vc:
  fixes n :: "int"
  assumes fact0: "(0 :: int) \<le> n"
  shows "(0 :: int) \<le> n"
  and "\<exists>(n1 :: int). (0 :: int) \<le> n1 \<and> (0 :: int) = fib n1 \<and> (1 :: int) = fib (n1 + (1 :: int))"
  and "\<forall>(result :: int). (\<forall>(n1 :: int). (0 :: int) \<le> n1 \<and> (0 :: int) = fib n1 \<and> (1 :: int) = fib (n1 + (1 :: int)) \<longrightarrow> result = fib (n1 + n)) \<longrightarrow> result = fib n"
  sorry
end
