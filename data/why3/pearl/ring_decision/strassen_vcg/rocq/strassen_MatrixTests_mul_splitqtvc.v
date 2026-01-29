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
Theorem mul_split'vc (a : mat) (b : mat) (a1 : mat) (b1 : mat) (a2 : mat) (b2 : mat) (fact0 : is_finite a) (fact1 : is_finite b) (fact2 : cols a = rows b) (fact3 : cols a1 = rows b1) (fact4 : 0%Z < rows a) (fact5 : 0%Z < cols a) (fact6 : 0%Z < cols b) (fact7 : 0%Z < cols a1) (fact8 : 0%Z < cols a2) (fact9 : c_blocks a a1 a2) (fact10 : r_blocks b b1 b2) : add (mul a1 b1) (mul a2 b2) = mul a b.
Proof.
Admitted.
