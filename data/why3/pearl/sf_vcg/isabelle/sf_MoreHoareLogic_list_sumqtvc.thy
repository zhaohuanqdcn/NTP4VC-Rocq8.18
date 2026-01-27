theory sf_MoreHoareLogic_list_sumqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
fun sum :: "int list \<Rightarrow> int"
  where "sum (Nil :: int list) = (0 :: int)"
      | "sum (Cons x r) = x + sum r" for x r
theorem list_sum'vc:
  fixes l :: "int list"
  shows "length l \<le> length l"
  and "(0 :: int) + sum l = sum l"
  and "\<forall>(y :: int) (l1 :: int list). length l1 \<le> length l \<and> y + sum l1 = sum l \<longrightarrow> (is_Nil l1 \<longleftrightarrow> l1 = (Nil :: int list)) \<longrightarrow> (if \<not>is_Nil l1 then \<not>l1 = (Nil :: int list) \<and> (\<forall>(o1 :: int). Some o1 = (if l1 = Nil then None else Some (hd l1)) \<longrightarrow> \<not>l1 = (Nil :: int list) \<and> (\<forall>(o2 :: int list). Some o2 = (if l1 = Nil then None else Some (tl l1)) \<longrightarrow> (case l1 of Nil \<Rightarrow> False | Cons _ f \<Rightarrow> f = o2) \<and> length o2 \<le> length l \<and> y + o1 + sum o2 = sum l)) else y = sum l)"
  sorry
end
