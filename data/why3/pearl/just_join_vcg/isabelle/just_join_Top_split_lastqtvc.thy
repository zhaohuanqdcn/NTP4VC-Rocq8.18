theory just_join_Top_split_lastqtvc
  imports "NTP4Verif.NTP4Verif"
begin
typedecl  elt
consts lt :: "elt \<Rightarrow> elt \<Rightarrow> bool"
axiomatization where Trans:   "lt x z"
 if "lt x y"
 and "lt y z"
  for x :: "elt"
  and y :: "elt"
  and z :: "elt"
axiomatization where Asymm:   "\<not>lt y x"
 if "lt x y"
  for x :: "elt"
  and y :: "elt"
axiomatization where Trichotomy:   "lt x y \<or> lt y x \<or> x = y"
  for x :: "elt"
  and y :: "elt"
datatype  tree = E | N "int" "tree" "elt" "tree"
definition ht :: "tree \<Rightarrow> int"
  where "ht t = (case t of E \<Rightarrow> (0 :: int) | N h _ _ _ \<Rightarrow> h)" for t
definition node :: "tree \<Rightarrow> elt \<Rightarrow> tree \<Rightarrow> tree"
  where "node l x r = N ((1 :: int) + max (ht l) (ht r)) l x r" for l x r
fun height :: "tree \<Rightarrow> int"
  where "height (E :: tree) = (0 :: int)"
      | "height (N x l x0 r) = (1 :: int) + max (height l) (height r)" for x l x0 r
axiomatization where height'spec:   "(0 :: int) \<le> height t"
  for t :: "tree"
fun wf :: "tree \<Rightarrow> _"
  where "wf (E :: tree) = True"
      | "wf (N h l x_x r) = (h = height (N h l x_x r) \<and> wf l \<and> wf r)" for h l x_x r
fun mem :: "elt \<Rightarrow> tree \<Rightarrow> _"
  where "mem y (E :: tree) = False" for y
      | "mem y (N x0 l x r) = (mem y l \<or> y = x \<or> mem y r)" for y x0 l x r
definition tree_lt :: "tree \<Rightarrow> elt \<Rightarrow> _"
  where "tree_lt t y \<longleftrightarrow> (\<forall>(x :: elt). mem x t \<longrightarrow> lt x y)" for t y
definition lt_tree :: "elt \<Rightarrow> tree \<Rightarrow> _"
  where "lt_tree y t \<longleftrightarrow> (\<forall>(x :: elt). mem x t \<longrightarrow> lt y x)" for y t
fun bst :: "tree \<Rightarrow> _"
  where "bst (E :: tree) = True"
      | "bst (N x0 l x r) = (bst l \<and> tree_lt l x \<and> bst r \<and> lt_tree x r)" for x0 l x r
fun avl :: "tree \<Rightarrow> _"
  where "avl (E :: tree) = True"
      | "avl (N x l x0 r) = (avl l \<and> avl r \<and> -(1 :: int) \<le> height l - height r \<and> height l - height r \<le> (1 :: int))" for x l x0 r
theorem split_last'vc:
  fixes t :: "tree"
  assumes fact0: "\<not>t = (E :: tree)"
  assumes fact1: "wf t"
  assumes fact2: "bst t"
  assumes fact3: "avl t"
  shows "case t of N _ l x E \<Rightarrow> True | N _ l x r \<Rightarrow> (((0 :: int) \<le> height t \<and> height r < height t) \<and> \<not>r = (E :: tree) \<and> wf r \<and> bst r \<and> avl r) \<and> (\<forall>(r' :: tree) (m :: elt). (wf r' \<and> bst r' \<and> avl r') \<and> (\<forall>(x1 :: elt). mem x1 r \<longleftrightarrow> mem x1 r' \<and> lt x1 m \<or> x1 = m) \<and> tree_lt r' m \<longrightarrow> (wf l \<and> wf r') \<and> (bst l \<and> tree_lt l x) \<and> (bst r' \<and> lt_tree x r') \<and> avl l \<and> avl r') | _ \<Rightarrow> False"
  and "\<forall>(r :: tree) (m :: elt). (case t of N _ l x E \<Rightarrow> r = l \<and> m = x | N _ l x r1 \<Rightarrow> (\<exists>(r2 :: tree). ((wf r2 \<and> bst r2 \<and> avl r2) \<and> (\<forall>(x1 :: elt). mem x1 r1 \<longleftrightarrow> mem x1 r2 \<and> lt x1 m \<or> x1 = m) \<and> tree_lt r2 m) \<and> wf r \<and> bst r \<and> (\<forall>(y :: elt). mem y r \<longleftrightarrow> mem y l \<or> y = x \<or> mem y r2) \<and> avl r \<and> height r \<le> (1 :: int) + max (height l) (height r2)) | _ \<Rightarrow> False) \<longrightarrow> (wf r \<and> bst r \<and> avl r) \<and> (\<forall>(x :: elt). mem x t \<longleftrightarrow> mem x r \<and> lt x m \<or> x = m) \<and> tree_lt r m"
  sorry
end
