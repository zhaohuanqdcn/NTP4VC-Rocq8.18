import Why3.Base
open Classical
open Lean4Why3
namespace preorder_TotalFull_lt_def2qtvc
axiom t : Type
axiom inhabited_axiom_t : Inhabited t
attribute [instance] inhabited_axiom_t
axiom le : t -> t -> Prop
axiom Refl (x : t) : le x x
axiom Trans (x : t) (y : t) (z : t) (fact0 : le x y) (fact1 : le y z) : le x z
axiom eq : t -> t -> Prop
axiom eq_def (x : t) (y : t) : eq x y = (le x y ∧ le y x)
axiom lt : t -> t -> Prop
axiom lt_def (x : t) (y : t) : lt x y = (le x y ∧ ¬le y x)
axiom Total (x : t) (y : t) : le x y ∨ le y x
theorem lt_def2'vc (x : t) (y : t) : lt x y = (¬le y x)
  := sorry
end preorder_TotalFull_lt_def2qtvc
