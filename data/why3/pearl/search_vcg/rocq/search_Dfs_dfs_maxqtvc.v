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
Require Import search_vcg.search.Path.
Open Scope Z_scope.
Theorem dfs_max'vc (m : Z) (fact0 : 0%Z ≤ m) : let o1 : state := start in (0%Z ≤ 0%Z ∧ 0%Z ≤ m + 1%Z) ∧ (∀(o2 : outcome), (match o2 with | NoSolution => (∀(t : state) (n : Z), 0%Z ≤ n ∧ n ≤ m - 0%Z -> success t -> ¬ path o1 t n) | Solution t n => path o1 t n ∧ success t ∧ 0%Z ≤ n ∧ n ≤ m - 0%Z end) -> (match o2 with | NoSolution => (∀(t : state) (n : Z), 0%Z ≤ n ∧ n ≤ m -> success t -> ¬ path start t n) | Solution t n => path start t n ∧ n ≤ m end)).
Proof.
Admitted.
