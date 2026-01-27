theory linked_list_rev_YetAnotherInPlaceRev_list_reversalqtvc
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
theorem list_reversal'vc:
  fixes mem1 :: "loc \<Rightarrow> loc"
  shows "let mem2 :: mem = mem'mk mem1 in \<forall>(s :: int \<Rightarrow> loc) (n :: int) (l :: loc). valid_cells s n \<and> listLR mem2 s l (0 :: int) n \<longrightarrow> ((if n = (0 :: int) then l = null else l = s (0 :: int) \<or> (0 :: int) = n \<and> null = s (n - (1 :: int)) \<and> l = null \<or> ((0 :: int) < (0 :: int) \<and> (0 :: int) < n) \<and> null = s ((0 :: int) - (1 :: int)) \<and> l = s (0 :: int)) \<and> listRL mem2 s null (0 :: int) (0 :: int) \<and> listLR mem2 s l (0 :: int) n \<and> frame mem2 mem2 s n) \<and> (\<forall>(i :: int) (p :: loc) (l1 :: loc) (mem3 :: loc \<Rightarrow> loc). let mem4 :: mem = mem'mk mem3 in (if n = (0 :: int) then l1 = p \<and> p = null else i = (0 :: int) \<and> p = null \<and> l1 = s (0 :: int) \<or> i = n \<and> p = s (n - (1 :: int)) \<and> l1 = null \<or> ((0 :: int) < i \<and> i < n) \<and> p = s (i - (1 :: int)) \<and> l1 = s i) \<and> listRL mem4 s p (0 :: int) i \<and> listLR mem4 s l1 i n \<and> frame mem4 mem2 s n \<longrightarrow> (if \<not>l1 = null then \<not>l1 = null \<and> \<not>l1 = null \<and> (let mem5 :: mem = mem'mk (mem3(l1 := p)) in ((0 :: int) \<le> n - i \<and> n - (i + (1 :: int)) < n - i) \<and> (if n = (0 :: int) then mem3 l1 = l1 \<and> l1 = null else i + (1 :: int) = (0 :: int) \<and> l1 = null \<and> mem3 l1 = s (0 :: int) \<or> i + (1 :: int) = n \<and> l1 = s (n - (1 :: int)) \<and> mem3 l1 = null \<or> ((0 :: int) < i + (1 :: int) \<and> i + (1 :: int) < n) \<and> l1 = s (i + (1 :: int) - (1 :: int)) \<and> mem3 l1 = s (i + (1 :: int))) \<and> listRL mem5 s l1 (0 :: int) (i + (1 :: int)) \<and> listLR mem5 s (mem3 l1) (i + (1 :: int)) n \<and> frame mem5 mem2 s n) else listRL mem4 s p (0 :: int) n \<and> frame mem4 mem2 s n))"
  sorry
end
