theory zeros_AllZeros_all_zeros4qtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
definition all_zeros :: "int list \<Rightarrow> int \<Rightarrow> _"
  where "all_zeros a hi \<longleftrightarrow> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < hi \<longrightarrow> a ! nat i = (0 :: int))" for a hi
theorem all_zeros4'vc:
  fixes a :: "int list"
  shows "\<forall>(i :: int). ((0 :: int) \<le> i \<and> i \<le> int (length a)) \<and> all_zeros a i \<longrightarrow> (let o1 :: int = int (length a) in (\<not>i = o1 \<longrightarrow> ((0 :: int) \<le> i \<and> i < int (length a)) \<and> (a ! nat i = (0 :: int) \<longrightarrow> (let o2 :: int = i + (1 :: int) in ((0 :: int) \<le> int (length a) - i \<and> int (length a) - o2 < int (length a) - i) \<and> ((0 :: int) \<le> o2 \<and> o2 \<le> int (length a)) \<and> all_zeros a o2))) \<and> (\<forall>(result :: bool). (if i = o1 then result = True else if a ! nat i = (0 :: int) then result = (if all_zeros a (int (length a)) then True else False) else result = False) \<longrightarrow> result = True \<longleftrightarrow> all_zeros a (int (length a))))"
  and "(0 :: int) \<le> (0 :: int)"
  and "(0 :: int) \<le> int (length a)"
  and "all_zeros a (0 :: int)"
  sorry
end
