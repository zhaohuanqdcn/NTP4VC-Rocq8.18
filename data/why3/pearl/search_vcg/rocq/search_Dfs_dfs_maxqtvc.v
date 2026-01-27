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
Require Import search_vcg.search.Path.
Open Scope Z_scope.
Theorem dfs_max'vc (m : Z) (fact0 : 0%Z ≤ m) : let o1 : state := start in (0%Z ≤ 0%Z ∧ 0%Z ≤ m + 1%Z) ∧ (∀(o2 : outcome), (match o2 with | NoSolution => (∀(t : state) (n : Z), 0%Z ≤ n ∧ n ≤ m - 0%Z -> success t -> ¬ path o1 t n) | Solution t n => path o1 t n ∧ success t ∧ 0%Z ≤ n ∧ n ≤ m - 0%Z end) -> (match o2 with | NoSolution => (∀(t : state) (n : Z), 0%Z ≤ n ∧ n ≤ m -> success t -> ¬ path start t n) | Solution t n => path start t n ∧ n ≤ m end)).
Admitted.
