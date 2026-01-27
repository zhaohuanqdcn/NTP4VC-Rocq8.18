theory leftist_heap_LeftistHeap_make_nqtvc
  imports "NTP4Verif.NTP4Verif" "./leftist_heap_TreeRank" "./leftist_heap_Size" "./leftist_heap_Occ"
begin
typedecl  elt
consts le :: "elt \<Rightarrow> elt \<Rightarrow> bool"
axiomatization where Refl:   "le x x"
  for x :: "elt"
axiomatization where Trans:   "le x z"
 if "le x y"
 and "le y z"
  for x :: "elt"
  and y :: "elt"
  and z :: "elt"
axiomatization where Total:   "le x y \<or> le y x"
  for x :: "elt"
  and y :: "elt"
typedecl  t
definition le_root :: "elt \<Rightarrow> elt tree \<Rightarrow> _"
  where "le_root e h \<longleftrightarrow> (case h of E \<Rightarrow> True | N _ _ x _ \<Rightarrow> le e x)" for e h
fun is_heap :: "elt tree \<Rightarrow> _"
  where "is_heap (E :: elt tree) = True"
      | "is_heap (N x0 l x r) = (le_root x l \<and> is_heap l \<and> le_root x r \<and> is_heap r)" for x0 l x r
consts minimum :: "elt tree \<Rightarrow> elt"
axiomatization where minimum_def:   "minimum (N s l x r) = x"
  for s :: "int"
  and l :: "elt tree"
  and x :: "elt"
  and r :: "elt tree"
definition is_minimum :: "elt \<Rightarrow> elt tree \<Rightarrow> _"
  where "is_minimum x h \<longleftrightarrow> mem x h \<and> (\<forall>(e :: elt). mem e h \<longrightarrow> le x e)" for x h
fun rank :: "elt tree \<Rightarrow> int"
  where "rank (E :: elt tree) = (0 :: int)"
      | "rank (N x l x0 r) = (1 :: int) + min (rank l) (rank r)" for x l x0 r
fun leftist :: "elt tree \<Rightarrow> _"
  where "leftist (E :: elt tree) = True"
      | "leftist (N s l x r) = (s = rank (N s l x r) \<and> leftist l \<and> leftist r \<and> rank r \<le> rank l)" for s l x r
definition leftist_heap :: "elt tree \<Rightarrow> _"
  where "leftist_heap h \<longleftrightarrow> is_heap h \<and> leftist h" for h
theorem make_n'vc:
  fixes r :: "elt tree"
  fixes l :: "elt tree"
  fixes x :: "elt"
  assumes fact0: "leftist_heap r"
  assumes fact1: "leftist_heap l"
  assumes fact2: "le_root x l"
  assumes fact3: "le_root x r"
  shows "leftist_heap r"
  and "let o1 :: int = rank r in leftist_heap l \<and> (let o2 :: int = rank l in (if o1 \<le> o2 then leftist_heap r else leftist_heap l) \<and> (\<forall>(result :: elt tree). (if o1 \<le> o2 then result = N (rank r + (1 :: int)) l x r else result = N (rank l + (1 :: int)) r x l) \<longrightarrow> leftist_heap result \<and> minimum result = x \<and> leftist_heap_Size.size result = (1 :: int) + leftist_heap_Size.size l + leftist_heap_Size.size r \<and> occ x result = (1 :: int) + occ x l + occ x r \<and> (\<forall>(y :: elt). \<not>x = y \<longrightarrow> occ y result = occ y l + occ y r)))"
  sorry
end
