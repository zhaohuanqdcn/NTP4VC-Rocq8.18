import Why3.Base
import Why3.why3.Ref.Ref
import Why3.int.NumOf
import pearl.avl.lib.lean.avl.SelectionTypes
open Classical
open Lean4Why3
namespace priority_queue_PQueue_get_minimum_indexqtvc
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
theorem get_minimum_index'vc {α : Type} [Inhabited α] (s : List (t α)) (fact0 : ¬Int.ofNat (List.length s) = (0 : ℤ)) : let o1 : ℤ := Int.ofNat (List.length s) - (1 : ℤ); ((0 : ℤ) ≤ o1 + (1 : ℤ) → (lower_bound_strict (key (s[(0 : ℕ)]!)) (List.take (0 : ℕ) s) ∧ lower_bound (key (s[(0 : ℕ)]!)) (List.drop (0 : ℕ) (List.take ((0 : ℕ) - (0 : ℕ)) s)) ∧ (0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) < Int.ofNat (List.length s)) ∧ (∀(r : ℤ), (∀(i : ℤ), ((0 : ℤ) ≤ i ∧ i ≤ o1) ∧ lower_bound_strict (key (s[Int.toNat r]!)) (List.take (Int.toNat r) s) ∧ lower_bound (key (s[Int.toNat r]!)) (List.drop (Int.toNat r) (List.take (Int.toNat i - Int.toNat r) s)) ∧ ((0 : ℤ) ≤ r ∧ r ≤ i) ∧ r < Int.ofNat (List.length s) → (let o2 : t1 := key (s[Int.toNat r]!); let o3 : t1 := key (s[Int.toNat i]!); ∀(o4 : ℤ), ((0 : ℤ) < o4) = lt o2 o3 ∧ (o4 < (0 : ℤ)) = lt o3 o2 ∧ (o4 = (0 : ℤ)) = eq o3 o2 → (if o4 < (0 : ℤ) then lower_bound_strict (key (s[Int.toNat i]!)) (List.take (Int.toNat i) s) ∧ lower_bound (key (s[Int.toNat i]!)) (List.drop (Int.toNat i) (List.take (Int.toNat (i + (1 : ℤ)) - Int.toNat i) s)) ∧ ((0 : ℤ) ≤ i ∧ i ≤ i + (1 : ℤ)) ∧ i < Int.ofNat (List.length s) else lower_bound_strict (key (s[Int.toNat r]!)) (List.take (Int.toNat r) s) ∧ lower_bound (key (s[Int.toNat r]!)) (List.drop (Int.toNat r) (List.take (Int.toNat (i + (1 : ℤ)) - Int.toNat r) s)) ∧ ((0 : ℤ) ≤ r ∧ r ≤ i + (1 : ℤ)) ∧ r < Int.ofNat (List.length s)))) ∧ (lower_bound_strict (key (s[Int.toNat r]!)) (List.take (Int.toNat r) s) ∧ lower_bound (key (s[Int.toNat r]!)) (List.drop (Int.toNat r) (List.take (Int.toNat (o1 + (1 : ℤ)) - Int.toNat r) s)) ∧ ((0 : ℤ) ≤ r ∧ r ≤ o1 + (1 : ℤ)) ∧ r < Int.ofNat (List.length s) → ((0 : ℤ) ≤ r ∧ r < Int.ofNat (List.length s)) ∧ agg measure_closure s = Option.some (key (s[Int.toNat r]!)) ∧ lower_bound_strict (key (s[Int.toNat r]!)) (List.take (Int.toNat r) s) ∧ lower_bound (key (s[Int.toNat r]!)) (List.drop (Int.toNat r) s)))) ∧ (o1 + (1 : ℤ) < (0 : ℤ) → ((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) < Int.ofNat (List.length s)) ∧ agg measure_closure s = Option.some (key (s[(0 : ℕ)]!)) ∧ lower_bound_strict (key (s[(0 : ℕ)]!)) (List.take (0 : ℕ) s) ∧ lower_bound (key (s[(0 : ℕ)]!)) (List.drop (0 : ℕ) s))
  := sorry
end priority_queue_PQueue_get_minimum_indexqtvc
