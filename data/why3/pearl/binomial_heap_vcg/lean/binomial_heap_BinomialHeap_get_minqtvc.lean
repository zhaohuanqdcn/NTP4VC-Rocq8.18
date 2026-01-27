import Why3.Base
open Classical
open Lean4Why3
namespace binomial_heap_BinomialHeap_get_minqtvc
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
theorem get_min'vc (h : List tree) (fact0 : heaps h) (fact1 : ¬h = ([] : List tree)) : (match h with | ([] : List tree) => False | List.cons t l => (∀(m : elt) (l1 : List tree), heaps l1 → (match l1 with | ([] : List tree) => True | List.cons (tree.mk x _ _) r => (∀(o1 : elt), (if le x m then o1 = x else o1 = m) → (match l1 with | ([] : List tree) => False | List.cons _ f => f = r) ∧ heaps r)) ∧ (∀(result : elt), (match l1 with | ([] : List tree) => result = m | List.cons (tree.mk x _ _) r => (∃(o1 : elt), (if le x m then o1 = x else o1 = m) ∧ (result = o1 ∨ mem result r) ∧ le result o1 ∧ (∀(x1 : elt), mem x1 r → le result x1))) → (result = m ∨ mem result l1) ∧ le result m ∧ (∀(x : elt), mem x l1 → le result x))) ∧ heaps l) ∧ (∀(result : elt), (match h with | ([] : List tree) => False | List.cons t l => (let o1 : elt := tree.elem t; (result = o1 ∨ mem result l) ∧ le result o1 ∧ (∀(x : elt), mem x l → le result x))) → mem result h ∧ (∀(x : elt), mem x h → le result x))
  := sorry
end binomial_heap_BinomialHeap_get_minqtvc
