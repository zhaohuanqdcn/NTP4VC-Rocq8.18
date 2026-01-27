import Why3.Base
open Classical
open Lean4Why3
namespace vstte12_combinators_Combinators_eqqtvc
inductive term where
  | S : term
  | K : term
  | App : term -> term -> term
axiom inhabited_axiom_term : Inhabited term
attribute [instance] inhabited_axiom_term
theorem eq'vc (y : term) (x : term) : (match y with | term.S => (match x with | term.S => True | _ => True) | term.K => (match x with | term.K => True | _ => True) | term.App x1 x2 => (match x with | term.App x3 x4 => True | _ => True)) ∧ (∀(result : Bool), (match y with | term.S => (match x with | term.S => result = true | _ => result = false) | term.K => (match x with | term.K => result = true | _ => result = false) | term.App x1 x2 => (match x with | term.App x3 x4 => (if x3 = x1 then result = (if x4 = x2 then true else false) else result = false) | _ => result = false)) → (result = true) = (x = y))
  := sorry
end vstte12_combinators_Combinators_eqqtvc
