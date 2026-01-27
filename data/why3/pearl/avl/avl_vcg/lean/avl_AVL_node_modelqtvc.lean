import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace avl_AVL_node_modelqtvc
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
theorem node_model'vc : True
  := sorry
end avl_AVL_node_modelqtvc
