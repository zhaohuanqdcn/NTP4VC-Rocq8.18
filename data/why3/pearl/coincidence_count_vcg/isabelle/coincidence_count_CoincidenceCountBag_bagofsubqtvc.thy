theory coincidence_count_CoincidenceCountBag_bagofsubqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
definition increasing :: "int list \<Rightarrow> _"
  where "increasing a \<longleftrightarrow> (\<forall>(i :: int) (j :: int). (0 :: int) \<le> i \<and> i < j \<and> j < int (length a) \<longrightarrow> a ! nat i \<le> a ! nat j)" for a
theorem bagofsub'vc:
  fixes lo :: "int"
  fixes hi :: "int"
  fixes a :: "'a list"
  assumes fact0: "(0 :: int) \<le> lo"
  assumes fact1: "lo \<le> hi"
  assumes fact2: "hi \<le> int (length a)"
  assumes fact3: "\<not>hi \<le> lo"
  shows "let o1 :: int = lo + (1 :: int) in (((0 :: int) \<le> hi - lo \<and> hi - o1 < hi - lo) \<and> (0 :: int) \<le> o1 \<and> o1 \<le> hi \<and> hi \<le> int (length a)) \<and> (0 :: int) \<le> lo \<and> lo < int (length a)"
  sorry
end
