theory fibonacci_FibRecNoGhost_fib_auxqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.int_Fibonacci"
begin
theorem fib_aux'vc:
  fixes k :: "int"
  fixes a :: "int"
  fixes b :: "int"
  assumes fact0: "(0 :: int) \<le> k"
  assumes fact1: "\<exists>(n :: int). (0 :: int) \<le> n \<and> a = fib n \<and> b = fib (n + (1 :: int))"
  shows "\<not>k = (0 :: int) \<longrightarrow> (let o1 :: int = k - (1 :: int) in ((0 :: int) \<le> k \<and> o1 < k) \<and> (0 :: int) \<le> o1 \<and> (\<exists>(n :: int). (0 :: int) \<le> n \<and> b = fib n \<and> a + b = fib (n + (1 :: int))))"
  and "\<forall>(result :: int). (if k = (0 :: int) then result = a else \<forall>(n :: int). (0 :: int) \<le> n \<and> b = fib n \<and> a + b = fib (n + (1 :: int)) \<longrightarrow> result = fib (n + (k - (1 :: int)))) \<longrightarrow> (\<forall>(n :: int). (0 :: int) \<le> n \<and> a = fib n \<and> b = fib (n + (1 :: int)) \<longrightarrow> result = fib (n + k))"
  sorry
end
