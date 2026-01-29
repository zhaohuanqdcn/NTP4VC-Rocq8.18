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
Require Import Why3.int.Fibonacci.
Require Import fibonacci_vcg.fibonacci.Mat22.
Open Scope Z_scope.
Theorem logfib'vc (n : Z) (fact0 : 0%Z ≤ n) : (¬ n = 0%Z -> ¬ 2%Z = 0%Z ∧ (let o1 : Z := Z.rem n 2%Z in ((0%Z ≤ n ∧ o1 < n) ∧ 0%Z ≤ o1) ∧ (∀(a : Z) (b : Z), power (t'mk 1%Z 1%Z 1%Z 0%Z) o1 = t'mk (a + b) b b a -> ¬ 2%Z = 0%Z))) ∧ (∀(a : Z) (b : Z), (if decide (n = 0%Z) then a = 1%Z ∧ b = 0%Z else ∃(a1 : Z) (b1 : Z), power (t'mk 1%Z 1%Z 1%Z 0%Z) (Z.rem n 2%Z) = t'mk (a1 + b1) b1 b1 a1 ∧ (let c : Z := a1 + b1 in if decide (Z.quot n 2%Z = 0%Z) then a = a1 * a1 + b1 * b1 ∧ b = b1 * (a1 + c) else a = b1 * (a1 + c) ∧ b = c * c + b1 * b1)) -> power (t'mk 1%Z 1%Z 1%Z 0%Z) n = t'mk (a + b) b b a).
Proof.
Admitted.
