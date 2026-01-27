import Why3.Base
open Classical
open Lean4Why3
namespace binomial_heap_BinomialHeap_addqtvc
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
noncomputable def occ : elt -> List tree -> ℤ
  | x, ([] : List tree) => (0 : ℤ)
  | x, (List.cons (tree.mk y c x0) r) => (if x = y then (1 : ℤ) else (0 : ℤ)) + occ x c + occ x r
noncomputable def mem (x : elt) (l : List tree) := (0 : ℤ) < occ x l
noncomputable def has_order : ℤ -> List tree -> Prop
  | k, ([] : List tree) => k = (0 : ℤ)
  | k, (List.cons (tree.mk x c k') r) => k' = k - (1 : ℤ) ∧ has_order (k - (1 : ℤ)) c ∧ has_order (k - (1 : ℤ)) r
noncomputable def binomial_tree (t : tree) := tree.rank t = Int.ofNat (List.length (tree.children t)) ∧ has_order (tree.rank t) (tree.children t)
axiom heap : Type
axiom inhabited_axiom_heap : Inhabited heap
attribute [instance] inhabited_axiom_heap
noncomputable def inv : ℤ -> List tree -> Prop
  | m, ([] : List tree) => True
  | m, (List.cons t r) => let k : ℤ := tree.rank t; m ≤ k ∧ binomial_tree t ∧ inv (k + (1 : ℤ)) r
noncomputable def link (t1 : tree) (t2 : tree) := if le (tree.elem t1) (tree.elem t2) then tree.mk (tree.elem t1) (List.cons t2 (tree.children t1)) (tree.rank t1 + (1 : ℤ)) else tree.mk (tree.elem t2) (List.cons t1 (tree.children t2)) (tree.rank t2 + (1 : ℤ))
theorem add'vc (h : List tree) (x : elt) (fact0 : heaps h) (fact1 : inv (0 : ℤ) h) : let o1 : tree := tree.mk x ([] : List tree) (0 : ℤ); (heaps (List.cons o1 ([] : List tree)) ∧ binomial_tree o1 ∧ heaps h ∧ inv (0 : ℤ) h) ∧ (∀(result : List tree), heaps result ∧ inv (0 : ℤ) result ∧ (∀(x1 : elt), occ x1 result = occ x1 (List.cons o1 ([] : List tree)) + occ x1 h) → heaps result ∧ inv (0 : ℤ) result ∧ occ x result = occ x h + (1 : ℤ) ∧ (∀(e : elt), ¬e = x → occ e result = occ e h))
  := sorry
end binomial_heap_BinomialHeap_addqtvc
