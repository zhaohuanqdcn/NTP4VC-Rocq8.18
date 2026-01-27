theory fibonacci_Zeckendorf_greatest_fibqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "Why3STD.int_Fibonacci" "./fibonacci_SmallestFibAbove"
begin
fun sum :: "int list \<Rightarrow> int"
  where "sum (Nil :: int list) = (0 :: int)"
      | "sum (Cons k r) = fib k + sum r" for k r
fun wf :: "int \<Rightarrow> int list \<Rightarrow> _"
  where "wf min (Nil :: int list) = True" for min
      | "wf min (Cons k r) = (min \<le> k \<and> wf (k + (2 :: int)) r)" for min k r
theorem greatest_fib'vc:
  fixes x :: "int"
  assumes fact0: "(0 :: int) < x"
  shows "(1 :: int) \<le> (1 :: int)"
  and "(1 :: int) = fib (1 :: int)"
  and "fib (1 :: int) \<le> x"
  and "(1 :: int) = fib ((1 :: int) + (1 :: int))"
  and "(1 :: int) \<le> (1 :: int)"
  and "\<forall>(k :: int). ((1 :: int) \<le> k \<and> fib k \<le> x) \<and> (1 :: int) \<le> fib k \<and> (1 :: int) \<le> fib (k + (1 :: int)) \<longrightarrow> (if fib (k + (1 :: int)) \<le> x then ((0 :: int) \<le> (2 :: int) * x - (fib k + fib (k + (1 :: int))) \<and> (2 :: int) * x - (fib (k + (1 :: int)) + (fib k + fib (k + (1 :: int)))) < (2 :: int) * x - (fib k + fib (k + (1 :: int)))) \<and> ((1 :: int) \<le> k + (1 :: int) \<and> fib (k + (1 :: int)) \<le> x \<and> fib k + fib (k + (1 :: int)) = fib (k + (1 :: int) + (1 :: int))) \<and> (1 :: int) \<le> fib (k + (1 :: int)) \<and> (1 :: int) \<le> fib k + fib (k + (1 :: int)) else (2 :: int) \<le> k \<and> (1 :: int) \<le> fib k \<and> fib k \<le> x \<and> x < fib (k + (1 :: int)))"
  sorry
end
