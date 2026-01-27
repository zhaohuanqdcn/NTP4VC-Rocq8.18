theory lemma_functions_M_toy_exampleqtvc
  imports "NTP4Verif.NTP4Verif"
begin
datatype 'a list = Nil | Cons "'a" "'a list"
fun length :: "'a list \<Rightarrow> int"
  where "length (Nil :: 'a list) = (0 :: int)"
      | "length (Cons x r) = (1 :: int) + length r" for x r
theorem toy_example'vc:
  fixes l :: "'a list"
  shows "case l of (Nil :: 'a list) \<Rightarrow> True | Cons _ (Nil :: 'a list) \<Rightarrow> True | Cons x (Cons _ r) \<Rightarrow> (0 :: int) \<le> length l \<longrightarrow> (0 :: int) \<le> length l \<and> length (Cons x r) < length l"
  sorry
end
