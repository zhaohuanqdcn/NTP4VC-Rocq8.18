theory zeros_AllZeros_all_zeros1qtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
definition all_zeros :: "int list \<Rightarrow> int \<Rightarrow> _"
  where "all_zeros a hi \<longleftrightarrow> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < hi \<longrightarrow> a ! nat i = (0 :: int))" for a hi
theorem all_zeros1'vc:
  fixes a :: "int list"
  shows "let o1 :: int = int (length a) - (1 :: int) in ((0 :: int) \<le> o1 + (1 :: int) \<longrightarrow> all_zeros a (0 :: int) \<and> (\<forall>(res :: bool). (\<forall>(i :: int). ((0 :: int) \<le> i \<and> i \<le> o1) \<and> (res = True \<longleftrightarrow> all_zeros a i) \<longrightarrow> ((0 :: int) \<le> i \<and> i < int (length a)) \<and> (if \<not>a ! nat i = (0 :: int) then False = True \<longleftrightarrow> all_zeros a (i + (1 :: int)) else res = True \<longleftrightarrow> all_zeros a (i + (1 :: int)))) \<and> ((res = True \<longleftrightarrow> all_zeros a (o1 + (1 :: int))) \<longrightarrow> res = True \<longleftrightarrow> all_zeros a (int (length a))))) \<and> (o1 + (1 :: int) < (0 :: int) \<longrightarrow> all_zeros a (int (length a)))"
  sorry
end
