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
Axiom infix_sl : Z -> Z -> Z.
Axiom infix_sl'def : forall  (y : Z) (x : Z) (fact0 : ¬ y = 0%Z), infix_sl x y = ZEuclid.div x y.
Axiom comb : Z -> Z -> Z.
Axiom comb'def : forall  (k : Z) (n : Z) (fact0 : 0%Z ≤ k) (fact1 : k ≤ n), if decide (k = 0%Z ∨ k = n) then comb n k = 1%Z else comb n k = comb (n - 1%Z) k + comb (n - 1%Z) (k - 1%Z).
Axiom comb'spec : forall  (k : Z) (n : Z) (fact0 : 0%Z ≤ k) (fact1 : k ≤ n), 1%Z ≤ comb n k.
Theorem prop1'vc (k : Z) (n : Z) (fact0 : 0%Z ≤ k) (fact1 : k ≤ n) : comb n (n - k) = comb n k.
Proof.
Admitted.
