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
Theorem slow_addition'vc (x : Z) (z1 : Z) (fact0 : 0%Z ≤ x) : 0%Z ≤ x ∧ (∀(z : Z) (x1 : Z), 0%Z ≤ x1 ∧ z + x1 = z1 + x -> (if decide (¬ x1 = 0%Z) then (0%Z ≤ x1 ∧ x1 - 1%Z < x1) ∧ 0%Z ≤ x1 - 1%Z ∧ z + 1%Z + (x1 - 1%Z) = z1 + x else z = z1 + x)).
Proof.
Admitted.
