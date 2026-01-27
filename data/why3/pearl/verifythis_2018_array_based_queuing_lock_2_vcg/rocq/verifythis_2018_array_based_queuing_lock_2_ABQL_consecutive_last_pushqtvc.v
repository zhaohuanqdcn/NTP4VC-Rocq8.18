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
Open Scope Z_scope.
Axiom n : Z.
Axiom N_val : 2%Z ≤ n.
Axiom k : Z.
Axiom K_val : 2%Z ≤ k.
Axiom tick : Type.
Axiom tick_inhabited : Inhabited tick.
Global Existing Instance tick_inhabited.
Axiom tick_countable : Countable tick.
Global Existing Instance tick_countable.
Axiom b : tick -> Z.
Axiom v : tick -> Z.
Axiom tick'invariant : forall  (self : tick), 0%Z ≤ v self ∧ 0%Z ≤ b self ∧ b self < k * n ∧ b self = ZEuclid.modulo (v self) (k * n).
Definition tick'eq (a : tick) (b1 : tick) := b a = b b1 ∧ v a = v b1.
Axiom tick'inj : forall  (a : tick) (b1 : tick) (fact0 : tick'eq a b1), a = b1.
Definition lt (tick1 : tick) (tick2 : tick) := v tick1 < v tick2.
Definition sorted (s : list tick) := ∀(i : Z) (j : Z), 0%Z ≤ i ∧ i < j ∧ j < Z.of_nat (length s) -> lt (nth (Z.to_nat i) s inhabitant) (nth (Z.to_nat j) s inhabitant).
Definition consecutive (l : list tick) := ∀(i : Z), 0%Z < i ∧ i < Z.of_nat (length l) -> v (nth (Z.to_nat i) l inhabitant) = v (nth (Z.to_nat (i - 1%Z)) l inhabitant) + 1%Z.
Definition last (l : list tick) : option tick := if decide (Z.of_nat (length l) = 0%Z) then None else Some (nth (Z.to_nat (Z.of_nat (length l) - 1%Z)) l inhabitant).
Theorem consecutive_last_push'vc (l : list tick) (x : tick) (fact0 : consecutive l) (fact1 : match last l with | None => True | Some y => v x = v y + 1%Z end) : consecutive (l ++ cons x ([] : list tick)).
Admitted.
