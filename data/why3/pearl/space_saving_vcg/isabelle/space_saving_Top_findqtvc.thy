theory space_saving_Top_findqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "Why3STD.int_Sum"
begin
typedecl  elt
consts dummy :: "elt"
consts minimum :: "int list \<Rightarrow> int"
axiomatization where minimum'spec'0'0:   "(0 :: int) \<le> minimum a"
 if "(0 :: int) < int (length a)"
  for a :: "int list"
axiomatization where minimum'spec'0'1:   "minimum a < int (length a)"
 if "(0 :: int) < int (length a)"
  for a :: "int list"
axiomatization where minimum'spec:   "a ! nat (minimum a) \<le> a ! nat i"
 if "(0 :: int) < int (length a)"
 and "(0 :: int) \<le> i"
 and "i < int (length a)"
  for a :: "int list"
  and i :: "int"
definition occurs :: "elt \<Rightarrow> elt list \<Rightarrow> _"
  where "occurs v a \<longleftrightarrow> (\<exists>(i :: int). ((0 :: int) \<le> i \<and> i < int (length a)) \<and> v = a ! nat i)" for v a
theorem find'vc:
  fixes e :: "elt list"
  fixes x :: "elt"
  shows "let o1 :: int = int (length e) - (1 :: int) in ((0 :: int) \<le> o1 + (1 :: int) \<longrightarrow> (\<forall>(j :: int). (0 :: int) \<le> j \<and> j < (0 :: int) \<longrightarrow> \<not>e ! nat j = x) \<and> (\<forall>(i :: int). ((0 :: int) \<le> i \<and> i \<le> o1) \<and> (\<forall>(j :: int). (0 :: int) \<le> j \<and> j < i \<longrightarrow> \<not>e ! nat j = x) \<longrightarrow> ((0 :: int) \<le> i \<and> i < int (length e)) \<and> (if e ! nat i = x then ((0 :: int) \<le> i \<and> i \<le> int (length e)) \<and> (\<forall>(j :: int). (0 :: int) \<le> j \<and> j < i \<longrightarrow> \<not>e ! nat j = x) \<and> (i < int (length e) \<longrightarrow> e ! nat i = x) else \<forall>(j :: int). (0 :: int) \<le> j \<and> j < i + (1 :: int) \<longrightarrow> \<not>e ! nat j = x)) \<and> ((\<forall>(j :: int). (0 :: int) \<le> j \<and> j < o1 + (1 :: int) \<longrightarrow> \<not>e ! nat j = x) \<longrightarrow> ((0 :: int) \<le> int (length e) \<and> length e \<le> length e) \<and> (\<forall>(j :: int). (0 :: int) \<le> j \<and> j < int (length e) \<longrightarrow> \<not>e ! nat j = x) \<and> (length e < length e \<longrightarrow> e ! length e = x))) \<and> (o1 + (1 :: int) < (0 :: int) \<longrightarrow> ((0 :: int) \<le> int (length e) \<and> length e \<le> length e) \<and> (\<forall>(j :: int). (0 :: int) \<le> j \<and> j < int (length e) \<longrightarrow> \<not>e ! nat j = x) \<and> (length e < length e \<longrightarrow> e ! length e = x))"
  sorry
end
