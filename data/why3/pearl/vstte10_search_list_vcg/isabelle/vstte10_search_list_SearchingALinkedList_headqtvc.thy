theory vstte10_search_list_SearchingALinkedList_headqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
definition zero_at :: "int list \<Rightarrow> int \<Rightarrow> _"
  where "zero_at l i \<longleftrightarrow> nth_opt l i = Some (0 :: int) \<and> (\<forall>(j :: int). (0 :: int) \<le> j \<and> j < i \<longrightarrow> \<not>nth_opt l j = Some (0 :: int))" for l i
definition no_zero :: "int list \<Rightarrow> _"
  where "no_zero l \<longleftrightarrow> (\<forall>(j :: int). (0 :: int) \<le> j \<and> j < int (length l) \<longrightarrow> \<not>nth_opt l j = Some (0 :: int))" for l
theorem head'vc:
  fixes l :: "'a list"
  assumes fact0: "\<not>l = (Nil :: 'a list)"
  shows "case l of (Nil :: 'a list) \<Rightarrow> False | Cons h _ \<Rightarrow> True"
  and "\<forall>(result :: 'a). (case l of (Nil :: 'a list) \<Rightarrow> False | Cons h _ \<Rightarrow> result = h) \<longrightarrow> (if l = Nil then None else Some (hd l)) = Some result"
  sorry
end
