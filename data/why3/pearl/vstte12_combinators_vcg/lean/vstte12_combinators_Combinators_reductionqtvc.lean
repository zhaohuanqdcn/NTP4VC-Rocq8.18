import Why3.Base
open Classical
open Lean4Why3
namespace vstte12_combinators_Combinators_reductionqtvc
inductive term where
  | S : term
  | K : term
  | App : term -> term -> term
axiom inhabited_axiom_term : Inhabited term
attribute [instance] inhabited_axiom_term
noncomputable def eq : term -> term -> Prop
  | term.S, term.S => True
  | term.K, term.K => True
  | (term.App x1 x2), (term.App y1 y2) => eq x1 y1 ∧ eq x2 y2
  | x, x0 => False
axiom eq'spec (x : term) (y : term) : eq x y = (x = y)
noncomputable def is_value : term -> Prop
  | term.K => True
  | term.S => True
  | (term.App term.K v) => is_value v
  | (term.App term.S v) => is_value v
  | (term.App (term.App term.S v1) v2) => is_value v1 ∧ is_value v2
  | x => False
inductive context where
  | Hole : context
  | Left : context -> term -> context
  | Right : term -> context -> context
axiom inhabited_axiom_context : Inhabited context
attribute [instance] inhabited_axiom_context
noncomputable def is_context : context -> Prop
  | context.Hole => True
  | (context.Left c1 x) => is_context c1
  | (context.Right v c1) => is_value v ∧ is_context c1
noncomputable def subst : context -> term -> term
  | context.Hole, t => t
  | (context.Left c1 t2), t => term.App (subst c1 t) t2
  | (context.Right v1 c2), t => term.App v1 (subst c2 t)
inductive infix_mnmngt : term -> term -> Prop where
 | red_K (c : context) (v1 : term) (v2 : term) : is_context c → is_value v1 → is_value v2 → infix_mnmngt (subst c (term.App (term.App term.K v1) v2)) (subst c v1)
 | red_S (c : context) (v1 : term) (v2 : term) (v3 : term) : is_context c → is_value v1 → is_value v2 → is_value v3 → infix_mnmngt (subst c (term.App (term.App (term.App term.S v1) v2) v3)) (subst c (term.App (term.App v1 v3) (term.App v2 v3)))
inductive relTR : term -> term -> Prop where
 | BaseTransRefl (x : term) : relTR x x
 | StepTransRefl (x : term) (y : term) (z : term) : relTR x y → infix_mnmngt y z → relTR x z
axiom relTR_transitive (x : term) (y : term) (z : term) (fact0 : relTR x y) (fact1 : relTR y z) : relTR x z
inductive zipper where
  | ZHole : zipper
  | ZLeft : context -> term -> zipper
  | ZRight : term -> context -> zipper
axiom inhabited_axiom_zipper : Inhabited zipper
attribute [instance] inhabited_axiom_zipper
noncomputable def subst_c : context -> context -> context
  | context.Hole, ct => ct
  | (context.Left c1 t2), ct => context.Left (subst_c c1 ct) t2
  | (context.Right v1 c2), ct => context.Right v1 (subst_c c2 ct)
axiom subst_c'spec (c : context) (ct : context) (fact0 : is_context c) (fact1 : is_context ct) : is_context (subst_c c ct)
theorem reduction'vc (c : context) (t : term) (fact0 : is_context c) : match t with | term.S => (let result : term := term.S; relTR (subst c t) (subst c result) ∧ is_value result) | term.K => (let result : term := term.K; relTR (subst c t) (subst c result) ∧ is_value result) | term.App t1 t2 => (let o1 : context := context.Left context.Hole t2; let o2 : context := subst_c c o1; (is_context c ∧ is_context o1 → is_context o2) → is_context o2 ∧ (∀(v1 : term), relTR (subst o2 t1) (subst o2 v1) ∧ is_value v1 → (let o3 : context := context.Right v1 context.Hole; let o4 : context := subst_c c o3; (is_context c ∧ is_context o3 → is_context o4) → is_context o4 ∧ (∀(v2 : term), relTR (subst o4 t2) (subst o4 v2) ∧ is_value v2 → (match v1 with | term.K => (let result : term := term.App v1 v2; relTR (subst c t) (subst c result) ∧ is_value result) | term.S => (let result : term := term.App v1 v2; relTR (subst c t) (subst c result) ∧ is_value result) | term.App term.S _ => (let result : term := term.App v1 v2; relTR (subst c t) (subst c result) ∧ is_value result) | term.App term.K v3 => relTR (subst c t) (subst c v3) ∧ is_value v3 | term.App (term.App term.S v3) v4 => is_context c ∧ (∀(result : term), relTR (subst c (term.App (term.App v3 v2) (term.App v4 v2))) (subst c result) ∧ is_value result → relTR (subst c t) (subst c result) ∧ is_value result) | _ => False)))))
  := sorry
end vstte12_combinators_Combinators_reductionqtvc
