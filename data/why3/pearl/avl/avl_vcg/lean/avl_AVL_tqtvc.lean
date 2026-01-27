import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace avl_AVL_tqtvc
axiom t : Type
axiom inhabited_axiom_t : Inhabited t
attribute [instance] inhabited_axiom_t
axiom zero : t
axiom op : t -> t -> t
axiom assoc (a : t) (b : t) (c : t) : op a (op b c) = op (op a b) c
axiom neutral (x : t) : op x zero = x ∧ x = op zero x
axiom agg :  {α : Type} -> [Inhabited α] -> (α -> t) -> List α -> t
axiom agg_empty {α : Type} [Inhabited α] (f : α -> t) : agg f ([] : List α) = zero
axiom agg_sing {α : Type} [Inhabited α] (s : List α) (f : α -> t) (fact0 : Int.ofNat (List.length s) = (1 : ℤ)) : agg f s = f (s[(0 : ℕ)]!)
axiom agg_cat {α : Type} [Inhabited α] (f : α -> t) (s1 : List α) (s2 : List α) : agg f (s1 ++ s2) = op (agg f s1) (agg f s2)
axiom t1 : Type -> Type
axiom inhabited_axiom_t1 {α : Type} [Inhabited α] : Inhabited (t1 α)
attribute [instance] inhabited_axiom_t1
axiom measure :  {α : Type} -> [Inhabited α] -> t1 α -> t
axiom balancing : ℕ
axiom balancing'def : (0 : ℤ) < Int.ofNat balancing
inductive tree (α : Type) where
  | Empty : tree α
  | Node : tree α -> t1 α -> tree α -> ℕ -> t -> tree α
axiom inhabited_axiom_tree {α : Type} [Inhabited α] : Inhabited (tree α)
attribute [instance] inhabited_axiom_tree
structure m (α : Type) where
  seq : List (t1 α)
  hgt : ℤ
axiom inhabited_axiom_m {α : Type} [Inhabited α] : Inhabited (m α)
attribute [instance] inhabited_axiom_m
noncomputable def node_model {α : Type} [Inhabited α] (l : List α) (d : α) (r : List α) := l ++ List.cons d r
noncomputable def seq_model {α : Type} [Inhabited α] : tree α -> List (t1 α)
  | (tree.Empty : tree α) => ([] : List (t1 α))
  | (tree.Node l d r x x0) => node_model (seq_model l) d (seq_model r)
noncomputable def real_height {α : Type} [Inhabited α] : tree α -> ℤ
  | (tree.Empty : tree α) => (0 : ℤ)
  | (tree.Node l x r x0 x1) => let hl : ℤ := real_height l; let hr : ℤ := real_height r; (1 : ℤ) + (if hl < hr then hr else hl)
axiom measure_closure :  {α : Type} -> [Inhabited α] -> t1 α -> t
axiom measure_closure_def {α : Type} [Inhabited α] (y : t1 α) : measure_closure y = measure y
noncomputable def balanced {α : Type} [Inhabited α] : tree α -> Prop
  | (tree.Empty : tree α) => True
  | (tree.Node l x r h m1) => Int.ofNat h = real_height (tree.Node l x r h m1) ∧ m1 = agg measure_closure (seq_model (tree.Node l x r h m1)) ∧ (-Int.ofNat balancing ≤ real_height r - real_height l ∧ real_height r - real_height l ≤ Int.ofNat balancing) ∧ balanced l ∧ balanced r
theorem t'vc {α : Type} [Inhabited α] : let repr : tree α := (tree.Empty : tree α); balanced repr ∧ ([] : List (t1 α)) = seq_model repr ∧ (0 : ℤ) = real_height repr
  := sorry
end avl_AVL_tqtvc
