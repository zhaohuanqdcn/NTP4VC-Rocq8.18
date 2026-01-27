theory just_join_Top_splitqtvc
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
theorem split'vc:
  fixes t :: "tree"
  fixes y :: "elt"
  assumes fact0: "wf t"
  assumes fact1: "bst t"
  assumes fact2: "avl t"
  shows "case t of E \<Rightarrow> True | N _ l x r \<Rightarrow> \<not>y = x \<longrightarrow> (if lt y x then (((0 :: int) \<le> height t \<and> height l < height t) \<and> wf l \<and> bst l \<and> avl l) \<and> (\<forall>(ll :: tree) (b :: bool) (lr :: tree). (wf ll \<and> bst ll \<and> avl ll) \<and> tree_lt ll y \<and> (wf lr \<and> bst lr \<and> avl lr) \<and> lt_tree y lr \<and> (\<forall>(x1 :: elt). mem x1 l \<longleftrightarrow> mem x1 ll \<or> mem x1 lr \<or> b = True \<and> x1 = y) \<longrightarrow> (wf lr \<and> wf r) \<and> (bst lr \<and> tree_lt lr x) \<and> (bst r \<and> lt_tree x r) \<and> avl lr \<and> avl r) else (((0 :: int) \<le> height t \<and> height r < height t) \<and> wf r \<and> bst r \<and> avl r) \<and> (\<forall>(rl :: tree) (b :: bool) (rr :: tree). (wf rl \<and> bst rl \<and> avl rl) \<and> tree_lt rl y \<and> (wf rr \<and> bst rr \<and> avl rr) \<and> lt_tree y rr \<and> (\<forall>(x1 :: elt). mem x1 r \<longleftrightarrow> mem x1 rl \<or> mem x1 rr \<or> b = True \<and> x1 = y) \<longrightarrow> (wf l \<and> wf rl) \<and> (bst l \<and> tree_lt l x) \<and> (bst rl \<and> lt_tree x rl) \<and> avl l \<and> avl rl))"
  and "\<forall>(l :: tree) (b :: bool) (r :: tree). (case t of E \<Rightarrow> l = (E :: tree) \<and> b = False \<and> r = (E :: tree) | N _ l1 x r1 \<Rightarrow> (if y = x then l = l1 \<and> b = True \<and> r = r1 else if lt y x then \<exists>(r2 :: tree). ((wf l \<and> bst l \<and> avl l) \<and> tree_lt l y \<and> (wf r2 \<and> bst r2 \<and> avl r2) \<and> lt_tree y r2 \<and> (\<forall>(x1 :: elt). mem x1 l1 \<longleftrightarrow> mem x1 l \<or> mem x1 r2 \<or> b = True \<and> x1 = y)) \<and> wf r \<and> bst r \<and> (\<forall>(y1 :: elt). mem y1 r \<longleftrightarrow> mem y1 r2 \<or> y1 = x \<or> mem y1 r1) \<and> avl r \<and> height r \<le> (1 :: int) + max (height r2) (height r1) else \<exists>(l2 :: tree). ((wf l2 \<and> bst l2 \<and> avl l2) \<and> tree_lt l2 y \<and> (wf r \<and> bst r \<and> avl r) \<and> lt_tree y r \<and> (\<forall>(x1 :: elt). mem x1 r1 \<longleftrightarrow> mem x1 l2 \<or> mem x1 r \<or> b = True \<and> x1 = y)) \<and> wf l \<and> bst l \<and> (\<forall>(y1 :: elt). mem y1 l \<longleftrightarrow> mem y1 l1 \<or> y1 = x \<or> mem y1 l2) \<and> avl l \<and> height l \<le> (1 :: int) + max (height l1) (height l2))) \<longrightarrow> (wf l \<and> bst l \<and> avl l) \<and> tree_lt l y \<and> (wf r \<and> bst r \<and> avl r) \<and> lt_tree y r \<and> (\<forall>(x :: elt). mem x t \<longleftrightarrow> mem x l \<or> mem x r \<or> b = True \<and> x = y)"
  sorry
end
