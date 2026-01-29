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
Require Import Why3.int.Fibonacci.
Open Scope Z_scope.
Theorem smallest_fib_above'vc (x : Z) (fact0 : 0%Z ≤ x) : 0%Z ≤ 0%Z ∧ 0%Z = fib 0%Z ∧ fib 0%Z ≤ x ∧ 1%Z = fib (0%Z + 1%Z) ∧ 0%Z ≤ 0%Z ∧ 1%Z ≤ 1%Z ∧ (∀(k : Z), (0%Z ≤ k ∧ fib k ≤ x) ∧ 0%Z ≤ fib k ∧ 1%Z ≤ fib (k + 1%Z) -> (if decide (fib (k + 1%Z) ≤ x) then (0%Z ≤ 2%Z * x - (fib k + fib (k + 1%Z)) ∧ 2%Z * x - (fib (k + 1%Z) + (fib k + fib (k + 1%Z))) < 2%Z * x - (fib k + fib (k + 1%Z))) ∧ (0%Z ≤ k + 1%Z ∧ fib (k + 1%Z) ≤ x ∧ fib k + fib (k + 1%Z) = fib (k + 1%Z + 1%Z)) ∧ 0%Z ≤ fib (k + 1%Z) ∧ 1%Z ≤ fib k + fib (k + 1%Z) else ∃(k1 : Z), 0%Z ≤ k1 ∧ fib k1 ≤ x ∧ x < fib (k1 + 1%Z) ∧ fib (k1 + 1%Z) = fib (k + 1%Z))).
Proof.
Admitted.
