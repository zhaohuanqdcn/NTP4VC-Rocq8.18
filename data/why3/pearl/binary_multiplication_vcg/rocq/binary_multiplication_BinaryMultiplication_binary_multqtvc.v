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
Theorem binary_mult'vc (b : Z) (a : Z) (fact0 : 0%Z ≤ b) : 0%Z ≤ b ∧ 0%Z + a * b = a * b ∧ (∀(z : Z) (y : Z) (x : Z), 0%Z ≤ y ∧ z + x * y = a * b -> (if decide (¬ y = 0%Z) then ¬ 2%Z = 0%Z ∧ (if decide (Z.quot y 2%Z = 1%Z) then ¬ 2%Z = 0%Z ∧ (0%Z ≤ y ∧ Z.rem y 2%Z < y) ∧ 0%Z ≤ Z.rem y 2%Z ∧ z + x + 2%Z * x * Z.rem y 2%Z = a * b else ¬ 2%Z = 0%Z ∧ (0%Z ≤ y ∧ Z.rem y 2%Z < y) ∧ 0%Z ≤ Z.rem y 2%Z ∧ z + 2%Z * x * Z.rem y 2%Z = a * b) else z = a * b)).
Proof.
Admitted.
