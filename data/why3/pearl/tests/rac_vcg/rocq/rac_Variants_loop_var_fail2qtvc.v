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
Open Scope Z_scope.
Theorem loop_var_fail2'vc (j : Z) (i : Z) (fact0 : 0%Z ≤ j) : if decide (0%Z < i) then 0%Z ≤ i ∧ i - 1%Z < i ∨ i = i - 1%Z ∧ 0%Z ≤ j ∧ j < j else if decide (1%Z < j) then 0%Z ≤ i ∧ i < i ∨ 0%Z ≤ j ∧ j - 1%Z < j else 0%Z ≤ i ∧ i < i ∨ 0%Z ≤ j ∧ j < j.
Proof.
Admitted.
