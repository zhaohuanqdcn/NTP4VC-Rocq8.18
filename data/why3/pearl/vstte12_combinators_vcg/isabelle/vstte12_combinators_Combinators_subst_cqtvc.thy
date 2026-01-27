theory vstte12_combinators_Combinators_subst_cqtvc
  imports "NTP4Verif.NTP4Verif"
begin
datatype  "term" = S | K | App "term" "term"
fun eq :: "term \<Rightarrow> term \<Rightarrow> _"
  where "eq S S = True"
      | "eq K K = True"
      | "eq (App x1 x2) (App y1 y2) = (eq x1 y1 \<and> eq x2 y2)" for x1 x2 y1 y2
      | "eq x x0 = False" for x x0
axiomatization where eq'spec:   "eq x y \<longleftrightarrow> x = y"
  for x :: "term"
  and y :: "term"
fun is_value :: "term \<Rightarrow> _"
  where "is_value K = True"
      | "is_value S = True"
      | "is_value (App K v) = is_value v" for v
      | "is_value (App S v) = is_value v" for v
      | "is_value (App (App S v1) v2) = (is_value v1 \<and> is_value v2)" for v1 v2
      | "is_value x = False" for x
datatype  "context" = Hole | Left "context" "term" | Right "term" "context"
fun is_context :: "context \<Rightarrow> _"
  where "is_context Hole = True"
      | "is_context (Left c1 x) = is_context c1" for c1 x
      | "is_context (Right v c1) = (is_value v \<and> is_context c1)" for v c1
fun subst :: "context \<Rightarrow> term \<Rightarrow> term"
  where "subst Hole t = t" for t
      | "subst (Left c1 t2) t = App (subst c1 t) t2" for c1 t2 t
      | "subst (Right v1 c2) t = App v1 (subst c2 t)" for v1 c2 t
inductive infix_mnmngt :: "term \<Rightarrow> term \<Rightarrow> bool" where
   red_K: "is_context c \<Longrightarrow> is_value v1 \<Longrightarrow> is_value v2 \<Longrightarrow> infix_mnmngt (subst c (App (App K v1) v2)) (subst c v1)" for c :: "context" and v1 :: "term" and v2 :: "term"
 | red_S: "is_context c \<Longrightarrow> is_value v1 \<Longrightarrow> is_value v2 \<Longrightarrow> is_value v3 \<Longrightarrow> infix_mnmngt (subst c (App (App (App S v1) v2) v3)) (subst c (App (App v1 v3) (App v2 v3)))" for c :: "context" and v1 :: "term" and v2 :: "term" and v3 :: "term"
inductive relTR :: "term \<Rightarrow> term \<Rightarrow> bool" where
   BaseTransRefl: "relTR x x" for x :: "term"
 | StepTransRefl: "relTR x y \<Longrightarrow> infix_mnmngt y z \<Longrightarrow> relTR x z" for x :: "term" and y :: "term" and z :: "term"
axiomatization where relTR_transitive:   "relTR x z"
 if "relTR x y"
 and "relTR y z"
  for x :: "term"
  and y :: "term"
  and z :: "term"
datatype  zipper = ZHole | ZLeft "context" "term" | ZRight "term" "context"
theorem subst_c'vc:
  fixes c :: "context"
  fixes ct :: "context"
  shows "case c of Hole \<Rightarrow> True | Left c1 t2 \<Rightarrow> True | Right v1 c2 \<Rightarrow> True"
  and "\<forall>(result :: context). (case c of Hole \<Rightarrow> result = ct | Left c1 t2 \<Rightarrow> (\<exists>(o1 :: context). (is_context c1 \<and> is_context ct \<longrightarrow> is_context o1) \<and> result = Left o1 t2) | Right v1 c2 \<Rightarrow> (\<exists>(o1 :: context). (is_context c2 \<and> is_context ct \<longrightarrow> is_context o1) \<and> result = Right v1 o1)) \<longrightarrow> is_context c \<and> is_context ct \<longrightarrow> is_context result"
  sorry
end
