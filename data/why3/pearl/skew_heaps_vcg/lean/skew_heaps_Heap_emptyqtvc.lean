import Why3.Base
open Classical
open Lean4Why3
namespace skew_heaps_Heap_emptyqtvc
axiom elt : Type
axiom inhabited_axiom_elt : Inhabited elt
attribute [instance] inhabited_axiom_elt
axiom le : elt -> elt -> Prop
axiom Refl (x : elt) : le x x
axiom Trans (x : elt) (y : elt) (z : elt) (fact0 : le x y) (fact1 : le y z) : le x z
axiom Total (x : elt) (y : elt) : le x y ∨ le y x
axiom t : Type
axiom inhabited_axiom_t : Inhabited t
attribute [instance] inhabited_axiom_t
axiom size : t -> ℤ
axiom occ : elt -> t -> ℤ
noncomputable def mem (x : elt) (t1 : t) := (0 : ℤ) < occ x t1
axiom minimum : t -> elt
noncomputable def is_minimum (x : elt) (t1 : t) := mem x t1 ∧ (∀(e : elt), mem e t1 → le x e)
axiom min_is_min (t1 : t) (fact0 : (0 : ℤ) < size t1) : is_minimum (minimum t1) t1
theorem empty'vc : True
  := sorry
end skew_heaps_Heap_emptyqtvc
