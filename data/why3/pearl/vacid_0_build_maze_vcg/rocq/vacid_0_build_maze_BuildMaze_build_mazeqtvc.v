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
Theorem build_maze'vc (n : Z) (graph : Graph_sig.graph) (fact0 : 1%Z ≤ n) (fact1 : ∀(x : Z) (y : Z), (x = y) = path graph x y) : let o1 : Z := n * n in 0%Z ≤ o1 ∧ (∀(u : uf), num (state u) = o1 ∧ UnionFind_pure.size (state u) = o1 ∧ (∀(x : Z), 0%Z ≤ x ∧ x < o1 -> repr (state u) x x) -> (1%Z ≤ num (state u) ∧ (num (state u) + 0%Z = UnionFind_pure.size (state u) ∧ UnionFind_pure.size (state u) = n * n) ∧ (∀(x : Z) (y : Z), 0%Z ≤ x ∧ x < n * n -> 0%Z ≤ y ∧ y < n * n -> same (state u) x y = path graph x y)) ∧ (∀(u1 : uf) (num_edges : Z) (graph1 : Graph_sig.graph), 1%Z ≤ num (state u1) ∧ (num (state u1) + num_edges = UnionFind_pure.size (state u1) ∧ UnionFind_pure.size (state u1) = n * n) ∧ (∀(x : Z) (y : Z), 0%Z ≤ x ∧ x < n * n -> 0%Z ≤ y ∧ y < n * n -> same (state u1) x y = path graph1 x y) -> (if decide (1%Z < num (state u1)) then 0%Z < n ∧ (∀(x : Z), 0%Z ≤ x ∧ x < n -> 0%Z < n ∧ (∀(y : Z), 0%Z ≤ y ∧ y < n -> 0%Z < 2%Z ∧ (∀(d : Z), 0%Z ≤ d ∧ d < 2%Z -> (∀(w : Z), (if decide (d = 0%Z) then w = x + 1%Z else w = x) -> (∀(z : Z), (if decide (d = 0%Z) then z = y else z = y + 1%Z) -> (∀(o2 : bool), (if decide (w < n) then o2 = (if decide (z < n) then true else false) else o2 = false) -> (if decide (o2 = true) then let a : Z := y * n + x in let b : Z := w * n + z in (0%Z ≤ b ∧ b < UnionFind_pure.size (state u1)) ∧ (∀(u2 : uf) (o3 : Z), repr (state u2) b o3 ∧ UnionFind_pure.size (state u2) = UnionFind_pure.size (state u1) ∧ num (state u2) = num (state u1) ∧ same_reprs (state u2) (state u1) -> (0%Z ≤ a ∧ a < UnionFind_pure.size (state u2)) ∧ (∀(u3 : uf) (o4 : Z), repr (state u3) a o4 ∧ UnionFind_pure.size (state u3) = UnionFind_pure.size (state u2) ∧ num (state u3) = num (state u2) ∧ same_reprs (state u3) (state u2) -> (if decide (¬ o4 = o3) then ((0%Z ≤ a ∧ a < UnionFind_pure.size (state u3)) ∧ (0%Z ≤ b ∧ b < UnionFind_pure.size (state u3)) ∧ ¬ same (state u3) a b ∧ ¬ path graph1 a b ∧ (∀(x1 : Z) (y1 : Z), 0%Z ≤ x1 ∧ x1 < UnionFind_pure.size (state u3) -> 0%Z ≤ y1 ∧ y1 < UnionFind_pure.size (state u3) -> same (state u3) x1 y1 = path graph1 x1 y1)) ∧ (∀(u4 : uf) (graph2 : Graph_sig.graph), same (state u4) a b ∧ UnionFind_pure.size (state u4) = UnionFind_pure.size (state u3) ∧ num (state u4) = num (state u3) - 1%Z ∧ (∀(x1 : Z) (y1 : Z), 0%Z ≤ x1 ∧ x1 < UnionFind_pure.size (state u4) -> 0%Z ≤ y1 ∧ y1 < UnionFind_pure.size (state u4) -> same (state u4) x1 y1 = path graph2 x1 y1) -> 1%Z ≤ num (state u4) ∧ (num (state u4) + (num_edges + 1%Z) = UnionFind_pure.size (state u4) ∧ UnionFind_pure.size (state u4) = n * n) ∧ (∀(x1 : Z) (y1 : Z), 0%Z ≤ x1 ∧ x1 < n * n -> 0%Z ≤ y1 ∧ y1 < n * n -> same (state u4) x1 y1 = path graph2 x1 y1)) else 1%Z ≤ num (state u3) ∧ (num (state u3) + num_edges = UnionFind_pure.size (state u3) ∧ UnionFind_pure.size (state u3) = n * n) ∧ (∀(x1 : Z) (y1 : Z), 0%Z ≤ x1 ∧ x1 < n * n -> 0%Z ≤ y1 ∧ y1 < n * n -> same (state u3) x1 y1 = path graph1 x1 y1)))) else 1%Z ≤ num (state u1) ∧ (num (state u1) + num_edges = UnionFind_pure.size (state u1) ∧ UnionFind_pure.size (state u1) = n * n) ∧ (∀(x1 : Z) (y1 : Z), 0%Z ≤ x1 ∧ x1 < n * n -> 0%Z ≤ y1 ∧ y1 < n * n -> same (state u1) x1 y1 = path graph1 x1 y1)))))))) else num_edges = n * n - 1%Z ∧ (∀(x : Z) (y : Z), 0%Z ≤ x ∧ x < n * n -> 0%Z ≤ y ∧ y < n * n -> path graph1 x y)))).
Proof.
Admitted.
