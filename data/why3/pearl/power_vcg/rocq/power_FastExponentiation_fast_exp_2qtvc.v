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
Theorem fast_exp_2'vc (n : Z) (acc : Z) (x : Z) (fact0 : 0%Z ≤ n) : (¬ n = 0%Z -> ¬ 2%Z = 0%Z ∧ (if decide (Z.quot n 2%Z = 0%Z) then ¬ 2%Z = 0%Z ∧ (let o1 : Z := Z.rem n 2%Z in (0%Z ≤ n ∧ o1 < n) ∧ 0%Z ≤ o1) else let o1 : Z := n - 1%Z in (0%Z ≤ n ∧ o1 < n) ∧ 0%Z ≤ o1)) ∧ (∀(result : Z), (if decide (n = 0%Z) then result = acc else if decide (Z.quot n 2%Z = 0%Z) then result = Z.pow (x * x) (Z.rem n 2%Z) * acc else result = Z.pow x (n - 1%Z) * (x * acc)) -> result = Z.pow x n * acc).
Proof.
Admitted.
