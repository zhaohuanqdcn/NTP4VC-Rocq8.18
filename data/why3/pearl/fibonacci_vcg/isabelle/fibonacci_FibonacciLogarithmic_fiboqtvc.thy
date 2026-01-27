theory fibonacci_FibonacciLogarithmic_fiboqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.int_Fibonacci" "./fibonacci_Mat22"
begin
theorem fibo'vc:
  fixes n :: "int"
  assumes fact0: "(0 :: int) \<le> n"
  shows "(0 :: int) \<le> n"
  and "\<forall>(o1 :: int) (o2 :: int). fibonacci_Mat22.power (t'mk (1 :: int) (1 :: int) (1 :: int) (0 :: int)) n = t'mk (o1 + o2) o2 o2 o1 \<longrightarrow> o2 = fib n"
  sorry
end
