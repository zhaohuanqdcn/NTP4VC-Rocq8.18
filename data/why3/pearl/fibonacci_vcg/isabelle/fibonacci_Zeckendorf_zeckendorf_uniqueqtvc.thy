theory fibonacci_Zeckendorf_zeckendorf_uniqueqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "Why3STD.int_Fibonacci" "./fibonacci_SmallestFibAbove"
begin
fun sum :: "int list \<Rightarrow> int"
  where "sum (Nil :: int list) = (0 :: int)"
      | "sum (Cons k r) = fib k + sum r" for k r
fun wf :: "int \<Rightarrow> int list \<Rightarrow> _"
  where "wf min (Nil :: int list) = True" for min
      | "wf min (Cons k r) = (min \<le> k \<and> wf (k + (2 :: int)) r)" for min k r
fun snoc :: "int list \<Rightarrow> int \<Rightarrow> int list"
  where "snoc (Nil :: int list) x = Cons x (Nil :: int list)" for x
      | "snoc (Cons y q) x = Cons y (snoc q x)" for y q x
theorem zeckendorf_unique'vc:
  fixes l1 :: "int list"
  fixes l2 :: "int list"
  assumes fact0: "wf (2 :: int) l1"
  assumes fact1: "wf (2 :: int) l2"
  assumes fact2: "sum l1 = sum l2"
  shows "l1 = l2"
  sorry
end
