theory zeros_AllZeros_all_zeros2qtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
definition all_zeros :: "int list \<Rightarrow> int \<Rightarrow> _"
  where "all_zeros a hi \<longleftrightarrow> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < hi \<longrightarrow> a ! nat i = (0 :: int))" for a hi
theorem all_zeros2'vc:
  fixes a :: "int list"
  shows "(0 :: int) \<le> (0 :: int)"
  and "(0 :: int) \<le> int (length a)"
  and "all_zeros a (0 :: int)"
  and "\<forall>(i :: int) (res :: bool). ((0 :: int) \<le> i \<and> i \<le> int (length a)) \<and> (res = True \<longleftrightarrow> all_zeros a i) \<longrightarrow> (\<forall>(o1 :: bool). (if res = True then o1 = (if i < int (length a) then True else False) else o1 = False) \<longrightarrow> (if o1 = True then ((0 :: int) \<le> i \<and> i < int (length a)) \<and> ((0 :: int) \<le> int (length a) - i \<and> int (length a) - (i + (1 :: int)) < int (length a) - i) \<and> ((0 :: int) \<le> i + (1 :: int) \<and> i + (1 :: int) \<le> int (length a)) \<and> ((if a ! nat i = (0 :: int) then True else False) = True \<longleftrightarrow> all_zeros a (i + (1 :: int))) else res = True \<longleftrightarrow> all_zeros a (int (length a))))"
  sorry
end
