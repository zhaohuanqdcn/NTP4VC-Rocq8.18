theory fibonacci_FibonacciLogarithmic_fib_mqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.int_Fibonacci" "./fibonacci_Mat22"
begin
theorem fib_m'vc:
  fixes n :: "int"
  assumes fact0: "(0 :: int) \<le> n"
  shows "let p :: t = fibonacci_Mat22.power (t'mk (1 :: int) (1 :: int) (1 :: int) (0 :: int)) n in fib (n + (1 :: int)) = a11 p \<and> fib n = a21 p"
  sorry
end
