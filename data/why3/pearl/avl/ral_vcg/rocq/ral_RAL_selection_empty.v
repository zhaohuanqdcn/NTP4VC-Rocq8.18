From Stdlib Require Import Strings.String.
From Stdlib Require Import String Ascii.
From Stdlib Require Arith.
From stdpp Require Import base.
From stdpp Require Import fin_maps.
From stdpp Require Import gmap.
From stdpp Require Import base gmultiset.
From Stdlib Require Classical.
From Stdlib Require Import ZArith.
From stdpp.bitvector Require Import definitions tactics.
From Stdlib Require Import Sorting.Sorted.
From Stdlib Require Import Reals.Rbasic_fun.
From Stdlib Require Import Reals.Abstract.ConstructiveAbs.
From Stdlib Require Import Reals.Rdefinitions.
From stdpp Require Import list_relations.
From stdpp Require Import list_numbers.
From stdpp Require Import functions.
From Stdlib Require Import ClassicalEpsilon.
From stdpp Require Import base decidable.
From Stdlib Require Import ZArith.Zeuclid.
From Stdlib Require Import ZArith.Znumtheory.
From stdpp Require Import propset.
From Stdlib Require Import Reals.
Require Import Why3.Base.
Require Import Why3.why3.Ref.Ref.
Require Import avl.avl.SelectionTypes.
Open Scope Z_scope.
Axiom balancing : nat.
Axiom balancing'def : 0%Z < Z.of_nat balancing.
Axiom m : Type.
Axiom m_inhabited : Inhabited m.
Global Existing Instance m_inhabited.
Axiom m_countable : Countable m.
Global Existing Instance m_countable.
Axiom t : Type.
Axiom t_inhabited : Inhabited t.
Global Existing Instance t_inhabited.
Axiom t_countable : Countable t.
Global Existing Instance t_countable.
Axiom assoc : forall  (a : Z) (b : Z) (c : Z), a + (b + c) = a + b + c.
Axiom neutral : forall  (x : Z), x + 0%Z = x ∧ x = 0%Z + x.
Axiom agg : forall {α : Type} `{Inhabited α}, (α -> Z) -> list α -> Z.
Axiom agg'def : forall  {α : Type} `{Inhabited α} (s : list α) (f : α -> Z), if decide (Z.of_nat (length s) = 0%Z) then agg f s = 0%Z else agg f s = f (nth 0%nat s inhabitant) + agg f (drop 1%nat s).
Axiom t1 : Type -> Type.
Axiom t1_inhabited : forall  {α : Type} `{Inhabited α}, Inhabited (t1 α).
Global Existing Instance t1_inhabited.
Definition measure {α : Type} `{Inhabited α} (x : α) : Z := 1%Z.
Inductive selector :=
  | selector'mk : Z -> bool -> selector.
Axiom selector_inhabited : Inhabited selector.
Global Existing Instance selector_inhabited.
Axiom selector_countable : Countable selector.
Global Existing Instance selector_countable.
Definition index (x : selector) := match x with |  selector'mk a _ => a end.
Definition hole (x : selector) := match x with |  selector'mk _ a => a end.
Definition selection_possible {α : Type} `{Inhabited α} (s : selector) (l : list α) := 0%Z ≤ index s ∧ (if decide (hole s = true) then index s ≤ Z.of_nat (length l) else index s < Z.of_nat (length l)).
Definition selected {α : Type} `{Inhabited α} (s : selector) (e : split α) := index s = Z.of_nat (length (left1 e)) ∧ (hole s = true) = (middle e = (None : option α)).
Inductive tree (α : Type) :=
  | Empty : tree α
  | Node : tree α -> α -> tree α -> nat -> Z -> tree α.
Axiom tree_inhabited : forall  {α : Type} `{Inhabited α}, Inhabited (tree α).
Global Existing Instance tree_inhabited.
Arguments Empty {α}.
Arguments Node {α}.
Inductive m1 (α : Type) :=
  | m'mk : list α -> Z -> m1 α.
Axiom m1_inhabited : forall  {α : Type} `{Inhabited α}, Inhabited (m1 α).
Global Existing Instance m1_inhabited.
Arguments m'mk {α}.
Definition seq {α : Type} (x : m1 α) := match x with |  m'mk a _ => a end.
Definition hgt {α : Type} (x : m1 α) := match x with |  m'mk _ a => a end.
Definition node_model {α : Type} `{Inhabited α} (l : list α) (d : α) (r : list α) : list α := l ++ cons d r.
Program Fixpoint seq_model {α : Type} `{Inhabited α} (t2 : tree α) : list α :=
match t2 with | Empty => ([] : list α) | Node l d r _ _ => node_model (seq_model l) d (seq_model r) end.
Admit Obligations.
Program Fixpoint real_height {α : Type} `{Inhabited α} (t2 : tree α) : Z :=
match t2 with | Empty => 0%Z | Node l _ r _ _ => (let hl : Z := real_height l in let hr : Z := real_height r in 1%Z + (if decide (hl < hr) then hr else hl)) end.
Admit Obligations.
Axiom measure_closure : forall {α : Type} `{Inhabited α}, α -> Z.
Axiom measure_closure_def : forall  {α : Type} `{Inhabited α} (y : α), measure_closure y = measure y.
Program Fixpoint balanced {α : Type} `{Inhabited α} (t2 : tree α) : Prop :=
match t2 with | Empty => True | Node l _ r h m2 => Z.of_nat h = real_height t2 ∧ m2 = agg measure_closure (seq_model t2) ∧ (- Z.of_nat balancing ≤ real_height r - real_height l ∧ real_height r - real_height l ≤ Z.of_nat balancing) ∧ balanced l ∧ balanced r end.
Admit Obligations.
Axiom t2 : Type -> Type.
Axiom t2_inhabited : forall  {α : Type} `{Inhabited α}, Inhabited (t2 α).
Global Existing Instance t2_inhabited.
Axiom repr : forall {α : Type} `{Inhabited α}, t2 α -> tree α.
Axiom m2 : forall {α : Type} `{Inhabited α}, t2 α -> m1 α.
Axiom t'invariant : forall  {α : Type} `{Inhabited α} (self : t2 α), balanced (repr self) ∧ seq (m2 self) = seq_model (repr self) ∧ hgt (m2 self) = real_height (repr self).
Definition t'eq {α : Type} `{Inhabited α} (a : t2 α) (b : t2 α) := repr a = repr b ∧ m2 a = m2 b.
Axiom t'inj : forall  {α : Type} `{Inhabited α} (a : t2 α) (b : t2 α) (fact0 : t'eq a b), a = b.
Inductive view (α : Type) :=
  | AEmpty : view α
  | ANode : t2 α -> α -> t2 α -> nat -> Z -> view α.
Axiom view_inhabited : forall  {α : Type} `{Inhabited α}, Inhabited (view α).
Global Existing Instance view_inhabited.
Arguments AEmpty {α}.
Arguments ANode {α}.
Theorem selection_empty {α : Type} `{Inhabited α} (s : selector) : let nil : list α := ([] : list α) in selection_possible s nil -> selected s (split'mk nil (None : option α) nil).
Admitted.
