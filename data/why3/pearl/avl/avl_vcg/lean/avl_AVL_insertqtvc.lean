import Why3.Base
import Why3.why3.Ref.Ref
import pearl.avl.lib.lean.avl.SelectionTypes
open Classical
open Lean4Why3
namespace avl_AVL_insertqtvc
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
axiom selector : Type
axiom inhabited_axiom_selector : Inhabited selector
attribute [instance] inhabited_axiom_selector
axiom selected :  {α : Type} -> [Inhabited α] -> selector -> SelectionTypes.split (t1 α) -> Prop
axiom selection_possible :  {α : Type} -> [Inhabited α] -> selector -> List (t1 α) -> Prop
axiom selection_empty {α : Type} [Inhabited α] (s : selector) : selection_possible s ([] : List (t1 α)) → selected s (SelectionTypes.split.mk ([] : List (t1 α)) (Option.none : Option (t1 α)) ([] : List (t1 α)))
axiom part : Type
axiom inhabited_axiom_part : Inhabited part
attribute [instance] inhabited_axiom_part
theorem insert'vc {α : Type} [Inhabited α] (s : selector) (t3 : t2 α) (o1 : view α) (d : t1 α) (fact0 : selection_possible s (m.seq (m1 t3))) (fact1 : match o1 with | (view.AEmpty : view α) => m.hgt (m1 t3) = (0 : ℤ) ∧ m.seq (m1 t3) = ([] : List (t1 α)) | view.ANode l d r h s1 => m.seq (m1 t3) = node_model (m.seq (m1 l)) d (m.seq (m1 r)) ∧ s1 = agg measure_closure (m.seq (m1 t3)) ∧ (let hl : ℤ := m.hgt (m1 l); let hr : ℤ := m.hgt (m1 r); (-Int.ofNat balancing ≤ hl - hr ∧ hl - hr ≤ Int.ofNat balancing) ∧ m.hgt (m1 t3) = Int.ofNat h ∧ Int.ofNat h = (1 : ℤ) + (if hl < hr then hr else hl))) : match o1 with | (view.AEmpty : view α) => (∀(result : t2 α), m.seq (m1 result) = [d] ∧ m.hgt (m1 result) = (1 : ℤ) → m.seq (m1 result) = node_model (SelectionTypes.split.left1 (SelectionTypes.split.mk ([] : List (t1 α)) (Option.none : Option (t1 α)) ([] : List (t1 α)))) d (SelectionTypes.split.right1 (SelectionTypes.split.mk ([] : List (t1 α)) (Option.none : Option (t1 α)) ([] : List (t1 α)))) ∧ (selected s (SelectionTypes.split.mk ([] : List (t1 α)) (Option.none : Option (t1 α)) ([] : List (t1 α))) ∧ SelectionTypes.rebuild (SelectionTypes.split.mk ([] : List (t1 α)) (Option.none : Option (t1 α)) ([] : List (t1 α))) = m.seq (m1 t3)) ∧ m.hgt (m1 result) - m.hgt (m1 t3) ≤ (1 : ℤ) ∧ (0 : ℤ) ≤ m.hgt (m1 result) - m.hgt (m1 t3)) | view.ANode tl td tr _ _ => (let o2 : List (t1 α) := m.seq (m1 tr); let o3 : List (t1 α) := m.seq (m1 tl); (selection_possible s (node_model o3 td o2) ∧ agg measure_closure (m.seq (m1 tl)) = agg measure_closure o3 ∧ agg measure_closure (m.seq (m1 tr)) = agg measure_closure o2) ∧ (∀(o4 : SelectionTypes.part_base selector), (match o4 with | SelectionTypes.part_base.Here => selected s (SelectionTypes.split.mk o3 (Option.some td) o2) | SelectionTypes.part_base.Left sl => selection_possible sl o3 ∧ (∀(e : SelectionTypes.split (t1 α)), selected sl e ∧ SelectionTypes.rebuild e = o3 → selected s (SelectionTypes.right_extend e td o2)) | SelectionTypes.part_base.Right sr => selection_possible sr o2 ∧ (∀(e : SelectionTypes.split (t1 α)), selected sr e ∧ SelectionTypes.rebuild e = o2 → selected s (SelectionTypes.left_extend o3 td e))) → (match o4 with | SelectionTypes.part_base.Left sl => (((0 : ℤ) ≤ m.hgt (m1 t3) ∧ m.hgt (m1 tl) < m.hgt (m1 t3)) ∧ selection_possible sl (m.seq (m1 tl))) ∧ (∀(r : SelectionTypes.split (t1 α)) (nl : t2 α), m.seq (m1 nl) = node_model (SelectionTypes.split.left1 r) d (SelectionTypes.split.right1 r) ∧ (selected sl r ∧ SelectionTypes.rebuild r = m.seq (m1 tl)) ∧ m.hgt (m1 nl) - m.hgt (m1 tl) ≤ (1 : ℤ) ∧ (0 : ℤ) ≤ m.hgt (m1 nl) - m.hgt (m1 tl) → (-Int.ofNat balancing - (1 : ℤ) ≤ m.hgt (m1 nl) - m.hgt (m1 tr) ∧ m.hgt (m1 nl) - m.hgt (m1 tr) ≤ Int.ofNat balancing + (1 : ℤ)) ∧ (∀(result : t2 α), m.seq (m1 result) = node_model (m.seq (m1 nl)) td (m.seq (m1 tr)) ∧ (let hl : ℤ := m.hgt (m1 nl); let hr : ℤ := m.hgt (m1 tr); let he : ℤ := (1 : ℤ) + (if hl < hr then hr else hl); let hres : ℤ := m.hgt (m1 result); ((0 : ℤ) ≤ he - hres ∧ he - hres ≤ (1 : ℤ)) ∧ (-Int.ofNat balancing ≤ hl - hr ∧ hl - hr ≤ Int.ofNat balancing → he = hres)) → m.seq (m1 result) = node_model (SelectionTypes.split.left1 (SelectionTypes.right_extend r td (m.seq (m1 tr)))) d (SelectionTypes.split.right1 (SelectionTypes.right_extend r td (m.seq (m1 tr)))) ∧ (selected s (SelectionTypes.right_extend r td (m.seq (m1 tr))) ∧ SelectionTypes.rebuild (SelectionTypes.right_extend r td (m.seq (m1 tr))) = m.seq (m1 t3)) ∧ m.hgt (m1 result) - m.hgt (m1 t3) ≤ (1 : ℤ) ∧ (0 : ℤ) ≤ m.hgt (m1 result) - m.hgt (m1 t3))) | SelectionTypes.part_base.Right sr => (((0 : ℤ) ≤ m.hgt (m1 t3) ∧ m.hgt (m1 tr) < m.hgt (m1 t3)) ∧ selection_possible sr (m.seq (m1 tr))) ∧ (∀(r : SelectionTypes.split (t1 α)) (nr : t2 α), m.seq (m1 nr) = node_model (SelectionTypes.split.left1 r) d (SelectionTypes.split.right1 r) ∧ (selected sr r ∧ SelectionTypes.rebuild r = m.seq (m1 tr)) ∧ m.hgt (m1 nr) - m.hgt (m1 tr) ≤ (1 : ℤ) ∧ (0 : ℤ) ≤ m.hgt (m1 nr) - m.hgt (m1 tr) → (-Int.ofNat balancing - (1 : ℤ) ≤ m.hgt (m1 tl) - m.hgt (m1 nr) ∧ m.hgt (m1 tl) - m.hgt (m1 nr) ≤ Int.ofNat balancing + (1 : ℤ)) ∧ (∀(result : t2 α), m.seq (m1 result) = node_model (m.seq (m1 tl)) td (m.seq (m1 nr)) ∧ (let hl : ℤ := m.hgt (m1 tl); let hr : ℤ := m.hgt (m1 nr); let he : ℤ := (1 : ℤ) + (if hl < hr then hr else hl); let hres : ℤ := m.hgt (m1 result); ((0 : ℤ) ≤ he - hres ∧ he - hres ≤ (1 : ℤ)) ∧ (-Int.ofNat balancing ≤ hl - hr ∧ hl - hr ≤ Int.ofNat balancing → he = hres)) → m.seq (m1 result) = node_model (SelectionTypes.split.left1 (SelectionTypes.left_extend (m.seq (m1 tl)) td r)) d (SelectionTypes.split.right1 (SelectionTypes.left_extend (m.seq (m1 tl)) td r)) ∧ (selected s (SelectionTypes.left_extend (m.seq (m1 tl)) td r) ∧ SelectionTypes.rebuild (SelectionTypes.left_extend (m.seq (m1 tl)) td r) = m.seq (m1 t3)) ∧ m.hgt (m1 result) - m.hgt (m1 t3) ≤ (1 : ℤ) ∧ (0 : ℤ) ≤ m.hgt (m1 result) - m.hgt (m1 t3))) | SelectionTypes.part_base.Here => (-Int.ofNat balancing ≤ m.hgt (m1 tl) - m.hgt (m1 tr) ∧ m.hgt (m1 tl) - m.hgt (m1 tr) ≤ Int.ofNat balancing) ∧ (∀(result : t2 α), m.seq (m1 result) = node_model (m.seq (m1 tl)) d (m.seq (m1 tr)) ∧ m.hgt (m1 result) = (1 : ℤ) + (if m.hgt (m1 tl) < m.hgt (m1 tr) then m.hgt (m1 tr) else m.hgt (m1 tl)) → m.seq (m1 result) = node_model (SelectionTypes.split.left1 (SelectionTypes.split.mk (m.seq (m1 tl)) (Option.some td) (m.seq (m1 tr)))) d (SelectionTypes.split.right1 (SelectionTypes.split.mk (m.seq (m1 tl)) (Option.some td) (m.seq (m1 tr)))) ∧ (selected s (SelectionTypes.split.mk (m.seq (m1 tl)) (Option.some td) (m.seq (m1 tr))) ∧ SelectionTypes.rebuild (SelectionTypes.split.mk (m.seq (m1 tl)) (Option.some td) (m.seq (m1 tr))) = m.seq (m1 t3)) ∧ m.hgt (m1 result) - m.hgt (m1 t3) ≤ (1 : ℤ) ∧ (0 : ℤ) ≤ m.hgt (m1 result) - m.hgt (m1 t3)))))
  := sorry
end avl_AVL_insertqtvc
