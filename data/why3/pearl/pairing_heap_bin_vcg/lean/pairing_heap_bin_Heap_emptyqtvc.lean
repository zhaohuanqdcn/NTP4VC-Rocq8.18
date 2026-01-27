import Why3.Base
open Classical
open Lean4Why3
namespace pairing_heap_bin_Heap_emptyqtvc
axiom elt : Type
axiom inhabited_axiom_elt : Inhabited elt
attribute [instance] inhabited_axiom_elt
axiom le : elt -> elt -> Prop
axiom Refl (x : elt) : le x x
axiom Trans (x : elt) (y : elt) (z : elt) (fact0 : le x y) (fact1 : le y z) : le x z
axiom Total (x : elt) (y : elt) : le x y ∨ le y x
axiom heap : Type
axiom inhabited_axiom_heap : Inhabited heap
attribute [instance] inhabited_axiom_heap
axiom size : heap -> ℤ
axiom occ : elt -> heap -> ℤ
noncomputable def mem (x : elt) (h : heap) := (0 : ℤ) < occ x h
axiom minimum : heap -> elt
noncomputable def is_minimum (x : elt) (h : heap) := mem x h ∧ (∀(e : elt), mem e h → le x e)
axiom min_def (h : heap) (fact0 : (0 : ℤ) < size h) : is_minimum (minimum h) h
theorem empty'vc : True
  := sorry
end pairing_heap_bin_Heap_emptyqtvc
