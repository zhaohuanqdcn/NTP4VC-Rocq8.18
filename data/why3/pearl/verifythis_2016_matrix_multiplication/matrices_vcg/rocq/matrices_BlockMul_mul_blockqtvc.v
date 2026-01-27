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
Require Import verifythis_2016_matrix_multiplication.matrices.MyMatrix.
Require Import verifythis_2016_matrix_multiplication.matrices.MatrixArithmetic.
Require Import verifythis_2016_matrix_multiplication.sum_extended.Sum_extended.
Open Scope Z_scope.
Axiom ofs2 : mat Z -> Z -> Z -> Z -> Z -> Z.
Axiom ofs2'def : forall  (a : mat Z) (ai : Z) (aj : Z) (i : Z) (j : Z), ofs2 a ai aj i j = get a (ai + i) (aj + j).
Definition block (a : mat Z) (r : Z) (dr : Z) (c : Z) (dc : Z) : mat Z := create dr dc (ofs2 a r c).
Definition c_blocks (a : mat Z) (a1 : mat Z) (a2 : mat Z) := (0%Z ≤ cols a1 ∧ cols a1 ≤ cols a) ∧ a1 = block a 0%Z (rows a) 0%Z (cols a1) ∧ a2 = block a 0%Z (rows a) (cols a1) (cols a - cols a1).
Definition r_blocks (a : mat Z) (a1 : mat Z) (a2 : mat Z) := (0%Z ≤ rows a1 ∧ rows a1 ≤ rows a) ∧ a1 = block a 0%Z (rows a1) 0%Z (cols a) ∧ a2 = block a (rows a1) (rows a - rows a1) 0%Z (cols a).
Theorem mul_block'vc (a : mat Z) (b : mat Z) (r : Z) (dr : Z) (c : Z) (dc : Z) (fact0 : cols a = rows b) (fact1 : 0%Z ≤ r) (fact2 : r ≤ r + dr) (fact3 : r + dr ≤ rows a) (fact4 : 0%Z ≤ c) (fact5 : c ≤ c + dc) (fact6 : c + dc ≤ cols b) : block (mul a b) r dr c dc = mul (block a r dr 0%Z (cols a)) (block b 0%Z (rows b) c dc).
Admitted.
