import Why3.Base
import Why3.why3.Ref.Ref
import pearl.avl.lib.lean.avl.SelectionTypes
open Classical
open Lean4Why3
namespace ral_RAL_decompose_frontqtvc
axiom balancing : ℕ
axiom balancing'def : (0 : ℤ) < Int.ofNat balancing
axiom m : Type
axiom inhabited_axiom_m : Inhabited m
attribute [instance] inhabited_axiom_m
axiom t : Type
axiom inhabited_axiom_t : Inhabited t
attribute [instance] inhabited_axiom_t
axiom assoc (a : ℤ) (b : ℤ) (c : ℤ) : a + (b + c) = a + b + c
axiom neutral (x : ℤ) : x + (0 : ℤ) = x ∧ x = (0 : ℤ) + x
axiom agg :  {α : Type} -> [Inhabited α] -> (α -> ℤ) -> List α -> ℤ
axiom agg'def {α : Type} [Inhabited α] (s : List α) (f : α -> ℤ) : if Int.ofNat (List.length s) = (0 : ℤ) then agg f s = (0 : ℤ) else agg f s = f (s[(0 : ℕ)]!) + agg f (List.drop (1 : ℕ) s)
axiom t1 : Type -> Type
axiom inhabited_axiom_t1 {α : Type} [Inhabited α] : Inhabited (t1 α)
attribute [instance] inhabited_axiom_t1
noncomputable def measure {α : Type} [Inhabited α] (x : α) := (1 : ℤ)
structure selector where
  index : ℤ
  hole : Bool
axiom inhabited_axiom_selector : Inhabited selector
attribute [instance] inhabited_axiom_selector
noncomputable def selection_possible {α : Type} [Inhabited α] (s : selector) (l : List α) := (0 : ℤ) ≤ selector.index s ∧ (if selector.hole s = true then selector.index s ≤ Int.ofNat (List.length l) else selector.index s < Int.ofNat (List.length l))
noncomputable def selected {α : Type} [Inhabited α] (s : selector) (e : SelectionTypes.split α) := selector.index s = Int.ofNat (List.length (SelectionTypes.split.left1 e)) ∧ (selector.hole s = true) = (SelectionTypes.split.middle e = (Option.none : Option α))
inductive tree (α : Type) where
  | Empty : tree α
  | Node : tree α -> α -> tree α -> ℕ -> ℤ -> tree α
axiom inhabited_axiom_tree {α : Type} [Inhabited α] : Inhabited (tree α)
attribute [instance] inhabited_axiom_tree
structure m1 (α : Type) where
  seq : List α
  hgt : ℤ
axiom inhabited_axiom_m1 {α : Type} [Inhabited α] : Inhabited (m1 α)
attribute [instance] inhabited_axiom_m1
noncomputable def node_model {α : Type} [Inhabited α] (l : List α) (d : α) (r : List α) := l ++ List.cons d r
noncomputable def seq_model {α : Type} [Inhabited α] : tree α -> List α
  | (tree.Empty : tree α) => ([] : List α)
  | (tree.Node l d r x x0) => node_model (seq_model l) d (seq_model r)
noncomputable def real_height {α : Type} [Inhabited α] : tree α -> ℤ
  | (tree.Empty : tree α) => (0 : ℤ)
  | (tree.Node l x r x0 x1) => let hl : ℤ := real_height l; let hr : ℤ := real_height r; (1 : ℤ) + (if hl < hr then hr else hl)
axiom measure_closure :  {α : Type} -> [Inhabited α] -> α -> ℤ
axiom measure_closure_def {α : Type} [Inhabited α] (y : α) : measure_closure y = measure y
noncomputable def balanced {α : Type} [Inhabited α] : tree α -> Prop
  | (tree.Empty : tree α) => True
  | (tree.Node l x r h m2) => Int.ofNat h = real_height (tree.Node l x r h m2) ∧ m2 = agg measure_closure (seq_model (tree.Node l x r h m2)) ∧ (-Int.ofNat balancing ≤ real_height r - real_height l ∧ real_height r - real_height l ≤ Int.ofNat balancing) ∧ balanced l ∧ balanced r
axiom t2 : Type -> Type
axiom inhabited_axiom_t2 {α : Type} [Inhabited α] : Inhabited (t2 α)
attribute [instance] inhabited_axiom_t2
axiom repr :  {α : Type} -> [Inhabited α] -> t2 α -> tree α
axiom m2 :  {α : Type} -> [Inhabited α] -> t2 α -> m1 α
axiom t'invariant {α : Type} [Inhabited α] (self : t2 α) : balanced (repr self) ∧ m1.seq (m2 self) = seq_model (repr self) ∧ m1.hgt (m2 self) = real_height (repr self)
noncomputable def t'eq {α : Type} [Inhabited α] (a : t2 α) (b : t2 α) := repr a = repr b ∧ m2 a = m2 b
axiom t'inj {α : Type} [Inhabited α] (a : t2 α) (b : t2 α) (fact0 : t'eq a b) : a = b
inductive view (α : Type) where
  | AEmpty : view α
  | ANode : t2 α -> α -> t2 α -> ℕ -> ℤ -> view α
axiom inhabited_axiom_view {α : Type} [Inhabited α] : Inhabited (view α)
attribute [instance] inhabited_axiom_view
axiom part : Type
axiom inhabited_axiom_part : Inhabited part
attribute [instance] inhabited_axiom_part
axiom t3 : Type -> Type
axiom inhabited_axiom_t3 {α : Type} [Inhabited α] : Inhabited (t3 α)
attribute [instance] inhabited_axiom_t3
axiom m3 : Type -> Type
axiom inhabited_axiom_m3 {α : Type} [Inhabited α] : Inhabited (m3 α)
attribute [instance] inhabited_axiom_m3
theorem decompose_front'vc : True
  := sorry
end ral_RAL_decompose_frontqtvc
