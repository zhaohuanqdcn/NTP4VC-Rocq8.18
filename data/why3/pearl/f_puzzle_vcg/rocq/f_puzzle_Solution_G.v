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
Require Import f_puzzle_vcg.f_puzzle.Puzzle.
Require Import f_puzzle_vcg.f_puzzle.Step1.
Open Scope Z_scope.
Definition p' (k : Z) := ∀(n : Z) (m : Z), 0%Z ≤ n ∧ n ≤ m ∧ m ≤ k -> f n ≤ f m.
Axiom base : p' 0%Z.
Axiom induction_step : forall  (n : Z) (fact0 : 0%Z ≤ n) (fact1 : p' n), p' (n + 1%Z).
Axiom SimpleInduction : forall  (n : Z) (fact0 : 0%Z ≤ n), p' n.
Theorem G (n : Z) (fact0 : 0%Z ≤ n) : f n = n.
Proof.
Admitted.
