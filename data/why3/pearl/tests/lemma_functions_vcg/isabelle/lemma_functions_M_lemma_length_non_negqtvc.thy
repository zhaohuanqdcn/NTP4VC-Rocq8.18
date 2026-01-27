theory lemma_functions_M_lemma_length_non_negqtvc
  imports "NTP4Verif.NTP4Verif"
begin
datatype 'a list = Nil | Cons "'a" "'a list"
fun length :: "'a list \<Rightarrow> int"
  where "length (Nil :: 'a list) = (0 :: int)"
      | "length (Cons x r) = (1 :: int) + length r" for x r
theorem lemma_length_non_neg'vc:
  fixes l :: "'a list"
  shows "case l of (Nil :: 'a list) \<Rightarrow> True | Cons _ r \<Rightarrow> (case l of (Nil :: 'a list) \<Rightarrow> False | Cons _ f \<Rightarrow> f = r)"
  and "(case l of (Nil :: 'a list) \<Rightarrow> True | Cons _ r \<Rightarrow> (0 :: int) \<le> length r) \<longrightarrow> (0 :: int) \<le> length l"
  sorry
end
