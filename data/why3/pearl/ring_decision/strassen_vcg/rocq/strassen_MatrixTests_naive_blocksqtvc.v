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
Require Import Why3.int.Sum.
Require Import ring_decision.strassen.Sum_extended.
Require Import ring_decision.strassen.MaxFun.
Require Import ring_decision.strassen.InfIntMatrix.
Require Import ring_decision.strassen.InfIntMatrixDecision.
Open Scope Z_scope.
Axiom cols : mat -> Z.
Axiom rows : mat -> Z.
Axiom rows_def : forall  (r : Z) (c : Z) (a : mat) (fact0 : 0%Z ≤ r) (fact1 : 0%Z ≤ c) (fact2 : InfIntMatrix.size a r c), rows a = r.
Axiom cols_def : forall  (r : Z) (c : Z) (a : mat) (fact0 : 0%Z ≤ r) (fact1 : 0%Z ≤ c) (fact2 : InfIntMatrix.size a r c), cols a = c.
Definition is_finite (m : mat) := InfIntMatrix.size m (rows m) (cols m).
Axiom ofs2 : mat -> Z -> Z -> Z -> Z -> Z.
Axiom ofs2'def : forall  (a : mat) (ai : Z) (aj : Z) (i : Z) (j : Z), ofs2 a ai aj i j = get a (ai + i) (aj + j).
Definition block (a : mat) (r : Z) (dr : Z) (c : Z) (dc : Z) : mat := fcreate dr dc (ofs2 a r c).
Definition c_blocks (a : mat) (a1 : mat) (a2 : mat) := (0%Z ≤ cols a1 ∧ cols a1 ≤ cols a) ∧ a1 = block a 0%Z (rows a) 0%Z (cols a1) ∧ a2 = block a 0%Z (rows a) (cols a1) (cols a - cols a1).
Definition r_blocks (a : mat) (a1 : mat) (a2 : mat) := (0%Z ≤ rows a1 ∧ rows a1 ≤ rows a) ∧ a1 = block a 0%Z (rows a1) 0%Z (cols a) ∧ a2 = block a (rows a1) (rows a - rows a1) 0%Z (cols a).
Definition quarters (a : mat) (a11 : mat) (a12 : mat) (a21 : mat) (a22 : mat) := (is_finite a ∧ is_finite a11 ∧ is_finite a12 ∧ is_finite a21 ∧ is_finite a22) ∧ (rows a11 = rows a12 ∧ rows a12 = rows a21 ∧ rows a21 = rows a22 ∧ rows a22 = cols a11 ∧ cols a11 = cols a12 ∧ cols a12 = cols a21 ∧ cols a21 = cols a22) ∧ (rows a = cols a ∧ cols a = 2%Z * rows a11) ∧ a11 = block a 0%Z (rows a11) 0%Z (cols a11) ∧ a12 = block a 0%Z (rows a11) (cols a11) (cols a11) ∧ a21 = block a (rows a11) (rows a11) 0%Z (cols a11) ∧ a22 = block a (rows a11) (rows a11) (cols a11) (cols a11).
Theorem naive_blocks'vc (a : mat) (b : mat) (c : mat) (a11 : mat) (a12 : mat) (a21 : mat) (a22 : mat) (b11 : mat) (b12 : mat) (b21 : mat) (b22 : mat) (fact0 : is_finite a) (fact1 : is_finite b) (fact2 : is_finite c) (fact3 : quarters a a11 a12 a21 a22) (fact4 : quarters b b11 b12 b21 b22) (fact5 : quarters c (add (mul a11 b11) (mul a12 b21)) (add (mul a11 b12) (mul a12 b22)) (add (mul a21 b11) (mul a22 b21)) (add (mul a21 b12) (mul a22 b22))) : c = mul a b.
Admitted.
