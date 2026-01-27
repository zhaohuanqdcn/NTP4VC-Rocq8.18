import Why3.Base
open Classical
open Lean4Why3
namespace binomial_heap_BinomialHeap_mergeqtvc
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
theorem merge'vc (h1 : List tree) (k : ℤ) (h2 : List tree) (fact0 : heaps h1) (fact1 : inv k h1) (fact2 : heaps h2) (fact3 : inv k h2) : (match h2 with | ([] : List tree) => (match h1 with | ([] : List tree) => True | _ => True) | List.cons x x1 => (match h1 with | ([] : List tree) => True | List.cons x2 x3 => (if tree.rank x2 < tree.rank x then let o1 : ℤ := tree.rank x2 + (1 : ℤ); (match h1 with | ([] : List tree) => False | List.cons _ f => f = x3) ∧ heaps x3 ∧ inv o1 x3 ∧ heaps h2 ∧ inv o1 h2 else if tree.rank x < tree.rank x2 then let o1 : ℤ := tree.rank x + (1 : ℤ); (match h2 with | ([] : List tree) => False | List.cons _ f => f = x1) ∧ heaps h1 ∧ inv o1 h1 ∧ heaps x1 ∧ inv o1 x1 else let o1 : ℤ := tree.rank x2 + (1 : ℤ); (((match h1 with | ([] : List tree) => False | List.cons _ f => f = x3) ∨ h1 = x3 ∧ (match h2 with | ([] : List tree) => False | List.cons _ f => f = x1)) ∧ heaps x3 ∧ inv o1 x3 ∧ heaps x1 ∧ inv o1 x1) ∧ (∀(o2 : List tree), heaps o2 ∧ inv o1 o2 ∧ (∀(x4 : elt), occ x4 o2 = occ x4 x3 + occ x4 x1) → (let o3 : tree := link x2 x; heaps (List.cons o3 ([] : List tree)) ∧ binomial_tree o3 ∧ heaps o2 ∧ inv (tree.rank o3) o2))))) ∧ (∀(result : List tree), (match h2 with | ([] : List tree) => (match h1 with | ([] : List tree) => result = h2 | _ => result = h1) | List.cons x x1 => (match h1 with | ([] : List tree) => result = h2 | List.cons x2 x3 => (if tree.rank x2 < tree.rank x then ∃(o1 : List tree), (heaps o1 ∧ inv (tree.rank x2 + (1 : ℤ)) o1 ∧ (∀(x4 : elt), occ x4 o1 = occ x4 x3 + occ x4 h2)) ∧ result = List.cons x2 o1 else if tree.rank x < tree.rank x2 then ∃(o1 : List tree), (heaps o1 ∧ inv (tree.rank x + (1 : ℤ)) o1 ∧ (∀(x4 : elt), occ x4 o1 = occ x4 h1 + occ x4 x1)) ∧ result = List.cons x o1 else ∃(o1 : List tree), (heaps o1 ∧ inv (tree.rank x2 + (1 : ℤ)) o1 ∧ (∀(x4 : elt), occ x4 o1 = occ x4 x3 + occ x4 x1)) ∧ (let o2 : tree := link x2 x; heaps result ∧ inv (tree.rank o2) result ∧ (∀(x4 : elt), occ x4 result = occ x4 (List.cons o2 ([] : List tree)) + occ x4 o1))))) → heaps result ∧ inv k result ∧ (∀(x : elt), occ x result = occ x h1 + occ x h2))
  := sorry
end binomial_heap_BinomialHeap_mergeqtvc
