theory fibonacci_Zeckendorf_fib_increasingqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "Why3STD.int_Fibonacci" "./fibonacci_SmallestFibAbove"
begin
fun sum :: "int list \<Rightarrow> int"
  where "sum (Nil :: int list) = (0 :: int)"
      | "sum (Cons k r) = fib k + sum r" for k r
fun wf :: "int \<Rightarrow> int list \<Rightarrow> _"
  where "wf min (Nil :: int list) = True" for min
      | "wf min (Cons k r) = (min \<le> k \<and> wf (k + (2 :: int)) r)" for min k r
theorem fib_increasing'vc:
  fixes k1 :: "int"
  fixes k2 :: "int"
  assumes fact0: "(0 :: int) \<le> k1"
  assumes fact1: "k1 \<le> k2"
  shows "fib k1 \<le> fib k2"
  sorry
end
