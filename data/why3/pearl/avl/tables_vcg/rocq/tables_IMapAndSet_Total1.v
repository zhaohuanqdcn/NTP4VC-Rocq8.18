From Coq Require Import Strings.String.
From Coq Require Import String Ascii.
From Coq Require Arith.
From stdpp Require Import base.
From stdpp Require Import fin_maps.
From stdpp Require Import gmap.
From stdpp Require Import base gmultiset.
From Coq Require Classical.
From Coq Require Import ZArith.
From stdpp.bitvector Require Import definitions tactics.
From Coq Require Import Sorting.Sorted.
From Coq Require Import Reals.Rbasic_fun.
From Coq Require Import Reals.Abstract.ConstructiveAbs.
From Coq Require Import Reals.Rdefinitions.
From stdpp Require Import list_relations.
From stdpp Require Import list_numbers.
From stdpp Require Import functions.
From Coq Require Import ClassicalEpsilon.
From stdpp Require Import base decidable.
From Coq Require Import ZArith.Zeuclid.
From Coq Require Import ZArith.Znumtheory.
From stdpp Require Import propset.
From Coq Require Import Reals.
Require Import Why3.Base.
Require Import Why3.why3.Ref.Ref.
Require Import avl.avl.SelectionTypes.
Open Scope Z_scope.
Axiom t : Type.
Axiom t_inhabited : Inhabited t.
Global Existing Instance t_inhabited.
Axiom t_countable : Countable t.
Global Existing Instance t_countable.
Axiom balancing : nat.
Axiom balancing'def : Z.of_nat balancing = Z.of_nat 0%nat + 1%Z.
Axiom t1 : Type -> Type.
Axiom t1_inhabited : forall  {α : Type} `{Inhabited α}, Inhabited (t1 α).
Global Existing Instance t1_inhabited.
Definition key {α : Type} `{Inhabited α} (t2 : Z * α) : Z := match t2 with | (a, _) => a end.
Axiom t2 : Type.
Axiom t2_inhabited : Inhabited t2.
Global Existing Instance t2_inhabited.
Axiom t2_countable : Countable t2.
Global Existing Instance t2_countable.
Axiom assoc : True.
Axiom neutral : forall  (x : unit), () = x ∧ x = ().
Axiom selector : Type.
Axiom selector_inhabited : Inhabited selector.
Global Existing Instance selector_inhabited.
Axiom selector_countable : Countable selector.
Global Existing Instance selector_countable.
Definition selection_possible {β : Type} {α : Type} `{Inhabited β} `{Inhabited α} (x : β) (s : list (Z * α)) := ∀(i : Z) (j : Z), 0%Z ≤ i ∧ i < j ∧ j < Z.of_nat (length s) -> key (nth (Z.to_nat i) s inhabitant) < key (nth (Z.to_nat j) s inhabitant).
Definition upper_bound_s {α : Type} `{Inhabited α} (k : Z) (s : list (Z * α)) := ∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length s) -> key (nth (Z.to_nat i) s inhabitant) < k.
Definition lower_bound_s {α : Type} `{Inhabited α} (k : Z) (s : list (Z * α)) := ∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length s) -> k < key (nth (Z.to_nat i) s inhabitant).
Definition selected {α : Type} `{Inhabited α} (k : Z) (e : split (Z * α)) := upper_bound_s k (left1 e) ∧ lower_bound_s k (right1 e) ∧ (match middle e with | None => True | Some d => k = key d end).
Inductive tree (α : Type) :=
  | Empty : tree α
  | Node : tree α -> Z * α -> tree α -> nat -> unit -> tree α.
Axiom tree_inhabited : forall  {α : Type} `{Inhabited α}, Inhabited (tree α).
Global Existing Instance tree_inhabited.
Arguments Empty {α}.
Arguments Node {α}.
Inductive m (α : Type) :=
  | m'mk : list (Z * α) -> Z -> m α.
Axiom m_inhabited : forall  {α : Type} `{Inhabited α}, Inhabited (m α).
Global Existing Instance m_inhabited.
Arguments m'mk {α}.
Definition seq {α : Type} (x : m α) := match x with |  m'mk a _ => a end.
Definition hgt {α : Type} (x : m α) := match x with |  m'mk _ a => a end.
Definition node_model {α : Type} `{Inhabited α} (l : list α) (d : α) (r : list α) : list α := l ++ cons d r.
Program Fixpoint seq_model {α : Type} `{Inhabited α} (t3 : tree α) : list (Z * α) :=
match t3 with | Empty => ([] : list (Z * α)) | Node l d r _ _ => node_model (seq_model l) d (seq_model r) end.
Admit Obligations.
Program Fixpoint real_height {α : Type} `{Inhabited α} (t3 : tree α) : Z :=
match t3 with | Empty => 0%Z | Node l _ r _ _ => (let hl : Z := real_height l in let hr : Z := real_height r in 1%Z + (if decide (hl < hr) then hr else hl)) end.
Admit Obligations.
Program Fixpoint balanced {α : Type} `{Inhabited α} (t3 : tree α) : Prop :=
match t3 with | Empty => True | Node l _ r h m1 => Z.of_nat h = real_height t3 ∧ m1 = () ∧ (- Z.of_nat balancing ≤ real_height r - real_height l ∧ real_height r - real_height l ≤ Z.of_nat balancing) ∧ balanced l ∧ balanced r end.
Admit Obligations.
Axiom t3 : Type -> Type.
Axiom t3_inhabited : forall  {α : Type} `{Inhabited α}, Inhabited (t3 α).
Global Existing Instance t3_inhabited.
Axiom repr : forall {α : Type} `{Inhabited α}, t3 α -> tree α.
Axiom m1 : forall {α : Type} `{Inhabited α}, t3 α -> m α.
Axiom t'invariant : forall  {α : Type} `{Inhabited α} (self : t3 α), balanced (repr self) ∧ seq (m1 self) = seq_model (repr self) ∧ hgt (m1 self) = real_height (repr self).
Definition t'eq {α : Type} `{Inhabited α} (a : t3 α) (b : t3 α) := repr a = repr b ∧ m1 a = m1 b.
Axiom t'inj : forall  {α : Type} `{Inhabited α} (a : t3 α) (b : t3 α) (fact0 : t'eq a b), a = b.
Inductive view (α : Type) :=
  | AEmpty : view α
  | ANode : t3 α -> Z * α -> t3 α -> nat -> unit -> view α.
Axiom view_inhabited : forall  {α : Type} `{Inhabited α}, Inhabited (view α).
Global Existing Instance view_inhabited.
Arguments AEmpty {α}.
Arguments ANode {α}.
Axiom part : Type.
Axiom part_inhabited : Inhabited part.
Global Existing Instance part_inhabited.
Axiom part_countable : Countable part.
Global Existing Instance part_countable.
Axiom t4 : Type -> Type.
Axiom t4_inhabited : forall  {α : Type} `{Inhabited α}, Inhabited (t4 α).
Global Existing Instance t4_inhabited.
Axiom field : forall {α : Type} `{Inhabited α}, t4 α -> t3 α.
Axiom t'invariant1 : forall  {α : Type} `{Inhabited α} (self : t4 α), selection_possible () (seq (m1 (field self))).
Definition t'eq1 {α : Type} `{Inhabited α} (a : t4 α) (b : t4 α) := field a = field b.
Axiom t'inj1 : forall  {α : Type} `{Inhabited α} (a : t4 α) (b : t4 α) (fact0 : t'eq1 a b), a = b.
Inductive m2 (α : Type) :=
  | m'mk1 : (Z -> bool) -> (Z -> Z * α) -> Z -> m2 α.
Axiom m2_inhabited : forall  {α : Type} `{Inhabited α}, Inhabited (m2 α).
Global Existing Instance m2_inhabited.
Arguments m'mk1 {α}.
Definition domn {α : Type} (x : m2 α) := match x with |  m'mk1 a _ _ => a end.
Definition func {α : Type} (x : m2 α) := match x with |  m'mk1 _ a _ => a end.
Definition card {α : Type} (x : m2 α) := match x with |  m'mk1 _ _ a => a end.
Definition domain {α : Type} `{Inhabited α} (s : list (Z * α)) (k : Z) := ∃(i : Z), (0%Z ≤ i ∧ i < Z.of_nat (length s)) ∧ key (nth (Z.to_nat i) s inhabitant) = k.
Axiom make_func : forall {α : Type} `{Inhabited α}, list (Z * α) -> Z -> Z * α.
Axiom make_func'spec : forall  {α : Type} `{Inhabited α} (s : list (Z * α)) (k : Z) (i : Z) (fact0 : selection_possible () s) (fact1 : domain s k) (fact2 : 0%Z ≤ i) (fact3 : i < Z.of_nat (length s)) (fact4 : key (nth (Z.to_nat i) s inhabitant) = k), make_func s k = nth (Z.to_nat i) s inhabitant.
Axiom domain_closure : forall {α : Type} `{Inhabited α}, list (Z * α) -> Z -> bool.
Axiom make_func_closure : forall {α : Type} `{Inhabited α}, list (Z * α) -> Z -> Z * α.
Axiom domain_closure_def : forall  {α : Type} `{Inhabited α} (y : list (Z * α)) (y1 : Z), (domain_closure y y1 = true) = domain y y1.
Axiom make_func_closure_def : forall  {α : Type} `{Inhabited α} (y : list (Z * α)) (y1 : Z), make_func_closure y y1 = make_func y y1.
Definition m3 {α : Type} `{Inhabited α} (t5 : t4 α) : m2 α := m'mk1 (domain_closure (seq (m1 (field t5)))) (make_func_closure (seq (m1 (field t5)))) (Z.of_nat (length (seq (m1 (field t5))))).
Inductive view1 (α : Type) :=
  | AEmpty1 : view1 α
  | ANode1 : t4 α -> Z * α -> t4 α -> nat -> view1 α.
Axiom view1_inhabited : forall  {α : Type} `{Inhabited α}, Inhabited (view1 α).
Global Existing Instance view1_inhabited.
Arguments AEmpty1 {α}.
Arguments ANode1 {α}.
Axiom t5 : Type -> Type.
Axiom t5_inhabited : forall  {α : Type} `{Inhabited α}, Inhabited (t5 α).
Global Existing Instance t5_inhabited.
Inductive m4 (α : Type) :=
  | m'mk2 : (Z -> bool) -> (Z -> α) -> Z -> m4 α.
Axiom m4_inhabited : forall  {α : Type} `{Inhabited α}, Inhabited (m4 α).
Global Existing Instance m4_inhabited.
Arguments m'mk2 {α}.
Definition domn1 {α : Type} (x : m4 α) := match x with |  m'mk2 a _ _ => a end.
Definition func1 {α : Type} (x : m4 α) := match x with |  m'mk2 _ a _ => a end.
Definition card1 {α : Type} (x : m4 α) := match x with |  m'mk2 _ _ a => a end.
Axiom fc : forall {α : Type} `{Inhabited α}, t4 α -> Z -> α.
Axiom fc'def : forall  {α : Type} `{Inhabited α} (t6 : t4 α) (k : Z), fc t6 k = (match func (m3 t6) k with | (_, v) => v end).
Definition m5 {α : Type} `{Inhabited α} (t6 : t4 α) : m4 α := m'mk2 (domn (m3 t6)) (fc t6) (card (m3 t6)).
Theorem Total (x : Z) (y : Z) : x ≤ y ∨ y ≤ x.
Proof.
Admitted.
