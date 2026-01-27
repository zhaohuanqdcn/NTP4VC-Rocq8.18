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
Axiom part : Type.
Axiom part_inhabited : Inhabited part.
Global Existing Instance part_inhabited.
Axiom part_countable : Countable part.
Global Existing Instance part_countable.
Axiom t3 : Type -> Type.
Axiom t3_inhabited : forall  {α : Type} `{Inhabited α}, Inhabited (t3 α).
Global Existing Instance t3_inhabited.
Axiom m3 : Type -> Type.
Axiom m3_inhabited : forall  {α : Type} `{Inhabited α}, Inhabited (m3 α).
Global Existing Instance m3_inhabited.
Theorem harness'vc (a : t2 Z) (b : t2 Z) (fact0 : 43%Z < Z.of_nat (length (seq (m2 a)))) (fact1 : 43%Z < Z.of_nat (length (seq (m2 b)))) (fact2 : ∀(n : Z), 0%Z ≤ n ∧ n < Z.of_nat (length (seq (m2 a))) -> nth (Z.to_nat n) (seq (m2 a)) inhabitant = 0%Z) (fact3 : ∀(n : Z), 0%Z ≤ n ∧ n < Z.of_nat (length (seq (m2 b))) -> nth (Z.to_nat n) (seq (m2 b)) inhabitant = 1%Z) : 0%Z ≤ 1%Z ∧ 1%Z < Z.of_nat (length (seq (m2 a))) ∧ (∀(a1 : t2 Z), seq (m2 a1) = set_list (seq (m2 a)) 1%nat 1%Z ∧ length (seq (m2 a1)) = length (seq (m2 a)) ∧ (∀(i : Z), (0%Z ≤ i ∧ i < Z.of_nat (length (seq (m2 a)))) ∧ ¬ i = 1%Z -> nth (Z.to_nat i) (seq (m2 a1)) inhabitant = nth (Z.to_nat i) (seq (m2 a)) inhabitant) ∧ nth 1%nat (seq (m2 a1)) inhabitant = 1%Z -> (0%Z ≤ 1%Z ∧ 1%Z < Z.of_nat (length (seq (m2 b)))) ∧ (∀(b1 : t2 Z), seq (m2 b1) = set_list (seq (m2 b)) 1%nat 10%Z ∧ length (seq (m2 b1)) = length (seq (m2 b)) ∧ (∀(i : Z), (0%Z ≤ i ∧ i < Z.of_nat (length (seq (m2 b)))) ∧ ¬ i = 1%Z -> nth (Z.to_nat i) (seq (m2 b1)) inhabitant = nth (Z.to_nat i) (seq (m2 b)) inhabitant) ∧ nth 1%nat (seq (m2 b1)) inhabitant = 10%Z -> (0%Z ≤ 2%Z ∧ 2%Z < Z.of_nat (length (seq (m2 a1)))) ∧ (∀(a2 : t2 Z), seq (m2 a2) = set_list (seq (m2 a1)) 2%nat 2%Z ∧ length (seq (m2 a2)) = length (seq (m2 a1)) ∧ (∀(i : Z), (0%Z ≤ i ∧ i < Z.of_nat (length (seq (m2 a1)))) ∧ ¬ i = 2%Z -> nth (Z.to_nat i) (seq (m2 a2)) inhabitant = nth (Z.to_nat i) (seq (m2 a1)) inhabitant) ∧ nth 2%nat (seq (m2 a2)) inhabitant = 2%Z -> (0%Z ≤ 2%Z ∧ 2%Z < Z.of_nat (length (seq (m2 b1)))) ∧ (∀(b2 : t2 Z), seq (m2 b2) = set_list (seq (m2 b1)) 2%nat 20%Z ∧ length (seq (m2 b2)) = length (seq (m2 b1)) ∧ (∀(i : Z), (0%Z ≤ i ∧ i < Z.of_nat (length (seq (m2 b1)))) ∧ ¬ i = 2%Z -> nth (Z.to_nat i) (seq (m2 b2)) inhabitant = nth (Z.to_nat i) (seq (m2 b1)) inhabitant) ∧ nth 2%nat (seq (m2 b2)) inhabitant = 20%Z -> (nth 1%nat (seq (m2 a2)) inhabitant = 1%Z ∧ nth 42%nat (seq (m2 a2)) inhabitant = 0%Z) ∧ (nth 1%nat (seq (m2 b2)) inhabitant = 10%Z ∧ nth 42%nat (seq (m2 b2)) inhabitant = 1%Z) ∧ (0%Z ≤ 1%Z ∧ 1%Z < Z.of_nat (length (seq (m2 a2)))) ∧ (∀(a3 : t2 Z), seq (m2 a3) = take 1%nat (seq (m2 a2)) ++ drop (Z.to_nat (1%Z + 1%Z)) (seq (m2 a2)) ∧ Z.of_nat (length (seq (m2 a3))) = Z.of_nat (length (seq (m2 a2))) - 1%Z ∧ (∀(i : Z), 0%Z ≤ i ∧ i < 1%Z -> nth (Z.to_nat i) (seq (m2 a3)) inhabitant = nth (Z.to_nat i) (seq (m2 a2)) inhabitant) ∧ (∀(i : Z), 1%Z ≤ i ∧ i < Z.of_nat (length (seq (m2 a3))) -> nth (Z.to_nat i) (seq (m2 a3)) inhabitant = nth (Z.to_nat (i + 1%Z)) (seq (m2 a2)) inhabitant) -> (0%Z ≤ 2%Z ∧ 2%Z < Z.of_nat (length (seq (m2 b2)))) ∧ (∀(b3 : t2 Z), seq (m2 b3) = take 2%nat (seq (m2 b2)) ++ drop (Z.to_nat (2%Z + 1%Z)) (seq (m2 b2)) ∧ Z.of_nat (length (seq (m2 b3))) = Z.of_nat (length (seq (m2 b2))) - 1%Z ∧ (∀(i : Z), 0%Z ≤ i ∧ i < 2%Z -> nth (Z.to_nat i) (seq (m2 b3)) inhabitant = nth (Z.to_nat i) (seq (m2 b2)) inhabitant) ∧ (∀(i : Z), 2%Z ≤ i ∧ i < Z.of_nat (length (seq (m2 b3))) -> nth (Z.to_nat i) (seq (m2 b3)) inhabitant = nth (Z.to_nat (i + 1%Z)) (seq (m2 b2)) inhabitant) -> (nth 1%nat (seq (m2 a3)) inhabitant = 2%Z ∧ nth 42%nat (seq (m2 a3)) inhabitant = 0%Z) ∧ nth 2%nat (seq (m2 b3)) inhabitant = 1%Z ∧ nth 42%nat (seq (m2 b3)) inhabitant = 1%Z)))))).
Admitted.
