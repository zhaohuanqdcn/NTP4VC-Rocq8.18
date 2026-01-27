theory verifythis_2016_tree_traversal_TreeShape_ext_curqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.map_Const" "Why3STD.map_MapExt" "./verifythis_2016_tree_traversal_Memory" "Why3STD.bintree_Tree" "Why3STD.bintree_Size"
begin
typedecl  treel
fun is_tree :: "(kind \<Rightarrow> loc \<Rightarrow> loc) \<Rightarrow> loc tree \<Rightarrow> loc \<Rightarrow> loc \<Rightarrow> _"
  where "is_tree memo (Empty :: loc tree) c p = (c = null)" for memo c p
      | "is_tree memo (Node l m r) c p = (\<not>c = null \<and> c = m \<and> memo Parent c = p \<and> (let cl :: loc = memo Left c; cr :: loc = memo Right c in (cl = null \<longleftrightarrow> cr = null) \<and> is_tree memo l cl c \<and> is_tree memo r cr c))" for memo l m r c p
fun footprint :: "loc tree \<Rightarrow> loc set"
  where "footprint (Empty :: loc tree) = {}"
      | "footprint (Node l m r) = insert m (footprint l \<union> footprint r)" for l m r
definition ext :: "loc set \<Rightarrow> (kind \<Rightarrow> loc \<Rightarrow> loc) \<Rightarrow> (kind \<Rightarrow> loc \<Rightarrow> loc) \<Rightarrow> _"
  where "ext s memo1 memo2 \<longleftrightarrow> (\<forall>(k :: kind) (x :: loc). x \<in> s \<longrightarrow> memo1 k x = memo2 k x)" for s memo1 memo2
definition unchanged :: "(kind \<Rightarrow> loc \<Rightarrow> loc) \<Rightarrow> (kind \<Rightarrow> loc \<Rightarrow> loc) \<Rightarrow> _"
  where "unchanged memo1 memo2 \<longleftrightarrow> (\<forall>(k :: kind) (x :: loc). memo1 k x = memo2 k x)" for memo1 memo2
definition was_marked :: "loc tree \<Rightarrow> (loc \<Rightarrow> bool) \<Rightarrow> (loc \<Rightarrow> bool) \<Rightarrow> _"
  where "was_marked t memo1 memo2 \<longleftrightarrow> (\<forall>(l :: loc). l \<in> footprint t \<longrightarrow> memo2 l = True) \<and> (\<forall>(l :: loc). \<not>l \<in> footprint t \<longrightarrow> memo2 l = memo1 l)" for t memo1 memo2
theorem ext_cur'vc:
  fixes t :: "loc tree"
  fixes memo1 :: "kind \<Rightarrow> loc \<Rightarrow> loc"
  fixes memo :: "memory"
  fixes c :: "loc"
  fixes p :: "loc"
  assumes fact0: "ext (footprint t) memo1 (accessor memo)"
  assumes fact1: "is_tree memo1 t c p"
  shows "let o1 :: kind \<Rightarrow> loc \<Rightarrow> loc = accessor memo; o2 :: loc set = footprint t in (ext o2 memo1 o1 \<and> footprint t \<subseteq> o2 \<and> is_tree memo1 t c p) \<and> (is_tree o1 t c p \<longrightarrow> is_tree (accessor memo) t c p)"
  sorry
end
