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
Axiom assoc : True.
Axiom neutral : forall  (x : unit), () = x ∧ x = ().
Axiom selector : Type.
Axiom selector_inhabited : Inhabited selector.
Global Existing Instance selector_inhabited.
Axiom selector_countable : Countable selector.
Global Existing Instance selector_countable.
Definition selection_possible {β : Type} {α : Type} `{Inhabited β} `{Inhabited α} (x : β) (s : list (t α)) := ∀(i : Z) (j : Z), 0%Z ≤ i ∧ i < j ∧ j < Z.of_nat (length s) -> lt (key (nth (Z.to_nat i) s inhabitant)) (key (nth (Z.to_nat j) s inhabitant)).
Definition upper_bound_s {α : Type} `{Inhabited α} (k : t1) (s : list (t α)) := ∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length s) -> lt (key (nth (Z.to_nat i) s inhabitant)) k.
Definition lower_bound_s {α : Type} `{Inhabited α} (k : t1) (s : list (t α)) := ∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length s) -> lt k (key (nth (Z.to_nat i) s inhabitant)).
Definition selected {α : Type} `{Inhabited α} (k : t1) (e : split (t α)) := upper_bound_s k (left1 e) ∧ lower_bound_s k (right1 e) ∧ (match middle e with | None => True | Some d => eq k (key d) end).
Theorem selected_part'vc {α : Type} `{Inhabited α} (k : t1) (lseq : list (t α)) (d : t α) (rseq : list (t α)) (fact0 : selection_possible k (lseq ++ cons d rseq)) : let kd : t1 := key d in let o1 : list (t α) := cons d rseq in Z.of_nat (length o1) = 1%Z + Z.of_nat (length rseq) ∧ nth 0%nat o1 inhabitant = d ∧ (∀(i : Z), 0%Z < i ∧ i ≤ Z.of_nat (length rseq) -> nth (Z.to_nat i) o1 inhabitant = nth (Z.to_nat (i - 1%Z)) rseq inhabitant) -> (let s : list (t α) := lseq ++ o1 in Z.of_nat (length s) = Z.of_nat (length lseq) + Z.of_nat (length o1) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length lseq) -> nth (Z.to_nat i) s inhabitant = nth (Z.to_nat i) lseq inhabitant) ∧ (∀(i : Z), Z.of_nat (length lseq) ≤ i ∧ i < Z.of_nat (length s) -> nth (Z.to_nat i) s inhabitant = nth (Z.to_nat (i - Z.of_nat (length lseq))) o1 inhabitant) -> (∀(cmp : Z), (0%Z < cmp) = lt kd k ∧ (cmp < 0%Z) = lt k kd ∧ (cmp = 0%Z) = eq k kd -> (∀(result : part_base t1), (if decide (cmp < 0%Z) then result = Left k else if decide (0%Z < cmp) then result = Right k else result = Here) -> (match result with | Here => selected k (split'mk lseq (Some d) rseq) | Left sl => selection_possible sl lseq ∧ (∀(e : split (t α)), selected sl e ∧ rebuild e = lseq -> selected k (right_extend e d rseq)) | Right sr => selection_possible sr rseq ∧ (∀(e : split (t α)), selected sr e ∧ rebuild e = rseq -> selected k (left_extend lseq d e)) end)))).
Proof.
Admitted.
