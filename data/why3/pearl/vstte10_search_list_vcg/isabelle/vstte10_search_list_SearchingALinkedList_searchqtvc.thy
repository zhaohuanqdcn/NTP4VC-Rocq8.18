theory vstte10_search_list_SearchingALinkedList_searchqtvc
  imports "NTP4Verif.NTP4Verif"
begin
definition zero_at :: "int list \<Rightarrow> int \<Rightarrow> _"
  where "zero_at l i \<longleftrightarrow> nth_opt l i = Some (0 :: int) \<and> (\<forall>(j :: int). (0 :: int) \<le> j \<and> j < i \<longrightarrow> \<not>nth_opt l j = Some (0 :: int))" for l i
definition no_zero :: "int list \<Rightarrow> _"
  where "no_zero l \<longleftrightarrow> (\<forall>(j :: int). (0 :: int) \<le> j \<and> j < int (length l) \<longrightarrow> \<not>nth_opt l j = Some (0 :: int))" for l
theorem search'vc:
  fixes l :: "int list"
  fixes i :: "int"
  shows "case l of Nil \<Rightarrow> True | Cons x r \<Rightarrow> \<not>x = (0 :: int) \<longrightarrow> (case l of Nil \<Rightarrow> False | Cons _ f \<Rightarrow> f = r)"
  and "\<forall>(result :: int). (case l of Nil \<Rightarrow> result = i | Cons x r \<Rightarrow> (if x = (0 :: int) then result = i else let o1 :: int = i + (1 :: int) in (o1 \<le> result \<and> result < o1 + int (length r)) \<and> zero_at r (result - o1) \<or> result = o1 + int (length r) \<and> no_zero r)) \<longrightarrow> (i \<le> result \<and> result < i + int (length l)) \<and> zero_at l (result - i) \<or> result = i + int (length l) \<and> no_zero l"
  sorry
end
