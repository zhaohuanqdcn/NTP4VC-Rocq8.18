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
Theorem agg_sing {α : Type} `{Inhabited α} (s : list α) (f : α -> option t1) (fact0 : Z.of_nat (length s) = 1%Z) : agg f s = f (nth 0%nat s inhabitant).
Proof.
Admitted.
