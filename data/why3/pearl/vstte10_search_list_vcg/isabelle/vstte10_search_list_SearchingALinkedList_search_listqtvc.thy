theory vstte10_search_list_SearchingALinkedList_search_listqtvc
  imports "NTP4Verif.NTP4Verif"
begin
definition zero_at :: "int list \<Rightarrow> int \<Rightarrow> _"
  where "zero_at l i \<longleftrightarrow> nth_opt l i = Some (0 :: int) \<and> (\<forall>(j :: int). (0 :: int) \<le> j \<and> j < i \<longrightarrow> \<not>nth_opt l j = Some (0 :: int))" for l i
definition no_zero :: "int list \<Rightarrow> _"
  where "no_zero l \<longleftrightarrow> (\<forall>(j :: int). (0 :: int) \<le> j \<and> j < int (length l) \<longrightarrow> \<not>nth_opt l j = Some (0 :: int))" for l
theorem search_list'vc:
  fixes result :: "int"
  fixes l :: "int list"
  assumes fact0: "((0 :: int) \<le> result \<and> result < (0 :: int) + int (length l)) \<and> zero_at l (result - (0 :: int)) \<or> result = (0 :: int) + int (length l) \<and> no_zero l"
  shows "((0 :: int) \<le> result \<and> result < int (length l)) \<and> zero_at l result \<or> result = int (length l) \<and> no_zero l"
  sorry
end
