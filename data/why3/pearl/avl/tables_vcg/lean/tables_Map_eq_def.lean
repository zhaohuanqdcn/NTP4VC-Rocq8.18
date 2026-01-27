import Why3.Base
import Why3.why3.Ref.Ref
import pearl.avl.lib.lean.avl.SelectionTypes
open Classical
open Lean4Why3
namespace tables_Map_eq_def
axiom balancing : ℕ
axiom balancing'def : (0 : ℤ) < Int.ofNat balancing
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
axiom t1 : Type -> Type
axiom inhabited_axiom_t1 {α : Type} [Inhabited α] : Inhabited (t1 α)
attribute [instance] inhabited_axiom_t1
noncomputable def key {α : Type} [Inhabited α] (t2 : t × α) := match t2 with | (a, _) => a
theorem eq_def1 (x : t) (y : t) : eq x y = (le x y ∧ le y x)
  := sorry
end tables_Map_eq_def
