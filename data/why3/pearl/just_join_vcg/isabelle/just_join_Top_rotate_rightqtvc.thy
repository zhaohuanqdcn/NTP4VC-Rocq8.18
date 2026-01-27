theory just_join_Top_rotate_rightqtvc
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
theorem rotate_right'vc:
  fixes t :: "tree"
  assumes fact0: "wf t"
  assumes fact1: "bst t"
  assumes fact2: "case t of N _ (N _ _ _ _) _ _ \<Rightarrow> True | _ \<Rightarrow> False"
  shows "case t of N _ (N _ a x b) y c \<Rightarrow> True | _ \<Rightarrow> False"
  and "\<forall>(r :: tree). (case t of N _ (N _ a x b) y c \<Rightarrow> r = node a x (node b y c) | _ \<Rightarrow> False) \<longrightarrow> wf r \<and> bst r \<and> (case t of N _ (N _ a x b) y c \<Rightarrow> (case r of N _ ra rx (N _ rb ry rc) \<Rightarrow> ra = a \<and> rx = x \<and> rb = b \<and> ry = y \<and> rc = c | _ \<Rightarrow> False) | _ \<Rightarrow> False)"
  sorry
end
