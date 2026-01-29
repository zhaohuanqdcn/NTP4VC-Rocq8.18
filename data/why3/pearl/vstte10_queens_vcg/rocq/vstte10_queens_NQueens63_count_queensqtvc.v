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
Open Scope Z_scope.
Definition is_board (board : array63 (bv 63%N)) (pos : Z) := ∀(q : Z), 0%Z ≤ q ∧ q < pos -> 0%Z ≤ bv_signed (nth (Z.to_nat q) (array63_elts board) inhabitant) ∧ bv_signed (nth (Z.to_nat q) (array63_elts board) inhabitant) < bv_signed (array63_length board).
Theorem count_queens'vc (n : bv 63%N) (fact0 : 0%Z ≤ bv_signed n) : 0%Z ≤ bv_signed n ∧ (∀(board : array63 (bv 63%N)), (∀(i : Z), 0%Z ≤ i ∧ i < bv_signed n -> nth (Z.to_nat i) (array63_elts board) inhabitant = (0%bv : bv 63%N)) ∧ array63_length board = n -> array63_length board = n ∧ (0%Z ≤ 0%Z ∧ 0%Z ≤ bv_signed n) ∧ is_board board 0%Z).
Proof.
Admitted.
