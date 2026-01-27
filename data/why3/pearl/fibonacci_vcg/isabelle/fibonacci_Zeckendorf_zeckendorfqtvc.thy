theory fibonacci_Zeckendorf_zeckendorfqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "Why3STD.int_Fibonacci" "./fibonacci_SmallestFibAbove"
begin
fun sum :: "int list \<Rightarrow> int"
  where "sum (Nil :: int list) = (0 :: int)"
      | "sum (Cons k r) = fib k + sum r" for k r
fun wf :: "int \<Rightarrow> int list \<Rightarrow> _"
  where "wf min (Nil :: int list) = True" for min
      | "wf min (Cons k r) = (min \<le> k \<and> wf (k + (2 :: int)) r)" for min k r
theorem zeckendorf'vc:
  fixes n :: "int"
  assumes fact0: "(0 :: int) \<le> n"
  shows "(0 :: int) \<le> n"
  and "n \<le> n"
  and "wf (2 :: int) (Nil :: int list)"
  and "n + sum (Nil :: int list) = n"
  and "\<forall>(l :: int list) (x :: int). ((0 :: int) \<le> x \<and> x \<le> n) \<and> wf (2 :: int) l \<and> x + sum l = n \<and> (case l of Nil \<Rightarrow> True | Cons k _ \<Rightarrow> x < fib (k - (1 :: int))) \<longrightarrow> (if (0 :: int) < x then (0 :: int) < x \<and> (\<forall>(k :: int). (2 :: int) \<le> k \<and> (1 :: int) \<le> fib k \<and> fib k \<le> x \<and> x < fib (k + (1 :: int)) \<longrightarrow> ((0 :: int) \<le> x \<and> x - fib k < x) \<and> ((0 :: int) \<le> x - fib k \<and> x - fib k \<le> n) \<and> wf (2 :: int) (Cons k l) \<and> x - fib k + sum (Cons k l) = n \<and> (case Cons k l of Nil \<Rightarrow> True | Cons k1 _ \<Rightarrow> x - fib k < fib (k1 - (1 :: int)))) else wf (2 :: int) l \<and> n = sum l)"
  sorry
end
