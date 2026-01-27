import Why3.Base
open Classical
open Lean4Why3
namespace lineardecision_Fmla_fqtvc
axiom value : Type
axiom inhabited_axiom_value : Inhabited value
attribute [instance] inhabited_axiom_value
axiom dummy : value
axiom foo : value -> Prop
axiom add : value -> value -> value
inductive term where
  | Val : ℤ -> term
  | Add : term -> term -> term
axiom inhabited_axiom_term : Inhabited term
attribute [instance] inhabited_axiom_term
inductive fmla where
  | Forall : fmla -> fmla
  | Foo : term -> fmla
axiom inhabited_axiom_fmla : Inhabited fmla
attribute [instance] inhabited_axiom_fmla
noncomputable def interp_term : term -> (ℤ -> value) -> value
  | (term.Val n), b => b n
  | (term.Add t1 t2), b => add (interp_term t1 b) (interp_term t2 b)
noncomputable def interp_fmla : fmla -> ℤ -> (ℤ -> value) -> Bool
  | f, l, b => if match f with | fmla.Foo t => foo (interp_term t b) | fmla.Forall f1 => (∀(v : value), interp_fmla f1 (l - (1 : ℤ)) (Function.update b l v) = true) then true else false
theorem f'vc : True
  := sorry
end lineardecision_Fmla_fqtvc
