theory just_join_Top_join_rightqtvc
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
theorem join_right'vc:
  fixes l :: "tree"
  fixes r :: "tree"
  fixes x :: "elt"
  assumes fact0: "wf l"
  assumes fact1: "wf r"
  assumes fact2: "bst l"
  assumes fact3: "tree_lt l x"
  assumes fact4: "bst r"
  assumes fact5: "lt_tree x r"
  assumes fact6: "height r + (2 :: int) \<le> height l"
  assumes fact7: "avl l"
  assumes fact8: "avl r"
  shows "case l of N _ ll lx lr \<Rightarrow> (if ht lr \<le> ht r + (1 :: int) then let t :: tree = node lr x r in \<not>ht t \<le> ht ll + (1 :: int) \<longrightarrow> (wf t \<and> bst t \<and> (case t of N _ (N _ _ _ _) _ _ \<Rightarrow> True | _ \<Rightarrow> False)) \<and> (\<forall>(o1 :: tree). wf o1 \<and> bst o1 \<and> (case t of N _ (N _ a x1 b) y c \<Rightarrow> (case o1 of N _ ra rx (N _ rb ry rc) \<Rightarrow> ra = a \<and> rx = x1 \<and> rb = b \<and> ry = y \<and> rc = c | _ \<Rightarrow> False) | _ \<Rightarrow> False) \<longrightarrow> (let o2 :: tree = node ll lx o1 in wf o2 \<and> bst o2 \<and> (case o2 of N _ _ _ (N _ _ _ _) \<Rightarrow> True | _ \<Rightarrow> False))) else (((0 :: int) \<le> height l \<and> height lr < height l) \<and> (wf lr \<and> wf r) \<and> (bst lr \<and> tree_lt lr x) \<and> (bst r \<and> lt_tree x r) \<and> height r + (2 :: int) \<le> height lr \<and> avl lr \<and> avl r) \<and> (\<forall>(t :: tree). wf t \<and> bst t \<and> (\<forall>(y :: elt). mem y t \<longleftrightarrow> mem y lr \<or> y = x \<or> mem y r) \<and> avl t \<and> (height t = height lr \<or> height t = height lr + (1 :: int) \<and> (case t of N _ rl _ rr \<Rightarrow> height rl = height lr - (1 :: int) \<and> height rr = height lr | _ \<Rightarrow> False)) \<longrightarrow> (let t' :: tree = node ll lx t in \<not>ht t \<le> ht ll + (1 :: int) \<longrightarrow> wf t' \<and> bst t' \<and> (case t' of N _ _ _ (N _ _ _ _) \<Rightarrow> True | _ \<Rightarrow> False)))) | E \<Rightarrow> False"
  and "\<forall>(result :: tree). (case l of N _ ll lx lr \<Rightarrow> (if ht lr \<le> ht r + (1 :: int) then let t :: tree = node lr x r in if ht t \<le> ht ll + (1 :: int) then result = node ll lx t else \<exists>(o1 :: tree). (wf o1 \<and> bst o1 \<and> (case t of N _ (N _ a x1 b) y c \<Rightarrow> (case o1 of N _ ra rx (N _ rb ry rc) \<Rightarrow> ra = a \<and> rx = x1 \<and> rb = b \<and> ry = y \<and> rc = c | _ \<Rightarrow> False) | _ \<Rightarrow> False)) \<and> wf result \<and> bst result \<and> (case node ll lx o1 of N _ a x1 (N _ b y c) \<Rightarrow> (case result of N _ (N _ ra rx rb) ry rc \<Rightarrow> ra = a \<and> rx = x1 \<and> rb = b \<and> ry = y \<and> rc = c | _ \<Rightarrow> False) | _ \<Rightarrow> False) else \<exists>(t :: tree). (wf t \<and> bst t \<and> (\<forall>(y :: elt). mem y t \<longleftrightarrow> mem y lr \<or> y = x \<or> mem y r) \<and> avl t \<and> (height t = height lr \<or> height t = height lr + (1 :: int) \<and> (case t of N _ rl _ rr \<Rightarrow> height rl = height lr - (1 :: int) \<and> height rr = height lr | _ \<Rightarrow> False))) \<and> (let t' :: tree = node ll lx t in if ht t \<le> ht ll + (1 :: int) then result = t' else wf result \<and> bst result \<and> (case t' of N _ a x1 (N _ b y c) \<Rightarrow> (case result of N _ (N _ ra rx rb) ry rc \<Rightarrow> ra = a \<and> rx = x1 \<and> rb = b \<and> ry = y \<and> rc = c | _ \<Rightarrow> False) | _ \<Rightarrow> False))) | E \<Rightarrow> False) \<longrightarrow> wf result \<and> bst result \<and> (\<forall>(y :: elt). mem y result \<longleftrightarrow> mem y l \<or> y = x \<or> mem y r) \<and> avl result \<and> (height result = height l \<or> height result = height l + (1 :: int) \<and> (case result of N _ rl _ rr \<Rightarrow> height rl = height l - (1 :: int) \<and> height rr = height l | _ \<Rightarrow> False))"
  sorry
end
