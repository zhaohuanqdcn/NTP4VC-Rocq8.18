import Why3.Base
import Why3.why3.Ref.Ref
import pearl.avl.lib.lean.avl.SelectionTypes
open Classical
open Lean4Why3
namespace tables_MapBase_remove_allqtvc
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
axiom assoc : True
axiom neutral (x : Unit) : () = x ∧ x = ()
axiom selector : Type
axiom inhabited_axiom_selector : Inhabited selector
attribute [instance] inhabited_axiom_selector
noncomputable def selection_possible {β : Type} {α : Type} [Inhabited β] [Inhabited α] (x : β) (s : List (t α)) := ∀(i : ℤ) (j : ℤ), (0 : ℤ) ≤ i ∧ i < j ∧ j < Int.ofNat (List.length s) → lt (key (s[Int.toNat i]!)) (key (s[Int.toNat j]!))
noncomputable def upper_bound_s {α : Type} [Inhabited α] (k : t1) (s : List (t α)) := ∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length s) → lt (key (s[Int.toNat i]!)) k
noncomputable def lower_bound_s {α : Type} [Inhabited α] (k : t1) (s : List (t α)) := ∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length s) → lt k (key (s[Int.toNat i]!))
noncomputable def selected {α : Type} [Inhabited α] (k : t1) (e : SelectionTypes.split (t α)) := upper_bound_s k (SelectionTypes.split.left1 e) ∧ lower_bound_s k (SelectionTypes.split.right1 e) ∧ (match SelectionTypes.split.middle e with | (Option.none : Option (t α)) => True | Option.some d => eq k (key d))
inductive tree (α : Type) where
  | Empty : tree α
  | Node : tree α -> t α -> tree α -> ℕ -> Unit -> tree α
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
  | ANode : t3 α -> t α -> t3 α -> ℕ -> Unit -> view α
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
  domn : t1 -> Bool
  func : t1 -> t α
  card : ℤ
axiom inhabited_axiom_m2 {α : Type} [Inhabited α] : Inhabited (m2 α)
attribute [instance] inhabited_axiom_m2
noncomputable def domain {α : Type} [Inhabited α] (s : List (t α)) (k : t1) := ∃(i : ℤ), ((0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length s)) ∧ eq (key (s[Int.toNat i]!)) k
axiom make_func :  {α : Type} -> [Inhabited α] -> List (t α) -> t1 -> t α
axiom make_func'spec {α : Type} [Inhabited α] (s : List (t α)) (k : t1) (i : ℤ) (fact0 : selection_possible () s) (fact1 : domain s k) (fact2 : (0 : ℤ) ≤ i) (fact3 : i < Int.ofNat (List.length s)) (fact4 : eq (key (s[Int.toNat i]!)) k) : make_func s k = s[Int.toNat i]!
axiom domain_closure :  {α : Type} -> [Inhabited α] -> List (t α) -> t1 -> Bool
axiom make_func_closure :  {α : Type} -> [Inhabited α] -> List (t α) -> t1 -> t α
axiom domain_closure_def {α : Type} [Inhabited α] (y : List (t α)) (y1 : t1) : (domain_closure y y1 = true) = domain y y1
axiom make_func_closure_def {α : Type} [Inhabited α] (y : List (t α)) (y1 : t1) : make_func_closure y y1 = make_func y y1
noncomputable def m3 {α : Type} [Inhabited α] (t5 : t4 α) := (m2.mk : (t1 -> Bool) -> (t1 -> t α) -> ℤ -> m2 α) (domain_closure (m.seq (m1 (field t5)))) (make_func_closure (m.seq (m1 (field t5)))) (Int.ofNat (List.length (m.seq (m1 (field t5)))))
inductive view1 (α : Type) where
  | AEmpty1 : view1 α
  | ANode1 : t4 α -> t α -> t4 α -> ℕ -> view1 α
axiom inhabited_axiom_view1 {α : Type} [Inhabited α] : Inhabited (view1 α)
attribute [instance] inhabited_axiom_view1
theorem remove_all'vc {β : Type} {α : Type} [Inhabited β] [Inhabited α] (o1 : view1 α) (a : t4 α) (p : t4 β) (fact0 : match o1 with | (view1.AEmpty1 : view1 α) => m2.card (m3 a) = (0 : ℤ) ∧ (∀(k : t1), ¬m2.domn (m3 a) k = true) | view1.ANode1 l d r h => m2.card (m3 a) = (1 : ℤ) + m2.card (m3 l) + m2.card (m3 r) ∧ Int.ofNat h = m.hgt (m1 (field a)) ∧ (let k0 : t1 := key d; (∀(k : t1), lt k k0 → (m2.domn (m3 l) k = true) = (m2.domn (m3 a) k = true)) ∧ (∀(k : t1), lt k k0 ∧ m2.domn (m3 l) k = true → m2.func (m3 l) k = m2.func (m3 a) k) ∧ (∀(k : t1), le k0 k → ¬m2.domn (m3 l) k = true) ∧ (∀(k : t1), lt k0 k → (m2.domn (m3 r) k = true) = (m2.domn (m3 a) k = true)) ∧ (∀(k : t1), lt k0 k ∧ m2.domn (m3 r) k = true → m2.func (m3 r) k = m2.func (m3 a) k) ∧ (∀(k : t1), le k k0 → ¬m2.domn (m3 r) k = true) ∧ (∀(k : t1), eq k k0 → m2.domn (m3 a) k = true ∧ m2.func (m3 a) k = d) ∧ m2.domn (m3 a) k0 = true ∧ m2.func (m3 a) k0 = d)) : (match o1 with | (view1.AEmpty1 : view1 α) => True | view1.ANode1 al ad ar ah => (∀(o2 : view1 β), (match o2 with | (view1.AEmpty1 : view1 β) => m2.card (m3 p) = (0 : ℤ) ∧ (∀(k : t1), ¬m2.domn (m3 p) k = true) | view1.ANode1 l d r h => m2.card (m3 p) = (1 : ℤ) + m2.card (m3 l) + m2.card (m3 r) ∧ Int.ofNat h = m.hgt (m1 (field p)) ∧ (let k0 : t1 := key d; (∀(k : t1), lt k k0 → (m2.domn (m3 l) k = true) = (m2.domn (m3 p) k = true)) ∧ (∀(k : t1), lt k k0 ∧ m2.domn (m3 l) k = true → m2.func (m3 l) k = m2.func (m3 p) k) ∧ (∀(k : t1), le k0 k → ¬m2.domn (m3 l) k = true) ∧ (∀(k : t1), lt k0 k → (m2.domn (m3 r) k = true) = (m2.domn (m3 p) k = true)) ∧ (∀(k : t1), lt k0 k ∧ m2.domn (m3 r) k = true → m2.func (m3 r) k = m2.func (m3 p) k) ∧ (∀(k : t1), le k k0 → ¬m2.domn (m3 r) k = true) ∧ (∀(k : t1), eq k k0 → m2.domn (m3 p) k = true ∧ m2.func (m3 p) k = d) ∧ m2.domn (m3 p) k0 = true ∧ m2.func (m3 p) k0 = d)) → (match o2 with | (view1.AEmpty1 : view1 β) => True | view1.ANode1 pl pd pr ph => (if ah ≤ ph then let o3 : t1 := key pd; ∀(al1 : t4 α) (o4 : Option (t α)) (ar1 : t4 α), (∀(k : t1), lt k o3 → (m2.domn (m3 al1) k = true) = (m2.domn (m3 a) k = true)) ∧ (∀(k : t1), lt k o3 ∧ m2.domn (m3 al1) k = true → m2.func (m3 al1) k = m2.func (m3 a) k) ∧ (∀(k : t1), le o3 k → ¬m2.domn (m3 al1) k = true) ∧ (∀(k : t1), lt o3 k → (m2.domn (m3 ar1) k = true) = (m2.domn (m3 a) k = true)) ∧ (∀(k : t1), lt o3 k ∧ m2.domn (m3 ar1) k = true → m2.func (m3 ar1) k = m2.func (m3 a) k) ∧ (∀(k : t1), le k o3 → ¬m2.domn (m3 ar1) k = true) ∧ (match o4 with | (Option.none : Option (t α)) => m2.card (m3 a) = m2.card (m3 al1) + m2.card (m3 ar1) ∧ (∀(k : t1), eq k o3 → ¬m2.domn (m3 a) k = true) ∧ ¬m2.domn (m3 a) o3 = true | Option.some d => m2.card (m3 a) = m2.card (m3 al1) + m2.card (m3 ar1) + (1 : ℤ) ∧ eq (key d) o3 ∧ (∀(k : t1), eq k o3 → m2.domn (m3 a) k = true ∧ m2.func (m3 a) k = d) ∧ m2.domn (m3 a) o3 = true ∧ m2.func (m3 a) o3 = d) → ((0 : ℤ) ≤ m2.card (m3 a) + m2.card (m3 p) ∧ m2.card (m3 al1) + m2.card (m3 pl) < m2.card (m3 a) + m2.card (m3 p)) ∧ (∀(fl : t4 α), (∀(k : t1), (m2.domn (m3 fl) k = true) = (m2.domn (m3 al1) k = true ∧ ¬m2.domn (m3 pl) k = true)) ∧ (∀(k : t1), m2.domn (m3 fl) k = true → m2.func (m3 fl) k = m2.func (m3 al1) k) ∧ m2.card (m3 fl) ≤ m2.card (m3 al1) → ((0 : ℤ) ≤ m2.card (m3 a) + m2.card (m3 p) ∧ m2.card (m3 ar1) + m2.card (m3 pr) < m2.card (m3 a) + m2.card (m3 p)) ∧ (∀(fr : t4 α), (∀(k : t1), (m2.domn (m3 fr) k = true) = (m2.domn (m3 ar1) k = true ∧ ¬m2.domn (m3 pr) k = true)) ∧ (∀(k : t1), m2.domn (m3 fr) k = true → m2.func (m3 fr) k = m2.func (m3 ar1) k) ∧ m2.card (m3 fr) ≤ m2.card (m3 ar1) → (∀(k1 : t1) (k2 : t1), m2.domn (m3 fl) k1 = true ∧ m2.domn (m3 fr) k2 = true → lt k1 k2))) else let o3 : t1 := key ad; ∀(pl1 : t4 β) (pd1 : Option (t β)) (pr1 : t4 β), (∀(k : t1), lt k o3 → (m2.domn (m3 pl1) k = true) = (m2.domn (m3 p) k = true)) ∧ (∀(k : t1), lt k o3 ∧ m2.domn (m3 pl1) k = true → m2.func (m3 pl1) k = m2.func (m3 p) k) ∧ (∀(k : t1), le o3 k → ¬m2.domn (m3 pl1) k = true) ∧ (∀(k : t1), lt o3 k → (m2.domn (m3 pr1) k = true) = (m2.domn (m3 p) k = true)) ∧ (∀(k : t1), lt o3 k ∧ m2.domn (m3 pr1) k = true → m2.func (m3 pr1) k = m2.func (m3 p) k) ∧ (∀(k : t1), le k o3 → ¬m2.domn (m3 pr1) k = true) ∧ (match pd1 with | (Option.none : Option (t β)) => m2.card (m3 p) = m2.card (m3 pl1) + m2.card (m3 pr1) ∧ (∀(k : t1), eq k o3 → ¬m2.domn (m3 p) k = true) ∧ ¬m2.domn (m3 p) o3 = true | Option.some d => m2.card (m3 p) = m2.card (m3 pl1) + m2.card (m3 pr1) + (1 : ℤ) ∧ eq (key d) o3 ∧ (∀(k : t1), eq k o3 → m2.domn (m3 p) k = true ∧ m2.func (m3 p) k = d) ∧ m2.domn (m3 p) o3 = true ∧ m2.func (m3 p) o3 = d) → ((0 : ℤ) ≤ m2.card (m3 a) + m2.card (m3 p) ∧ m2.card (m3 al) + m2.card (m3 pl1) < m2.card (m3 a) + m2.card (m3 p)) ∧ (∀(fl : t4 α), (∀(k : t1), (m2.domn (m3 fl) k = true) = (m2.domn (m3 al) k = true ∧ ¬m2.domn (m3 pl1) k = true)) ∧ (∀(k : t1), m2.domn (m3 fl) k = true → m2.func (m3 fl) k = m2.func (m3 al) k) ∧ m2.card (m3 fl) ≤ m2.card (m3 al) → ((0 : ℤ) ≤ m2.card (m3 a) + m2.card (m3 p) ∧ m2.card (m3 ar) + m2.card (m3 pr1) < m2.card (m3 a) + m2.card (m3 p)) ∧ (∀(fr : t4 α), (∀(k : t1), (m2.domn (m3 fr) k = true) = (m2.domn (m3 ar) k = true ∧ ¬m2.domn (m3 pr1) k = true)) ∧ (∀(k : t1), m2.domn (m3 fr) k = true → m2.func (m3 fr) k = m2.func (m3 ar) k) ∧ m2.card (m3 fr) ≤ m2.card (m3 ar) → (match pd1 with | (Option.none : Option (t β)) => (∀(k : t1), m2.domn (m3 fl) k = true → lt k (key ad)) ∧ (∀(k : t1), m2.domn (m3 fr) k = true → lt (key ad) k) | _ => (∀(k1 : t1) (k2 : t1), m2.domn (m3 fl) k1 = true ∧ m2.domn (m3 fr) k2 = true → lt k1 k2)))))))) ∧ (∀(result : t4 α), (match o1 with | (view1.AEmpty1 : view1 α) => result = a | view1.ANode1 al ad ar ah => (∃(o2 : view1 β), (match o2 with | (view1.AEmpty1 : view1 β) => m2.card (m3 p) = (0 : ℤ) ∧ (∀(k : t1), ¬m2.domn (m3 p) k = true) | view1.ANode1 l d r h => m2.card (m3 p) = (1 : ℤ) + m2.card (m3 l) + m2.card (m3 r) ∧ Int.ofNat h = m.hgt (m1 (field p)) ∧ (let k0 : t1 := key d; (∀(k : t1), lt k k0 → (m2.domn (m3 l) k = true) = (m2.domn (m3 p) k = true)) ∧ (∀(k : t1), lt k k0 ∧ m2.domn (m3 l) k = true → m2.func (m3 l) k = m2.func (m3 p) k) ∧ (∀(k : t1), le k0 k → ¬m2.domn (m3 l) k = true) ∧ (∀(k : t1), lt k0 k → (m2.domn (m3 r) k = true) = (m2.domn (m3 p) k = true)) ∧ (∀(k : t1), lt k0 k ∧ m2.domn (m3 r) k = true → m2.func (m3 r) k = m2.func (m3 p) k) ∧ (∀(k : t1), le k k0 → ¬m2.domn (m3 r) k = true) ∧ (∀(k : t1), eq k k0 → m2.domn (m3 p) k = true ∧ m2.func (m3 p) k = d) ∧ m2.domn (m3 p) k0 = true ∧ m2.func (m3 p) k0 = d)) ∧ (match o2 with | (view1.AEmpty1 : view1 β) => result = a | view1.ANode1 pl pd pr ph => (if ah ≤ ph then let o3 : t1 := key pd; ∃(lf : t4 α) (o4 : Option (t α)) (rg : t4 α), ((∀(k : t1), lt k o3 → (m2.domn (m3 lf) k = true) = (m2.domn (m3 a) k = true)) ∧ (∀(k : t1), lt k o3 ∧ m2.domn (m3 lf) k = true → m2.func (m3 lf) k = m2.func (m3 a) k) ∧ (∀(k : t1), le o3 k → ¬m2.domn (m3 lf) k = true) ∧ (∀(k : t1), lt o3 k → (m2.domn (m3 rg) k = true) = (m2.domn (m3 a) k = true)) ∧ (∀(k : t1), lt o3 k ∧ m2.domn (m3 rg) k = true → m2.func (m3 rg) k = m2.func (m3 a) k) ∧ (∀(k : t1), le k o3 → ¬m2.domn (m3 rg) k = true) ∧ (match o4 with | (Option.none : Option (t α)) => m2.card (m3 a) = m2.card (m3 lf) + m2.card (m3 rg) ∧ (∀(k : t1), eq k o3 → ¬m2.domn (m3 a) k = true) ∧ ¬m2.domn (m3 a) o3 = true | Option.some d => m2.card (m3 a) = m2.card (m3 lf) + m2.card (m3 rg) + (1 : ℤ) ∧ eq (key d) o3 ∧ (∀(k : t1), eq k o3 → m2.domn (m3 a) k = true ∧ m2.func (m3 a) k = d) ∧ m2.domn (m3 a) o3 = true ∧ m2.func (m3 a) o3 = d)) ∧ (∃(fl : t4 α), ((∀(k : t1), (m2.domn (m3 fl) k = true) = (m2.domn (m3 lf) k = true ∧ ¬m2.domn (m3 pl) k = true)) ∧ (∀(k : t1), m2.domn (m3 fl) k = true → m2.func (m3 fl) k = m2.func (m3 lf) k) ∧ m2.card (m3 fl) ≤ m2.card (m3 lf)) ∧ (∃(fr : t4 α), ((∀(k : t1), (m2.domn (m3 fr) k = true) = (m2.domn (m3 rg) k = true ∧ ¬m2.domn (m3 pr) k = true)) ∧ (∀(k : t1), m2.domn (m3 fr) k = true → m2.func (m3 fr) k = m2.func (m3 rg) k) ∧ m2.card (m3 fr) ≤ m2.card (m3 rg)) ∧ (∀(k : t1), (m2.domn (m3 result) k = true) = (m2.domn (m3 fl) k = true ∨ m2.domn (m3 fr) k = true)) ∧ (∀(k : t1), m2.domn (m3 result) k = true ∧ m2.domn (m3 fl) k = true → m2.func (m3 result) k = m2.func (m3 fl) k) ∧ (∀(k : t1), m2.domn (m3 result) k = true ∧ m2.domn (m3 fr) k = true → m2.func (m3 result) k = m2.func (m3 fr) k) ∧ m2.card (m3 result) = m2.card (m3 fl) + m2.card (m3 fr))) else let o3 : t1 := key ad; ∃(lf : t4 β) (o4 : Option (t β)) (rg : t4 β), ((∀(k : t1), lt k o3 → (m2.domn (m3 lf) k = true) = (m2.domn (m3 p) k = true)) ∧ (∀(k : t1), lt k o3 ∧ m2.domn (m3 lf) k = true → m2.func (m3 lf) k = m2.func (m3 p) k) ∧ (∀(k : t1), le o3 k → ¬m2.domn (m3 lf) k = true) ∧ (∀(k : t1), lt o3 k → (m2.domn (m3 rg) k = true) = (m2.domn (m3 p) k = true)) ∧ (∀(k : t1), lt o3 k ∧ m2.domn (m3 rg) k = true → m2.func (m3 rg) k = m2.func (m3 p) k) ∧ (∀(k : t1), le k o3 → ¬m2.domn (m3 rg) k = true) ∧ (match o4 with | (Option.none : Option (t β)) => m2.card (m3 p) = m2.card (m3 lf) + m2.card (m3 rg) ∧ (∀(k : t1), eq k o3 → ¬m2.domn (m3 p) k = true) ∧ ¬m2.domn (m3 p) o3 = true | Option.some d => m2.card (m3 p) = m2.card (m3 lf) + m2.card (m3 rg) + (1 : ℤ) ∧ eq (key d) o3 ∧ (∀(k : t1), eq k o3 → m2.domn (m3 p) k = true ∧ m2.func (m3 p) k = d) ∧ m2.domn (m3 p) o3 = true ∧ m2.func (m3 p) o3 = d)) ∧ (∃(fl : t4 α), ((∀(k : t1), (m2.domn (m3 fl) k = true) = (m2.domn (m3 al) k = true ∧ ¬m2.domn (m3 lf) k = true)) ∧ (∀(k : t1), m2.domn (m3 fl) k = true → m2.func (m3 fl) k = m2.func (m3 al) k) ∧ m2.card (m3 fl) ≤ m2.card (m3 al)) ∧ (∃(fr : t4 α), ((∀(k : t1), (m2.domn (m3 fr) k = true) = (m2.domn (m3 ar) k = true ∧ ¬m2.domn (m3 rg) k = true)) ∧ (∀(k : t1), m2.domn (m3 fr) k = true → m2.func (m3 fr) k = m2.func (m3 ar) k) ∧ m2.card (m3 fr) ≤ m2.card (m3 ar)) ∧ (match o4 with | (Option.none : Option (t β)) => (∀(k : t1), lt k (key ad) → (m2.domn (m3 result) k = true) = (m2.domn (m3 fl) k = true)) ∧ (∀(k : t1), lt k (key ad) ∧ m2.domn (m3 result) k = true → m2.func (m3 result) k = m2.func (m3 fl) k) ∧ (∀(k : t1), lt (key ad) k → (m2.domn (m3 result) k = true) = (m2.domn (m3 fr) k = true)) ∧ (∀(k : t1), lt (key ad) k ∧ m2.domn (m3 result) k = true → m2.func (m3 result) k = m2.func (m3 fr) k) ∧ (∀(k : t1), eq k (key ad) → m2.domn (m3 result) k = true ∧ m2.func (m3 result) k = ad) ∧ m2.card (m3 result) = (1 : ℤ) + m2.card (m3 fl) + m2.card (m3 fr) | _ => (∀(k : t1), (m2.domn (m3 result) k = true) = (m2.domn (m3 fl) k = true ∨ m2.domn (m3 fr) k = true)) ∧ (∀(k : t1), m2.domn (m3 result) k = true ∧ m2.domn (m3 fl) k = true → m2.func (m3 result) k = m2.func (m3 fl) k) ∧ (∀(k : t1), m2.domn (m3 result) k = true ∧ m2.domn (m3 fr) k = true → m2.func (m3 result) k = m2.func (m3 fr) k) ∧ m2.card (m3 result) = m2.card (m3 fl) + m2.card (m3 fr)))))))) → (∀(k : t1), (m2.domn (m3 result) k = true) = (m2.domn (m3 a) k = true ∧ ¬m2.domn (m3 p) k = true)) ∧ (∀(k : t1), m2.domn (m3 result) k = true → m2.func (m3 result) k = m2.func (m3 a) k) ∧ m2.card (m3 result) ≤ m2.card (m3 a))
  := sorry
end tables_MapBase_remove_allqtvc
