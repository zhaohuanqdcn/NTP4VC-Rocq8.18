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
Require Import Why3.int.Fibonacci.
Open Scope Z_scope.
Theorem fib'vc (n : Z) (fact0 : 0%Z ≤ n) : let o1 : Z := n - 1%Z in (0%Z ≤ o1 + 1%Z -> ((0%Z ≤ 0%Z ∧ 0%Z ≤ n) ∧ fib (0%Z + 1%Z) = 1%Z ∧ fib 0%Z = 0%Z) ∧ (∀(x : Z) (y : Z), (∀(i : Z), (0%Z ≤ i ∧ i ≤ o1) ∧ (0%Z ≤ i ∧ i ≤ n) ∧ fib (i + 1%Z) = x ∧ fib i = y -> (0%Z ≤ i + 1%Z ∧ i + 1%Z ≤ n) ∧ fib (i + 1%Z + 1%Z) = x + y ∧ fib (i + 1%Z) = x) ∧ ((0%Z ≤ o1 + 1%Z ∧ o1 + 1%Z ≤ n) ∧ fib (o1 + 1%Z + 1%Z) = x ∧ fib (o1 + 1%Z) = y -> fib n = y))) ∧ (o1 + 1%Z < 0%Z -> fib n = 0%Z).
Admitted.
