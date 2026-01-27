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
Require Import Why3.int.Fibonacci.
Open Scope Z_scope.
Theorem fib_aux'vc (k : Z) (n : Z) (fact0 : 0%Z ≤ k) (fact1 : 0%Z ≤ n) : (¬ k = 0%Z -> (let o1 : Z := k - 1%Z in let o2 : Z := n + 1%Z in (0%Z ≤ k ∧ o1 < k) ∧ 0%Z ≤ o1 ∧ 0%Z ≤ o2 ∧ fib (n + 1%Z) = fib o2 ∧ fib n + fib (n + 1%Z) = fib (o2 + 1%Z))) ∧ (∀(result : Z), (if decide (k = 0%Z) then result = fib n else result = fib (n + 1%Z + (k - 1%Z))) -> result = fib (n + k)).
Admitted.
