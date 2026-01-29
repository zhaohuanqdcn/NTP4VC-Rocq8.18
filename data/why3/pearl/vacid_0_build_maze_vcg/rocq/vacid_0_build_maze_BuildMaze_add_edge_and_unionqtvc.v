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
Theorem add_edge_and_union'vc (a : Z) (u : uf) (b : Z) (graph : Graph_sig.graph) (fact0 : 0%Z ≤ a) (fact1 : a < UnionFind_pure.size (state u)) (fact2 : 0%Z ≤ b) (fact3 : b < UnionFind_pure.size (state u)) (fact4 : ¬ same (state u) a b) (fact5 : ¬ path graph a b) (fact6 : ∀(x : Z) (y : Z), 0%Z ≤ x ∧ x < UnionFind_pure.size (state u) -> 0%Z ≤ y ∧ y < UnionFind_pure.size (state u) -> same (state u) x y = path graph x y) : ¬ path graph a b ∧ (∀(graph1 : Graph_sig.graph), (∀(x : Z) (y : Z), path graph1 x y = (path graph x y ∨ path graph x a ∧ path graph b y ∨ path graph x b ∧ path graph a y)) -> ((0%Z ≤ a ∧ a < UnionFind_pure.size (state u)) ∧ (0%Z ≤ b ∧ b < UnionFind_pure.size (state u)) ∧ ¬ same (state u) a b) ∧ (∀(u1 : uf), same (state u1) a b ∧ UnionFind_pure.size (state u1) = UnionFind_pure.size (state u) ∧ num (state u1) = num (state u) - 1%Z ∧ (∀(x : Z) (y : Z), 0%Z ≤ x ∧ x < UnionFind_pure.size (state u1) -> 0%Z ≤ y ∧ y < UnionFind_pure.size (state u1) -> same (state u1) x y = (same (state u) x y ∨ same (state u) x a ∧ same (state u) b y ∨ same (state u) x b ∧ same (state u) a y)) -> same (state u1) a b ∧ UnionFind_pure.size (state u1) = UnionFind_pure.size (state u) ∧ num (state u1) = num (state u) - 1%Z ∧ (∀(x : Z) (y : Z), 0%Z ≤ x ∧ x < UnionFind_pure.size (state u1) -> 0%Z ≤ y ∧ y < UnionFind_pure.size (state u1) -> same (state u1) x y = path graph1 x y))).
Proof.
Admitted.
