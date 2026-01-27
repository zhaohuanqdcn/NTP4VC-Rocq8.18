import Why3.Base
open Classical
open Lean4Why3
namespace vstte12_combinators_Combinators_reduce_stepqtvc
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
noncomputable def irreducible (t : term) := ∀(t' : term), ¬infix_mnmngt t t'
theorem reduce_step'vc (c : context) (t : term) (fact0 : is_context c) : match t with | term.App t1 t2 => (let o1 : context := context.Left context.Hole t2; let o2 : context := subst_c c o1; (is_context c ∧ is_context o1 → is_context o2) → ((match t with | term.S => False | term.K => False | term.App f f1 => f = t1 ∨ f1 = t1) ∧ is_context o2) ∧ (∀(o3 : term), infix_mnmngt (subst o2 t1) (subst o2 o3) → infix_mnmngt (subst c t) (subst c (term.App o3 t2))) ∧ (is_value t1 → (let o3 : context := context.Right t1 context.Hole; let o4 : context := subst_c c o3; (is_context c ∧ is_context o3 → is_context o4) → ((match t with | term.S => False | term.K => False | term.App f f1 => f = t2 ∨ f1 = t2) ∧ is_context o4) ∧ (∀(o5 : term), infix_mnmngt (subst o4 t2) (subst o4 o5) → infix_mnmngt (subst c t) (subst c (term.App t1 o5))) ∧ (is_value t2 → (match t1 with | term.App term.K v => infix_mnmngt (subst c t) (subst c v) | term.App (term.App term.S v1) v2 => infix_mnmngt (subst c t) (subst c (term.App (term.App v1 t2) (term.App v2 t2))) | _ => is_value t))))) | _ => is_value t
  := sorry
end vstte12_combinators_Combinators_reduce_stepqtvc
