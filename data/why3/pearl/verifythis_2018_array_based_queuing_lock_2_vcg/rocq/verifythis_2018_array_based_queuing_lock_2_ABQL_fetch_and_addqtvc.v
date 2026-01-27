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
Theorem fetch_and_add'vc (r : tick) : let o1 : Z := v r + 1%Z in let o2 : Z := k * n in ¬ o2 = 0%Z ∧ (let o3 : Z := ZEuclid.modulo (b r + 1%Z) o2 in (0%Z ≤ o1 ∧ (0%Z ≤ o3 ∧ o3 < k * n) ∧ o3 = ZEuclid.modulo o1 (k * n)) ∧ (∀(o4 : tick), b o4 = o3 ∧ v o4 = o1 -> v o4 = v r + 1%Z)).
Admitted.
