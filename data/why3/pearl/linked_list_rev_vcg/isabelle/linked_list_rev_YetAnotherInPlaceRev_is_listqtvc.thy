theory linked_list_rev_YetAnotherInPlaceRev_is_listqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
typedecl  loc
consts null :: "loc"
datatype  mem = mem'mk ("next": "loc \<Rightarrow> loc")
definition valid_cells :: "(int \<Rightarrow> loc) \<Rightarrow> int \<Rightarrow> _"
  where "valid_cells s n \<longleftrightarrow> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < n \<longrightarrow> \<not>s i = null) \<and> (\<forall>(i :: int) (j :: int). (0 :: int) \<le> i \<and> i < n \<longrightarrow> (0 :: int) \<le> j \<and> j < n \<longrightarrow> \<not>i = j \<longrightarrow> \<not>s i = s j)" for s n
definition listLR :: "mem \<Rightarrow> (int \<Rightarrow> loc) \<Rightarrow> loc \<Rightarrow> int \<Rightarrow> int \<Rightarrow> _"
  where "listLR m s l lo hi \<longleftrightarrow> ((0 :: int) \<le> lo \<and> lo \<le> hi) \<and> (if lo = hi then l = null else l = s lo \<and> next m (s (hi - (1 :: int))) = null \<and> (\<forall>(k :: int). lo \<le> k \<and> k < hi - (1 :: int) \<longrightarrow> next m (s k) = s (k + (1 :: int))))" for m s l lo hi
definition listRL :: "mem \<Rightarrow> (int \<Rightarrow> loc) \<Rightarrow> loc \<Rightarrow> int \<Rightarrow> int \<Rightarrow> _"
  where "listRL m s l lo hi \<longleftrightarrow> ((0 :: int) \<le> lo \<and> lo \<le> hi) \<and> (if lo = hi then l = null else next m (s lo) = null \<and> l = s (hi - (1 :: int)) \<and> (\<forall>(k :: int). lo < k \<and> k < hi \<longrightarrow> next m (s k) = s (k - (1 :: int))))" for m s l lo hi
definition frame :: "mem \<Rightarrow> mem \<Rightarrow> (int \<Rightarrow> loc) \<Rightarrow> int \<Rightarrow> _"
  where "frame m1 m2 s n \<longleftrightarrow> (\<forall>(p :: loc). (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < n \<longrightarrow> \<not>p = s i) \<longrightarrow> next m1 p = next m2 p)" for m1 m2 s n
theorem is_list'vc:
  fixes n :: "int"
  fixes s :: "int \<Rightarrow> loc"
  fixes l :: "loc"
  assumes fact0: "(0 :: int) \<le> n"
  assumes fact1: "\<not>n = (0 :: int)"
  assumes fact2: "let q1' :: loc = s (0 :: int) in if l = q1' then True = (if q1' = null then False else True) else True = False"
  shows "let o1 :: int = n - (1 :: int) in ((0 :: int) \<le> n \<and> o1 < n) \<and> (0 :: int) \<le> o1"
  sorry
end
