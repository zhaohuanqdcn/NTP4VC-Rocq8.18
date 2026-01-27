theory verifythis_2017_tree_buffer_Spec_take_lemmaqtvc
  imports "NTP4Verif.NTP4Verif"
begin
datatype 'a buf = buf'mk (h: "int") (xs: "'a list")
fun take :: "int \<Rightarrow> 'a list \<Rightarrow> 'a list"
  where "take n (Nil :: 'a list) = (Nil :: 'a list)" for n
      | "take n (Cons x xs1) = (if n = (0 :: int) then (Nil :: 'a list) else Cons x (take (n - (1 :: int)) xs1))" for n x xs1
definition add :: "'a \<Rightarrow> 'a buf \<Rightarrow> 'a buf"
  where "add x b = buf'mk (h b) (Cons x (xs b))" for x b
definition get :: "'a buf \<Rightarrow> 'a list"
  where "get b = take (h b) (xs b)" for b
theorem take_lemma'vc:
  fixes n :: "int"
  fixes l1 :: "'a list"
  fixes l2 :: "'a list"
  fixes l3 :: "'a list"
  assumes fact0: "(0 :: int) \<le> n"
  assumes fact1: "n \<le> int (length l1)"
  shows "take n (l1 @ l2) = take n (l1 @ l3)"
  sorry
end
