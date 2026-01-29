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
Open Scope Z_scope.
Definition zero_at (l : list Z) (i : Z) := nth_error_i l i = Some 0%Z ∧ (∀(j : Z), 0%Z ≤ j ∧ j < i -> ¬ nth_error_i l j = Some 0%Z).
Definition no_zero (l : list Z) := ∀(j : Z), 0%Z ≤ j ∧ j < Z.of_nat (length l) -> ¬ nth_error_i l j = Some 0%Z.
Theorem search'vc (l : list Z) (i : Z) : (match l with | [] => True | cons x r => ¬ x = 0%Z -> (match l with | [] => False | cons _ f => f = r end) end) ∧ (∀(result : Z), (match l with | [] => result = i | cons x r => (if decide (x = 0%Z) then result = i else let o1 : Z := i + 1%Z in (o1 ≤ result ∧ result < o1 + Z.of_nat (length r)) ∧ zero_at r (result - o1) ∨ result = o1 + Z.of_nat (length r) ∧ no_zero r) end) -> (i ≤ result ∧ result < i + Z.of_nat (length l)) ∧ zero_at l (result - i) ∨ result = i + Z.of_nat (length l) ∧ no_zero l).
Proof.
Admitted.
