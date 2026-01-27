import Why3.Base
import Why3.why3.Ref.Ref
import Why3.int.NumOf
import pearl.avl.lib.lean.avl.SelectionTypes
open Classical
open Lean4Why3
namespace priority_queue_PQueue_correctionqtvc
axiom balancing : ℕ
axiom balancing'def : (0 : ℤ) < Int.ofNat balancing
axiom t : Type -> Type
axiom inhabited_axiom_t {α : Type} [Inhabited α] : Inhabited (t α)
attribute [instance] inhabited_axiom_t
axiom t1 : Type
axiom inhabited_axiom_t1 : Inhabited t1
attribute [instance] inhabited_axiom_t1
axiom key :  {α : Type} -> [Inhabited α] -> t α -> t1
axiom le : t1 -> t1 -> Prop
axiom Refl (x : t1) : le x x
axiom Trans (x : t1) (y : t1) (z : t1) (fact0 : le x y) (fact1 : le y z) : le x z
axiom eq : t1 -> t1 -> Prop
axiom eq_def (x : t1) (y : t1) : eq x y = (le x y ∧ le y x)
axiom lt : t1 -> t1 -> Prop
axiom lt_def (x : t1) (y : t1) : lt x y = (le x y ∧ ¬le y x)
axiom Total (x : t1) (y : t1) : le x y ∨ le y x
axiom t2 : Type
axiom inhabited_axiom_t2 : Inhabited t2
attribute [instance] inhabited_axiom_t2
noncomputable def op (x : Option t1) (y : Option t1) := match x with | Option.none => y | Option.some a => (match y with | Option.none => x | Option.some b => (if lt b a then y else x))
axiom assoc (a : Option t1) (b : Option t1) (c : Option t1) : op a (op b c) = op (op a b) c
axiom neutral (x : Option t1) : op x Option.none = x ∧ x = op Option.none x
axiom agg :  {α : Type} -> [Inhabited α] -> (α -> Option t1) -> List α -> Option t1
axiom agg'def {α : Type} [Inhabited α] (s : List α) (f : α -> Option t1) : if Int.ofNat (List.length s) = (0 : ℤ) then agg f s = Option.none else agg f s = op (f (s[(0 : ℕ)]!)) (agg f (List.drop (1 : ℕ) s))
noncomputable def measure {α : Type} [Inhabited α] (d : t α) := Option.some (key d)
axiom selector : Type
axiom inhabited_axiom_selector : Inhabited selector
attribute [instance] inhabited_axiom_selector
noncomputable def selection_possible {ε : Type} {η : Type} [Inhabited ε] [Inhabited η] (x : ε) (s : List η) := ¬Int.ofNat (List.length s) = (0 : ℤ)
noncomputable def lower_bound {α : Type} [Inhabited α] (x : t1) (s : List (t α)) := ∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length s) → le x (key (s[Int.toNat i]!))
noncomputable def lower_bound_strict {α : Type} [Inhabited α] (x : t1) (s : List (t α)) := ∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length s) → lt x (key (s[Int.toNat i]!))
noncomputable def selected {ε : Type} {α : Type} [Inhabited ε] [Inhabited α] (x : ε) (e : SelectionTypes.split (t α)) := match SelectionTypes.split.middle e with | (Option.none : Option (t α)) => False | Option.some d => lower_bound (key d) (SelectionTypes.split.right1 e) ∧ lower_bound_strict (key d) (SelectionTypes.split.left1 e)
inductive tree (α : Type) where
  | Empty : tree α
  | Node : tree α -> t α -> tree α -> ℕ -> Option t1 -> tree α
axiom inhabited_axiom_tree {α : Type} [Inhabited α] : Inhabited (tree α)
attribute [instance] inhabited_axiom_tree
structure m (α : Type) where
  seq : List (t α)
  hgt : ℤ
axiom inhabited_axiom_m {α : Type} [Inhabited α] : Inhabited (m α)
attribute [instance] inhabited_axiom_m
noncomputable def node_model {α : Type} [Inhabited α] (l : List α) (d : α) (r : List α) := l ++ List.cons d r
noncomputable def seq_model {α : Type} [Inhabited α] : tree α -> List (t α)
  | (tree.Empty : tree α) => ([] : List (t α))
  | (tree.Node l d r x x0) => node_model (seq_model l) d (seq_model r)
noncomputable def real_height {α : Type} [Inhabited α] : tree α -> ℤ
  | (tree.Empty : tree α) => (0 : ℤ)
  | (tree.Node l x r x0 x1) => let hl : ℤ := real_height l; let hr : ℤ := real_height r; (1 : ℤ) + (if hl < hr then hr else hl)
axiom measure_closure :  {α : Type} -> [Inhabited α] -> t α -> Option t1
axiom measure_closure_def {α : Type} [Inhabited α] (y : t α) : measure_closure y = measure y
noncomputable def balanced {α : Type} [Inhabited α] : tree α -> Prop
  | (tree.Empty : tree α) => True
  | (tree.Node l x r h m1) => Int.ofNat h = real_height (tree.Node l x r h m1) ∧ m1 = agg measure_closure (seq_model (tree.Node l x r h m1)) ∧ (-Int.ofNat balancing ≤ real_height r - real_height l ∧ real_height r - real_height l ≤ Int.ofNat balancing) ∧ balanced l ∧ balanced r
axiom t3 : Type -> Type
axiom inhabited_axiom_t3 {α : Type} [Inhabited α] : Inhabited (t3 α)
attribute [instance] inhabited_axiom_t3
axiom repr :  {α : Type} -> [Inhabited α] -> t3 α -> tree α
axiom m1 :  {α : Type} -> [Inhabited α] -> t3 α -> m α
axiom t'invariant {α : Type} [Inhabited α] (self : t3 α) : balanced (repr self) ∧ m.seq (m1 self) = seq_model (repr self) ∧ m.hgt (m1 self) = real_height (repr self)
noncomputable def t'eq {α : Type} [Inhabited α] (a : t3 α) (b : t3 α) := repr a = repr b ∧ m1 a = m1 b
axiom t'inj {α : Type} [Inhabited α] (a : t3 α) (b : t3 α) (fact0 : t'eq a b) : a = b
inductive view (α : Type) where
  | AEmpty : view α
  | ANode : t3 α -> t α -> t3 α -> ℕ -> Option t1 -> view α
axiom inhabited_axiom_view {α : Type} [Inhabited α] : Inhabited (view α)
attribute [instance] inhabited_axiom_view
axiom part : Type
axiom inhabited_axiom_part : Inhabited part
attribute [instance] inhabited_axiom_part
axiom t4 : Type -> Type
axiom inhabited_axiom_t4 {α : Type} [Inhabited α] : Inhabited (t4 α)
attribute [instance] inhabited_axiom_t4
structure m2 (α : Type) where
  bag : t α -> ℤ
  minimum : t α
  card : ℤ
axiom inhabited_axiom_m2 {α : Type} [Inhabited α] : Inhabited (m2 α)
attribute [instance] inhabited_axiom_m2
axiom to_bag :  {α : Type} -> [Inhabited α] -> List α -> α -> ℤ
axiom to_bag'def {α : Type} [Inhabited α] (s : List α) (x : α) : to_bag s x = Int.ofNat (List.count x (List.drop (0 : ℕ) (List.take (List.length s - (0 : ℕ)) s)))
axiom get_minimum_index :  {α : Type} -> [Inhabited α] -> List (t α) -> ℤ
axiom get_minimum_index'spec'2 {α : Type} [Inhabited α] (s : List (t α)) (fact0 : ¬Int.ofNat (List.length s) = (0 : ℤ)) : (0 : ℤ) ≤ get_minimum_index s ∧ get_minimum_index s < Int.ofNat (List.length s)
axiom get_minimum_index'spec'1 {α : Type} [Inhabited α] (s : List (t α)) (fact0 : ¬Int.ofNat (List.length s) = (0 : ℤ)) : agg measure_closure s = Option.some (key (s[Int.toNat (get_minimum_index s)]!))
axiom get_minimum_index'spec'0 {α : Type} [Inhabited α] (s : List (t α)) (fact0 : ¬Int.ofNat (List.length s) = (0 : ℤ)) : lower_bound_strict (key (s[Int.toNat (get_minimum_index s)]!)) (List.take (Int.toNat (get_minimum_index s)) s)
axiom get_minimum_index'spec {α : Type} [Inhabited α] (s : List (t α)) (fact0 : ¬Int.ofNat (List.length s) = (0 : ℤ)) : lower_bound (key (s[Int.toNat (get_minimum_index s)]!)) (List.drop (Int.toNat (get_minimum_index s)) s)
noncomputable def m3 {α : Type} [Inhabited α] (t5 : t3 α) := (m2.mk : (t α -> ℤ) -> t α -> ℤ -> m2 α) (to_bag (m.seq (m1 t5))) ((m.seq (m1 t5))[Int.toNat (get_minimum_index (m.seq (m1 t5)))]!) (Int.ofNat (List.length (m.seq (m1 t5))))
theorem correction'vc {α : Type} [Inhabited α] (t5 : t3 α) : (∀(d : t α), (0 : ℤ) ≤ m2.bag (m3 t5) d ∧ m2.bag (m3 t5) d ≤ m2.card (m3 t5)) ∧ (0 : ℤ) ≤ m2.card (m3 t5) ∧ ((0 : ℤ) < m2.card (m3 t5) → (0 : ℤ) < m2.bag (m3 t5) (m2.minimum (m3 t5))) ∧ (∀(d : t α), (0 : ℤ) < m2.bag (m3 t5) d → le (key (m2.minimum (m3 t5))) (key d))
  := sorry
end priority_queue_PQueue_correctionqtvc
