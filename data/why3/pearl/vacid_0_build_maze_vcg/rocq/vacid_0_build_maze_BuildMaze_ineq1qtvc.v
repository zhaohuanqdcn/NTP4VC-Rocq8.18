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
Require Import vacid_0_build_maze_vcg.vacid_0_build_maze.UnionFind_pure.
Require Import vacid_0_build_maze_vcg.vacid_0_build_maze.UnionFind_sig.
Require Import vacid_0_build_maze_vcg.vacid_0_build_maze.Graph_sig.
Open Scope Z_scope.
Theorem ineq1'vc (n : Z) (x : Z) (y : Z) (fact0 : 0%Z ≤ n) (fact1 : 0%Z ≤ x) (fact2 : x < n) (fact3 : 0%Z ≤ y) (fact4 : y < n) : 0%Z ≤ x * n + y ∧ x * n + y < n * n.
Admitted.
