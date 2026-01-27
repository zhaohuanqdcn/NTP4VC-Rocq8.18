theory fibonacci_FibonacciLogarithmic_logfibqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.int_Fibonacci" "./fibonacci_Mat22"
begin
theorem logfib'vc:
  fixes n :: "int"
  assumes fact0: "(0 :: int) \<le> n"
  shows "\<not>n = (0 :: int) \<longrightarrow> \<not>(2 :: int) = (0 :: int) \<and> (let o1 :: int = n cdiv (2 :: int) in (((0 :: int) \<le> n \<and> o1 < n) \<and> (0 :: int) \<le> o1) \<and> (\<forall>(a :: int) (b :: int). fibonacci_Mat22.power (t'mk (1 :: int) (1 :: int) (1 :: int) (0 :: int)) o1 = t'mk (a + b) b b a \<longrightarrow> \<not>(2 :: int) = (0 :: int)))"
  and "\<forall>(a :: int) (b :: int). (if n = (0 :: int) then a = (1 :: int) \<and> b = (0 :: int) else \<exists>(a1 :: int) (b1 :: int). fibonacci_Mat22.power (t'mk (1 :: int) (1 :: int) (1 :: int) (0 :: int)) (n cdiv (2 :: int)) = t'mk (a1 + b1) b1 b1 a1 \<and> (let c :: int = a1 + b1 in if n cmod (2 :: int) = (0 :: int) then a = a1 * a1 + b1 * b1 \<and> b = b1 * (a1 + c) else a = b1 * (a1 + c) \<and> b = c * c + b1 * b1)) \<longrightarrow> fibonacci_Mat22.power (t'mk (1 :: int) (1 :: int) (1 :: int) (0 :: int)) n = t'mk (a + b) b b a"
  sorry
end
