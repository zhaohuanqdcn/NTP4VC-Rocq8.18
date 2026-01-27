theory vstte10_search_list_SearchingALinkedList_search_loopqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
definition zero_at :: "int list \<Rightarrow> int \<Rightarrow> _"
  where "zero_at l i \<longleftrightarrow> nth_opt l i = Some (0 :: int) \<and> (\<forall>(j :: int). (0 :: int) \<le> j \<and> j < i \<longrightarrow> \<not>nth_opt l j = Some (0 :: int))" for l i
definition no_zero :: "int list \<Rightarrow> _"
  where "no_zero l \<longleftrightarrow> (\<forall>(j :: int). (0 :: int) \<le> j \<and> j < int (length l) \<longrightarrow> \<not>nth_opt l j = Some (0 :: int))" for l
theorem search_loop'vc:
  fixes l :: "int list"
  shows "(0 :: int) \<le> (0 :: int)"
  and "(0 :: int) + int (length l) = int (length l)"
  and "\<forall>(j :: int). (0 :: int) \<le> j \<longrightarrow> nth_opt l j = nth_opt l ((0 :: int) + j)"
  and "\<forall>(j :: int). (0 :: int) \<le> j \<and> j < (0 :: int) \<longrightarrow> \<not>nth_opt l j = Some (0 :: int)"
  and "\<forall>(s :: int list) (i :: int). (0 :: int) \<le> i \<and> i + int (length s) = int (length l) \<and> (\<forall>(j :: int). (0 :: int) \<le> j \<longrightarrow> nth_opt s j = nth_opt l (i + j)) \<and> (\<forall>(j :: int). (0 :: int) \<le> j \<and> j < i \<longrightarrow> \<not>nth_opt l j = Some (0 :: int)) \<longrightarrow> (is_Nil s \<longleftrightarrow> s = (Nil :: int list)) \<longrightarrow> (\<not>is_Nil s \<longrightarrow> \<not>s = (Nil :: int list)) \<and> (\<forall>(o1 :: bool). (if \<not>is_Nil s then \<exists>(o2 :: int). (if s = Nil then None else Some (hd s)) = Some o2 \<and> o1 = (if o2 = (0 :: int) then False else True) else o1 = False) \<longrightarrow> (if o1 = True then \<not>s = (Nil :: int list) \<and> (\<forall>(o2 :: int list). (if s = Nil then None else Some (tl s)) = Some o2 \<longrightarrow> (case s of Nil \<Rightarrow> False | Cons _ f \<Rightarrow> f = o2) \<and> (0 :: int) \<le> i + (1 :: int) \<and> i + (1 :: int) + int (length o2) = int (length l) \<and> (\<forall>(j :: int). (0 :: int) \<le> j \<longrightarrow> nth_opt o2 j = nth_opt l (i + (1 :: int) + j)) \<and> (\<forall>(j :: int). (0 :: int) \<le> j \<and> j < i + (1 :: int) \<longrightarrow> \<not>nth_opt l j = Some (0 :: int))) else ((0 :: int) \<le> i \<and> i < int (length l)) \<and> zero_at l i \<or> i = int (length l) \<and> no_zero l))"
  sorry
end
