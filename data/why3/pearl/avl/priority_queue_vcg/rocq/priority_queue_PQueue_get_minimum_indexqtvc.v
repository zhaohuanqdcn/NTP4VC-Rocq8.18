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
Require Import Why3.int.NumOf.
Require Import avl.avl.SelectionTypes.
Open Scope Z_scope.
Axiom balancing : nat.
Axiom balancing'def : 0%Z < Z.of_nat balancing.
Axiom t : Type -> Type.
Axiom t_inhabited : forall  {α : Type} `{Inhabited α}, Inhabited (t α).
Global Existing Instance t_inhabited.
Axiom t1 : Type.
Axiom t1_inhabited : Inhabited t1.
Global Existing Instance t1_inhabited.
Axiom t1_countable : Countable t1.
Global Existing Instance t1_countable.
Axiom key : forall {α : Type} `{Inhabited α}, t α -> t1.
Axiom le : t1 -> t1 -> Prop.
Axiom Refl : forall  (x : t1), le x x.
Axiom Trans : forall  (x : t1) (y : t1) (z : t1) (fact0 : le x y) (fact1 : le y z), le x z.
Axiom eq : t1 -> t1 -> Prop.
Axiom eq_def : forall  (x : t1) (y : t1), eq x y = (le x y ∧ le y x).
Axiom lt : t1 -> t1 -> Prop.
Axiom lt_def : forall  (x : t1) (y : t1), lt x y = (le x y ∧ ¬ le y x).
Axiom Total : forall  (x : t1) (y : t1), le x y ∨ le y x.
Axiom t2 : Type.
Axiom t2_inhabited : Inhabited t2.
Global Existing Instance t2_inhabited.
Axiom t2_countable : Countable t2.
Global Existing Instance t2_countable.
Definition op (x : option t1) (y : option t1) : option t1 := match x with | None => y | Some a => (match y with | None => x | Some b => (if decide (lt b a) then y else x) end) end.
Axiom assoc : forall  (a : option t1) (b : option t1) (c : option t1), op a (op b c) = op (op a b) c.
Axiom neutral : forall  (x : option t1), op x None = x ∧ x = op None x.
Axiom agg : forall {α : Type} `{Inhabited α}, (α -> option t1) -> list α -> option t1.
Axiom agg'def : forall  {α : Type} `{Inhabited α} (s : list α) (f : α -> option t1), if decide (Z.of_nat (length s) = 0%Z) then agg f s = None else agg f s = op (f (nth 0%nat s inhabitant)) (agg f (drop 1%nat s)).
Definition measure {α : Type} `{Inhabited α} (d : t α) : option t1 := Some (key d).
Axiom selector : Type.
Axiom selector_inhabited : Inhabited selector.
Global Existing Instance selector_inhabited.
Axiom selector_countable : Countable selector.
Global Existing Instance selector_countable.
Definition selection_possible {ε : Type} {η : Type} `{Inhabited ε} `{Inhabited η} (x : ε) (s : list η) := ¬ Z.of_nat (length s) = 0%Z.
Definition lower_bound {α : Type} `{Inhabited α} (x : t1) (s : list (t α)) := ∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length s) -> le x (key (nth (Z.to_nat i) s inhabitant)).
Definition lower_bound_strict {α : Type} `{Inhabited α} (x : t1) (s : list (t α)) := ∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length s) -> lt x (key (nth (Z.to_nat i) s inhabitant)).
Definition selected {ε : Type} {α : Type} `{Inhabited ε} `{Inhabited α} (x : ε) (e : split (t α)) := match middle e with | None => False | Some d => lower_bound (key d) (right1 e) ∧ lower_bound_strict (key d) (left1 e) end.
Inductive tree (α : Type) :=
  | Empty : tree α
  | Node : tree α -> t α -> tree α -> nat -> option t1 -> tree α.
Axiom tree_inhabited : forall  {α : Type} `{Inhabited α}, Inhabited (tree α).
Global Existing Instance tree_inhabited.
Arguments Empty {α}.
Arguments Node {α}.
Inductive m (α : Type) :=
  | m'mk : list (t α) -> Z -> m α.
Axiom m_inhabited : forall  {α : Type} `{Inhabited α}, Inhabited (m α).
Global Existing Instance m_inhabited.
Arguments m'mk {α}.
Definition seq {α : Type} (x : m α) := match x with |  m'mk a _ => a end.
Definition hgt {α : Type} (x : m α) := match x with |  m'mk _ a => a end.
Definition node_model {α : Type} `{Inhabited α} (l : list α) (d : α) (r : list α) : list α := l ++ cons d r.
Program Fixpoint seq_model {α : Type} `{Inhabited α} (t3 : tree α) : list (t α) :=
match t3 with | Empty => ([] : list (t α)) | Node l d r _ _ => node_model (seq_model l) d (seq_model r) end.
Admit Obligations.
Program Fixpoint real_height {α : Type} `{Inhabited α} (t3 : tree α) : Z :=
match t3 with | Empty => 0%Z | Node l _ r _ _ => (let hl : Z := real_height l in let hr : Z := real_height r in 1%Z + (if decide (hl < hr) then hr else hl)) end.
Admit Obligations.
Axiom measure_closure : forall {α : Type} `{Inhabited α}, t α -> option t1.
Axiom measure_closure_def : forall  {α : Type} `{Inhabited α} (y : t α), measure_closure y = measure y.
Program Fixpoint balanced {α : Type} `{Inhabited α} (t3 : tree α) : Prop :=
match t3 with | Empty => True | Node l _ r h m1 => Z.of_nat h = real_height t3 ∧ m1 = agg measure_closure (seq_model t3) ∧ (- Z.of_nat balancing ≤ real_height r - real_height l ∧ real_height r - real_height l ≤ Z.of_nat balancing) ∧ balanced l ∧ balanced r end.
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
  | ANode : t3 α -> t α -> t3 α -> nat -> option t1 -> view α.
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
Inductive m2 (α : Type) :=
  | m'mk1 : (t α -> Z) -> t α -> Z -> m2 α.
Axiom m2_inhabited : forall  {α : Type} `{Inhabited α}, Inhabited (m2 α).
Global Existing Instance m2_inhabited.
Arguments m'mk1 {α}.
Definition bag {α : Type} (x : m2 α) := match x with |  m'mk1 a _ _ => a end.
Definition minimum {α : Type} (x : m2 α) := match x with |  m'mk1 _ a _ => a end.
Definition card {α : Type} (x : m2 α) := match x with |  m'mk1 _ _ a => a end.
Axiom to_bag : forall {α : Type} `{Inhabited α}, list α -> α -> Z.
Axiom to_bag'def : forall  {α : Type} `{Inhabited α} (s : list α) (x : α), to_bag s x = Z.of_nat (count_occ' (drop 0%nat (take (length s - 0%nat) s)) x).
Theorem get_minimum_index'vc {α : Type} `{Inhabited α} (s : list (t α)) (fact0 : ¬ Z.of_nat (length s) = 0%Z) : let o1 : Z := Z.of_nat (length s) - 1%Z in (0%Z ≤ o1 + 1%Z -> (lower_bound_strict (key (nth 0%nat s inhabitant)) (take 0%nat s) ∧ lower_bound (key (nth 0%nat s inhabitant)) (drop 0%nat (take (0%nat - 0%nat) s)) ∧ 0%Z ≤ 0%Z ∧ 0%Z < Z.of_nat (length s)) ∧ (∀(r : Z), (∀(i : Z), (0%Z ≤ i ∧ i ≤ o1) ∧ lower_bound_strict (key (nth (Z.to_nat r) s inhabitant)) (take (Z.to_nat r) s) ∧ lower_bound (key (nth (Z.to_nat r) s inhabitant)) (drop (Z.to_nat r) (take (Z.to_nat i - Z.to_nat r) s)) ∧ (0%Z ≤ r ∧ r ≤ i) ∧ r < Z.of_nat (length s) -> (let o2 : t1 := key (nth (Z.to_nat r) s inhabitant) in let o3 : t1 := key (nth (Z.to_nat i) s inhabitant) in ∀(o4 : Z), (0%Z < o4) = lt o2 o3 ∧ (o4 < 0%Z) = lt o3 o2 ∧ (o4 = 0%Z) = eq o3 o2 -> (if decide (o4 < 0%Z) then lower_bound_strict (key (nth (Z.to_nat i) s inhabitant)) (take (Z.to_nat i) s) ∧ lower_bound (key (nth (Z.to_nat i) s inhabitant)) (drop (Z.to_nat i) (take (Z.to_nat (i + 1%Z) - Z.to_nat i) s)) ∧ (0%Z ≤ i ∧ i ≤ i + 1%Z) ∧ i < Z.of_nat (length s) else lower_bound_strict (key (nth (Z.to_nat r) s inhabitant)) (take (Z.to_nat r) s) ∧ lower_bound (key (nth (Z.to_nat r) s inhabitant)) (drop (Z.to_nat r) (take (Z.to_nat (i + 1%Z) - Z.to_nat r) s)) ∧ (0%Z ≤ r ∧ r ≤ i + 1%Z) ∧ r < Z.of_nat (length s)))) ∧ (lower_bound_strict (key (nth (Z.to_nat r) s inhabitant)) (take (Z.to_nat r) s) ∧ lower_bound (key (nth (Z.to_nat r) s inhabitant)) (drop (Z.to_nat r) (take (Z.to_nat (o1 + 1%Z) - Z.to_nat r) s)) ∧ (0%Z ≤ r ∧ r ≤ o1 + 1%Z) ∧ r < Z.of_nat (length s) -> (0%Z ≤ r ∧ r < Z.of_nat (length s)) ∧ agg measure_closure s = Some (key (nth (Z.to_nat r) s inhabitant)) ∧ lower_bound_strict (key (nth (Z.to_nat r) s inhabitant)) (take (Z.to_nat r) s) ∧ lower_bound (key (nth (Z.to_nat r) s inhabitant)) (drop (Z.to_nat r) s)))) ∧ (o1 + 1%Z < 0%Z -> (0%Z ≤ 0%Z ∧ 0%Z < Z.of_nat (length s)) ∧ agg measure_closure s = Some (key (nth 0%nat s inhabitant)) ∧ lower_bound_strict (key (nth 0%nat s inhabitant)) (take 0%nat s) ∧ lower_bound (key (nth 0%nat s inhabitant)) (drop 0%nat s)).
Admitted.
