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
Open Scope Z_scope.
Definition is_board (board : array63 (bv 63%N)) (pos : Z) := ∀(q : Z), 0%Z ≤ q ∧ q < pos -> 0%Z ≤ bv_signed (nth (Z.to_nat q) (array63_elts board) inhabitant) ∧ bv_signed (nth (Z.to_nat q) (array63_elts board) inhabitant) < bv_signed (array63_length board).
Theorem check_is_consistent'vc (pos : bv 63%N) (board : array63 (bv 63%N)) (fact0 : 0%Z ≤ bv_signed pos) (fact1 : bv_signed pos < bv_signed (array63_length board)) (fact2 : is_board board (bv_signed pos + 1%Z)) : 0%Z ≤ 0%Z ∧ 0%Z ≤ bv_signed pos ∧ is_board board (bv_signed pos + 1%Z) ∧ (∀(q : bv 63%N), (0%Z ≤ bv_signed q ∧ bv_signed q ≤ bv_signed pos) ∧ is_board board (bv_signed pos + 1%Z) -> bv_signed q < bv_signed pos -> (0%Z ≤ bv_signed q ∧ bv_signed q < bv_signed (array63_length board)) ∧ (let bq : bv 63%N := nth (Z.to_nat (bv_signed q)) (array63_elts board) inhabitant in (0%Z ≤ bv_signed pos ∧ bv_signed pos < bv_signed (array63_length board)) ∧ (let bpos : bv 63%N := nth (Z.to_nat (bv_signed pos)) (array63_elts board) inhabitant in (bv_signed bq = bv_signed bpos -> bq = bpos) -> ¬ bq = bpos -> int'63_in_bounds (bv_signed pos - bv_signed q) ∧ (∀(o1 : bv 63%N), bv_signed o1 = bv_signed pos - bv_signed q -> int'63_in_bounds (bv_signed bq - bv_signed bpos) ∧ (∀(o2 : bv 63%N), bv_signed o2 = bv_signed bq - bv_signed bpos -> (bv_signed o2 = bv_signed o1 -> o2 = o1) -> ¬ o2 = o1 -> int'63_in_bounds (bv_signed pos - bv_signed q) ∧ (∀(o3 : bv 63%N), bv_signed o3 = bv_signed pos - bv_signed q -> int'63_in_bounds (bv_signed bpos - bv_signed bq) ∧ (∀(o4 : bv 63%N), bv_signed o4 = bv_signed bpos - bv_signed bq -> (bv_signed o4 = bv_signed o3 -> o4 = o3) -> ¬ o4 = o3 -> int'63_in_bounds (bv_signed q + 1%Z) ∧ (∀(o5 : bv 63%N), bv_signed o5 = bv_signed q + 1%Z -> (0%Z ≤ bv_signed pos - bv_signed q ∧ bv_signed pos - bv_signed o5 < bv_signed pos - bv_signed q) ∧ (0%Z ≤ bv_signed o5 ∧ bv_signed o5 ≤ bv_signed pos) ∧ is_board board (bv_signed pos + 1%Z))))))))).
Admitted.
