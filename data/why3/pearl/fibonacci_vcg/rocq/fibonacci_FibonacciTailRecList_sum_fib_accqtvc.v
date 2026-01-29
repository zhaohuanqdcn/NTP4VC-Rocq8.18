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
Open Scope Z_scope.
Axiom sum_fib : list Z -> Z.
Axiom sum_fib'def : forall  (l : list Z) (fact0 : ∀(n : Z), n ∈ l -> 0%Z ≤ n), match l with | [] => sum_fib l = 0%Z | cons x r => sum_fib l = fib x + sum_fib r end.
Axiom sum_pow : list Z -> Z.
Axiom sum_pow'def : forall  (l : list Z) (fact0 : ∀(n : Z), n ∈ l -> 0%Z ≤ n), match l with | [] => sum_pow l = 0%Z | cons x r => sum_pow l = Z.pow 2%Z x + sum_pow r end.
Axiom sum_pow'spec : forall  (l : list Z) (fact0 : ∀(n : Z), n ∈ l -> 0%Z ≤ n), 0%Z ≤ sum_pow l.
Theorem sum_fib_acc'vc (l : list Z) (acc : Z) (fact0 : ∀(n : Z), n ∈ l -> 0%Z ≤ n) : (match l with | [] => True | cons n r => (if decide (n ≤ 1%Z) then (0%Z ≤ sum_pow l ∧ sum_pow r < sum_pow l) ∧ (∀(n1 : Z), n1 ∈ r -> 0%Z ≤ n1) else let l2 : list Z := cons (n - 1%Z) (cons (n - 2%Z) r) in (0%Z ≤ sum_pow l ∧ sum_pow l2 < sum_pow l) ∧ (∀(n1 : Z), n1 ∈ l2 -> 0%Z ≤ n1)) end) ∧ (∀(result : Z), (match l with | [] => result = acc | cons n r => (if decide (n ≤ 1%Z) then result = acc + n + sum_fib r else result = acc + sum_fib (cons (n - 1%Z) (cons (n - 2%Z) r))) end) -> result = acc + sum_fib l).
Proof.
Admitted.
