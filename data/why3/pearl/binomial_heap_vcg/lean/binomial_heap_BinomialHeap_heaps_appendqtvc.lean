import Why3.Base
open Classical
open Lean4Why3
namespace binomial_heap_BinomialHeap_heaps_appendqtvc
axiom elt : Type
axiom inhabited_axiom_elt : Inhabited elt
attribute [instance] inhabited_axiom_elt
axiom le : elt -> elt -> Prop
axiom Refl (x : elt) : le x x
axiom Trans (x : elt) (y : elt) (z : elt) (fact0 : le x y) (fact1 : le y z) : le x z
axiom Total (x : elt) (y : elt) : le x y ∨ le y x
structure tree where
  elem : elt
  children : List tree
  rank : ℤ
axiom inhabited_axiom_tree : Inhabited tree
attribute [instance] inhabited_axiom_tree
noncomputable def size : List tree -> ℤ
  | ([] : List tree) => (0 : ℤ)
  | (List.cons (tree.mk x c x0) r) => (1 : ℤ) + size c + size r
noncomputable def le_roots : elt -> List tree -> Prop
  | e, ([] : List tree) => True
  | e, (List.cons t r) => le e (tree.elem t) ∧ le_roots e r
noncomputable def heaps : List tree -> Prop
  | ([] : List tree) => True
  | (List.cons (tree.mk e c x) r) => le_roots e c ∧ heaps c ∧ heaps r
theorem heaps_append'vc (h1 : List tree) (h2 : List tree) (fact0 : heaps h1) (fact1 : heaps h2) : heaps (h1 ++ h2)
  := sorry
end binomial_heap_BinomialHeap_heaps_appendqtvc
