theory zeros_AllZeros_all_zeros3qtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
definition all_zeros :: "int list \<Rightarrow> int \<Rightarrow> _"
  where "all_zeros a hi \<longleftrightarrow> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < hi \<longrightarrow> a ! nat i = (0 :: int))" for a hi
theorem all_zeros3'vc:
  fixes a :: "int list"
  shows "(0 :: int) \<le> (0 :: int)"
  and "(0 :: int) \<le> int (length a)"
  and "all_zeros a (0 :: int)"
  and "\<forall>(i :: int). ((0 :: int) \<le> i \<and> i \<le> int (length a)) \<and> all_zeros a i \<longrightarrow> (let o1 :: int = int (length a) in (i < o1 \<longrightarrow> (0 :: int) \<le> i \<and> i < int (length a)) \<and> (\<forall>(o2 :: bool). (if i < o1 then o2 = (if a ! nat i = (0 :: int) then True else False) else o2 = False) \<longrightarrow> (if o2 = True then ((0 :: int) \<le> int (length a) - i \<and> int (length a) - (i + (1 :: int)) < int (length a) - i) \<and> ((0 :: int) \<le> i + (1 :: int) \<and> i + (1 :: int) \<le> int (length a)) \<and> all_zeros a (i + (1 :: int)) else i = int (length a) \<longleftrightarrow> all_zeros a (int (length a)))))"
  sorry
end
