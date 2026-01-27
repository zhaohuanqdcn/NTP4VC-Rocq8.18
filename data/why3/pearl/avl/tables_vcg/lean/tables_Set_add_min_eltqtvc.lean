import Why3.Base
import Why3.why3.Ref.Ref
import pearl.avl.lib.lean.avl.SelectionTypes
open Classical
open Lean4Why3
namespace tables_Set_add_min_eltqtvc
axiom balancing : ℕ
axiom balancing'def : (0 : ℤ) < Int.ofNat balancing
axiom t : Type
axiom inhabited_axiom_t : Inhabited t
attribute [instance] inhabited_axiom_t
axiom le : t -> t -> Prop
axiom Refl (x : t) : le x x
axiom Trans (x : t) (y : t) (z : t) (fact0 : le x y) (fact1 : le y z) : le x z
axiom eq : t -> t -> Prop
axiom eq_def (x : t) (y : t) : eq x y = (le x y ∧ le y x)
axiom lt : t -> t -> Prop
axiom lt_def (x : t) (y : t) : lt x y = (le x y ∧ ¬le y x)
axiom Total (x : t) (y : t) : le x y ∨ le y x
axiom t1 : Type -> Type
axiom inhabited_axiom_t1 {α : Type} [Inhabited α] : Inhabited (t1 α)
attribute [instance] inhabited_axiom_t1
axiom t2 : Type
axiom inhabited_axiom_t2 : Inhabited t2
attribute [instance] inhabited_axiom_t2
axiom assoc : True
axiom neutral (x : Unit) : () = x ∧ x = ()
axiom selector : Type
axiom inhabited_axiom_selector : Inhabited selector
attribute [instance] inhabited_axiom_selector
noncomputable def selection_possible {β : Type} [Inhabited β] (x : β) (s : List t) := ∀(i : ℤ) (j : ℤ), (0 : ℤ) ≤ i ∧ i < j ∧ j < Int.ofNat (List.length s) → lt (s[Int.toNat i]!) (s[Int.toNat j]!)
noncomputable def upper_bound_s (k : t) (s : List t) := ∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length s) → lt (s[Int.toNat i]!) k
noncomputable def lower_bound_s (k : t) (s : List t) := ∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length s) → lt k (s[Int.toNat i]!)
noncomputable def selected (k : t) (e : SelectionTypes.split t) := upper_bound_s k (SelectionTypes.split.left1 e) ∧ lower_bound_s k (SelectionTypes.split.right1 e) ∧ (match SelectionTypes.split.middle e with | Option.none => True | Option.some d => eq k d)
inductive tree (α : Type) where
  | Empty : tree α
  | Node : tree α -> t -> tree α -> ℕ -> Unit -> tree α
axiom inhabited_axiom_tree {α : Type} [Inhabited α] : Inhabited (tree α)
attribute [instance] inhabited_axiom_tree
structure m (α : Type) where
  seq : List t
  hgt : ℤ
axiom inhabited_axiom_m {α : Type} [Inhabited α] : Inhabited (m α)
attribute [instance] inhabited_axiom_m
noncomputable def node_model {α : Type} [Inhabited α] (l : List α) (d : α) (r : List α) := l ++ List.cons d r
noncomputable def seq_model {α : Type} [Inhabited α] : tree α -> List t
  | (tree.Empty : tree α) => ([] : List t)
  | (tree.Node l d r x x0) => node_model (seq_model l) d (seq_model r)
noncomputable def real_height {α : Type} [Inhabited α] : tree α -> ℤ
  | (tree.Empty : tree α) => (0 : ℤ)
  | (tree.Node l x r x0 x1) => let hl : ℤ := real_height l; let hr : ℤ := real_height r; (1 : ℤ) + (if hl < hr then hr else hl)
noncomputable def balanced {α : Type} [Inhabited α] : tree α -> Prop
  | (tree.Empty : tree α) => True
  | (tree.Node l x r h m1) => Int.ofNat h = real_height (tree.Node l x r h m1) ∧ m1 = () ∧ (-Int.ofNat balancing ≤ real_height r - real_height l ∧ real_height r - real_height l ≤ Int.ofNat balancing) ∧ balanced l ∧ balanced r
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
  | ANode : t3 α -> t -> t3 α -> ℕ -> Unit -> view α
axiom inhabited_axiom_view {α : Type} [Inhabited α] : Inhabited (view α)
attribute [instance] inhabited_axiom_view
axiom part : Type
axiom inhabited_axiom_part : Inhabited part
attribute [instance] inhabited_axiom_part
axiom t4 : Type -> Type
axiom inhabited_axiom_t4 {α : Type} [Inhabited α] : Inhabited (t4 α)
attribute [instance] inhabited_axiom_t4
axiom field :  {α : Type} -> [Inhabited α] -> t4 α -> t3 α
axiom t'invariant1 {α : Type} [Inhabited α] (self : t4 α) : selection_possible () (m.seq (m1 (field self)))
noncomputable def t'eq1 {α : Type} [Inhabited α] (a : t4 α) (b : t4 α) := field a = field b
axiom t'inj1 {α : Type} [Inhabited α] (a : t4 α) (b : t4 α) (fact0 : t'eq1 a b) : a = b
structure m2 (α : Type) where
  domn : t -> Bool
  func : t -> t
  card : ℤ
axiom inhabited_axiom_m2 {α : Type} [Inhabited α] : Inhabited (m2 α)
attribute [instance] inhabited_axiom_m2
noncomputable def domain (s : List t) (k : t) := ∃(i : ℤ), ((0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length s)) ∧ eq (s[Int.toNat i]!) k
axiom make_func : List t -> t -> t
axiom make_func'spec (s : List t) (k : t) (i : ℤ) (fact0 : selection_possible () s) (fact1 : domain s k) (fact2 : (0 : ℤ) ≤ i) (fact3 : i < Int.ofNat (List.length s)) (fact4 : eq (s[Int.toNat i]!) k) : make_func s k = s[Int.toNat i]!
axiom domain_closure : List t -> t -> Bool
axiom make_func_closure : List t -> t -> t
axiom domain_closure_def (y : List t) (y1 : t) : (domain_closure y y1 = true) = domain y y1
axiom make_func_closure_def (y : List t) (y1 : t) : make_func_closure y y1 = make_func y y1
noncomputable def m3 {α : Type} [Inhabited α] (t5 : t4 α) := (m2.mk : (t -> Bool) -> (t -> t) -> ℤ -> m2 α) (domain_closure (m.seq (m1 (field t5)))) (make_func_closure (m.seq (m1 (field t5)))) (Int.ofNat (List.length (m.seq (m1 (field t5)))))
inductive view1 (α : Type) where
  | AEmpty1 : view1 α
  | ANode1 : t4 α -> t -> t4 α -> ℕ -> view1 α
axiom inhabited_axiom_view1 {α : Type} [Inhabited α] : Inhabited (view1 α)
attribute [instance] inhabited_axiom_view1
axiom t5 : Type
axiom inhabited_axiom_t5 : Inhabited t5
attribute [instance] inhabited_axiom_t5
theorem add_min_elt'vc (t6 : t4 Unit) (k0 : t) (fact0 : ∀(k : t), m2.domn (m3 t6) k = true → lt k0 k) : (∀(k : t), m2.domn (m3 t6) k = true → lt k0 k) ∧ (∀(result : t4 Unit), m2.card (m3 result) = m2.card (m3 t6) + (1 : ℤ) ∧ (∀(k : t), lt k k0 → ¬m2.domn (m3 result) k = true) ∧ (∀(k : t), eq k k0 → m2.domn (m3 result) k = true ∧ m2.func (m3 result) k = k0) ∧ (∀(k : t), lt k0 k → (m2.domn (m3 result) k = true) = (m2.domn (m3 t6) k = true)) ∧ (∀(k : t), lt k0 k ∧ m2.domn (m3 result) k = true → m2.func (m3 result) k = m2.func (m3 t6) k) → m2.card (m3 result) = m2.card (m3 t6) + (1 : ℤ) ∧ (∀(k : t), lt k k0 → ¬m2.domn (m3 result) k = true) ∧ (∀(k : t), lt k0 k → (m2.domn (m3 result) k = true) = (m2.domn (m3 t6) k = true)))
  := sorry
end tables_Set_add_min_eltqtvc
