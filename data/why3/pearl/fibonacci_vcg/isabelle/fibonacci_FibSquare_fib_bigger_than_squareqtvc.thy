theory fibonacci_FibSquare_fib_bigger_than_squareqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.int_Fibonacci"
begin
theorem fib_bigger_than_square'vc:
  fixes n :: "int"
  assumes fact0: "(12 :: int) < n"
  shows "n * n < fib n"
  sorry
end
