import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace finite_tarski_Tarski_while_least_fix_pointqtvc
axiom t : Type
axiom inhabited_axiom_t : Inhabited t
attribute [instance] inhabited_axiom_t
axiom rel : t -> t -> Prop
axiom Refl (x : t) : rel x x
axiom Trans (x : t) (y : t) (z : t) (fact0 : rel x y) (fact1 : rel y z) : rel x z
axiom Antisymm (x : t) (y : t) (fact0 : rel x y) (fact1 : rel y x) : x = y
axiom a : Finset t
axiom e : t
axiom minimality : e ∈ a ∧ (∀(x : t), x ∈ a → rel e x)
axiom f : t -> t
axiom range (x : t) (fact0 : x ∈ a) : f x ∈ a
axiom monotone (x : t) (y : t) (fact0 : x ∈ a) (fact1 : y ∈ a) (fact2 : rel x y) : rel (f x) (f y)
noncomputable def fixpoint (x : t) := x ∈ a ∧ f x = x
theorem least_fix_point'vc : ∃(mu : t), fixpoint mu ∧ (∀(x : t), fixpoint x → rel mu x)
  := sorry
end finite_tarski_Tarski_while_least_fix_pointqtvc
