theory fibonacci_FibRecGhost_fib_auxqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.int_Fibonacci"
begin
theorem fib_aux'vc:
  fixes k :: "int"
  fixes n :: "int"
  assumes fact0: "(0 :: int) \<le> k"
  assumes fact1: "(0 :: int) \<le> n"
  shows "\<not>k = (0 :: int) \<longrightarrow> (let o1 :: int = k - (1 :: int); o2 :: int = n + (1 :: int) in ((0 :: int) \<le> k \<and> o1 < k) \<and> (0 :: int) \<le> o1 \<and> (0 :: int) \<le> o2 \<and> fib (n + (1 :: int)) = fib o2 \<and> fib n + fib (n + (1 :: int)) = fib (o2 + (1 :: int)))"
  and "\<forall>(result :: int). (if k = (0 :: int) then result = fib n else result = fib (n + (1 :: int) + (k - (1 :: int)))) \<longrightarrow> result = fib (n + k)"
  sorry
end
