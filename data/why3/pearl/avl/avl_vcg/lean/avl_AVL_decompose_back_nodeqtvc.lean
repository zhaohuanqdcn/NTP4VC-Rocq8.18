import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace avl_AVL_decompose_back_nodeqtvc
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
axiom t2 : Type -> Type
axiom inhabited_axiom_t2 {α : Type} [Inhabited α] : Inhabited (t2 α)
attribute [instance] inhabited_axiom_t2
axiom repr :  {α : Type} -> [Inhabited α] -> t2 α -> tree α
axiom m1 :  {α : Type} -> [Inhabited α] -> t2 α -> m α
axiom t'invariant {α : Type} [Inhabited α] (self : t2 α) : balanced (repr self) ∧ m.seq (m1 self) = seq_model (repr self) ∧ m.hgt (m1 self) = real_height (repr self)
noncomputable def t'eq {α : Type} [Inhabited α] (a : t2 α) (b : t2 α) := repr a = repr b ∧ m1 a = m1 b
axiom t'inj {α : Type} [Inhabited α] (a : t2 α) (b : t2 α) (fact0 : t'eq a b) : a = b
inductive view (α : Type) where
  | AEmpty : view α
  | ANode : t2 α -> t1 α -> t2 α -> ℕ -> t -> view α
axiom inhabited_axiom_view {α : Type} [Inhabited α] : Inhabited (view α)
attribute [instance] inhabited_axiom_view
theorem decompose_back_node'vc {α : Type} [Inhabited α] (l : t2 α) (r : t2 α) (o1 : view α) (d : t1 α) (fact0 : -Int.ofNat balancing ≤ m.hgt (m1 l) - m.hgt (m1 r)) (fact1 : m.hgt (m1 l) - m.hgt (m1 r) ≤ Int.ofNat balancing) (fact2 : match o1 with | (view.AEmpty : view α) => m.hgt (m1 r) = (0 : ℤ) ∧ m.seq (m1 r) = ([] : List (t1 α)) | view.ANode l1 d r1 h s => m.seq (m1 r) = node_model (m.seq (m1 l1)) d (m.seq (m1 r1)) ∧ s = agg measure_closure (m.seq (m1 r)) ∧ (let hl : ℤ := m.hgt (m1 l1); let hr : ℤ := m.hgt (m1 r1); (-Int.ofNat balancing ≤ hl - hr ∧ hl - hr ≤ Int.ofNat balancing) ∧ m.hgt (m1 r) = Int.ofNat h ∧ Int.ofNat h = (1 : ℤ) + (if hl < hr then hr else hl))) : (match o1 with | (view.AEmpty : view α) => True | view.ANode l2 d2 r1 _ _ => (((0 : ℤ) ≤ m.hgt (m1 r) ∧ m.hgt (m1 r1) < m.hgt (m1 r)) ∧ -Int.ofNat balancing ≤ m.hgt (m1 l2) - m.hgt (m1 r1) ∧ m.hgt (m1 l2) - m.hgt (m1 r1) ≤ Int.ofNat balancing) ∧ (∀(right1 : t2 α) (d3 : t1 α), node_model (m.seq (m1 l2)) d2 (m.seq (m1 r1)) = m.seq (m1 right1) ++ [d3] ∧ (let hl : ℤ := m.hgt (m1 l2); let hr : ℤ := m.hgt (m1 r1); let he : ℤ := (1 : ℤ) + (if hl < hr then hr else hl); (0 : ℤ) ≤ he - m.hgt (m1 right1) ∧ he - m.hgt (m1 right1) ≤ (1 : ℤ)) → -Int.ofNat balancing - (1 : ℤ) ≤ m.hgt (m1 l) - m.hgt (m1 right1) ∧ m.hgt (m1 l) - m.hgt (m1 right1) ≤ Int.ofNat balancing + (1 : ℤ))) ∧ (∀(res : t2 α) (d2 : t1 α), (match o1 with | (view.AEmpty : view α) => res = l ∧ d2 = d | view.ANode l2 d21 r1 _ _ => (∃(res1 : t2 α), (node_model (m.seq (m1 l2)) d21 (m.seq (m1 r1)) = m.seq (m1 res1) ++ [d2] ∧ (let hl : ℤ := m.hgt (m1 l2); let hr : ℤ := m.hgt (m1 r1); let he : ℤ := (1 : ℤ) + (if hl < hr then hr else hl); (0 : ℤ) ≤ he - m.hgt (m1 res1) ∧ he - m.hgt (m1 res1) ≤ (1 : ℤ))) ∧ m.seq (m1 res) = node_model (m.seq (m1 l)) d (m.seq (m1 res1)) ∧ (let hl : ℤ := m.hgt (m1 l); let hr : ℤ := m.hgt (m1 res1); let he : ℤ := (1 : ℤ) + (if hl < hr then hr else hl); let hres : ℤ := m.hgt (m1 res); ((0 : ℤ) ≤ he - hres ∧ he - hres ≤ (1 : ℤ)) ∧ (-Int.ofNat balancing ≤ hl - hr ∧ hl - hr ≤ Int.ofNat balancing → he = hres)))) → node_model (m.seq (m1 l)) d (m.seq (m1 r)) = m.seq (m1 res) ++ [d2] ∧ (let hl : ℤ := m.hgt (m1 l); let hr : ℤ := m.hgt (m1 r); let he : ℤ := (1 : ℤ) + (if hl < hr then hr else hl); (0 : ℤ) ≤ he - m.hgt (m1 res) ∧ he - m.hgt (m1 res) ≤ (1 : ℤ)))
  := sorry
end avl_AVL_decompose_back_nodeqtvc
