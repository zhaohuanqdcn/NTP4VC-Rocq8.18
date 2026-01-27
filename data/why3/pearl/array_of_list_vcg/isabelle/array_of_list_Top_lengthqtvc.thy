theory array_of_list_Top_lengthqtvc
  imports "NTP4Verif.NTP4Verif"
begin
theorem length'vc:
  fixes l :: "'a list"
  shows "case l of (Nil :: 'a list) \<Rightarrow> True | Cons _ l1 \<Rightarrow> (case l of (Nil :: 'a list) \<Rightarrow> False | Cons _ f \<Rightarrow> f = l1)"
  and "\<forall>(result :: nat). (case l of (Nil :: 'a list) \<Rightarrow> result = (0 :: nat) | Cons _ l1 \<Rightarrow> (\<exists>(o1 :: nat). o1 = length l1 \<and> int result = int o1 + (1 :: int))) \<longrightarrow> result = length l"
  sorry
end
