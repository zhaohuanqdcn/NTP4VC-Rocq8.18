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
Theorem block_mul_ij'vc (a : mat Z) (b : mat Z) (a1 : mat Z) (b1 : mat Z) (k : Z) (a2 : mat Z) (b2 : mat Z) (fact0 : cols a = rows b) (fact1 : cols a1 = rows b1) (fact2 : 0%Z ≤ k) (fact3 : k ≤ cols a) (fact4 : c_blocks a a1 a2) (fact5 : r_blocks b b1 b2) : (∀(i : Z) (j : Z), 0%Z ≤ i ∧ i < rows a -> 0%Z ≤ j ∧ j < cols b -> 0%Z ≤ k ∧ k ≤ cols a1 -> sum (mul_atom a b i j) 0%Z k = sum (mul_atom a1 b1 i j) 0%Z k) ∧ (∀(i : Z) (j : Z), 0%Z ≤ i ∧ i < rows a -> 0%Z ≤ j ∧ j < cols b -> cols a1 ≤ k ∧ k ≤ cols a -> sum (mul_atom a b i j) 0%Z k = sum (mul_atom a1 b1 i j) 0%Z (cols a1) + sum (mul_atom a2 b2 i j) 0%Z (k - cols a1)).
Admitted.
