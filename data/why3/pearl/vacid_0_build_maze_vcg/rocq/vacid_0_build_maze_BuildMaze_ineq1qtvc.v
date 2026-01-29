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
Require Import vacid_0_build_maze_vcg.vacid_0_build_maze.UnionFind_pure.
Require Import vacid_0_build_maze_vcg.vacid_0_build_maze.UnionFind_sig.
Require Import vacid_0_build_maze_vcg.vacid_0_build_maze.Graph_sig.
Open Scope Z_scope.
Theorem ineq1'vc (n : Z) (x : Z) (y : Z) (fact0 : 0%Z ≤ n) (fact1 : 0%Z ≤ x) (fact2 : x < n) (fact3 : 0%Z ≤ y) (fact4 : y < n) : 0%Z ≤ x * n + y ∧ x * n + y < n * n.
Proof.
Admitted.
