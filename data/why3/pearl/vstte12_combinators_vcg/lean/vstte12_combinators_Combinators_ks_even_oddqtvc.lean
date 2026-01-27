import Why3.Base
open Classical
open Lean4Why3
namespace vstte12_combinators_Combinators_ks_even_oddqtvc
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
inductive only_K : term -> Prop where
 | only_K_K : only_K term.K
 | only_K_App (t1 : term) (t2 : term) : only_K t1 → only_K t2 → only_K (term.App t1 t2)
axiom ks : ℤ -> term
axiom ks'def (n : ℤ) (fact0 : (0 : ℤ) ≤ n) : if n = (0 : ℤ) then ks n = term.K else ks n = term.App (ks (n - (1 : ℤ))) term.K
axiom ks'spec (n : ℤ) (fact0 : (0 : ℤ) ≤ n) : only_K (ks n)
theorem ks_even_odd'vc (n : ℤ) (fact0 : (0 : ℤ) ≤ n) : relTR (ks ((2 : ℤ) * n)) term.K ∧ relTR (ks ((2 : ℤ) * n + (1 : ℤ))) (term.App term.K term.K)
  := sorry
end vstte12_combinators_Combinators_ks_even_oddqtvc
