import Why3.Base
import pearl.leftist_heap_vcg.lean.leftist_heap.TreeRank
import pearl.leftist_heap_vcg.lean.leftist_heap.Size
import pearl.leftist_heap_vcg.lean.leftist_heap.Occ
open Classical
open Lean4Why3
namespace leftist_heap_LeftistHeap_le_root_transqtvc
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
noncomputable def le_root (e : elt) (h : TreeRank.tree elt) := match h with | TreeRank.tree.E => True | TreeRank.tree.N _ _ x _ => le e x
theorem le_root_trans'vc (x : elt) (y : elt) (h : TreeRank.tree elt) (fact0 : le x y) (fact1 : le_root y h) : le_root x h
  := sorry
end leftist_heap_LeftistHeap_le_root_transqtvc
