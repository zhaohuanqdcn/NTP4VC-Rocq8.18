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
Require Import sudoku_vcg.sudoku.Grid.
Open Scope Z_scope.
Definition valid_chunk_up_to (g : Z -> Z) (i : Z) (start : list Z) (offsets : list Z) (off : Z) := let s : Z := nth (Z.to_nat i) start inhabitant in ∀(o1 : Z) (o2 : Z), (0%Z ≤ o1 ∧ o1 < off) ∧ (0%Z ≤ o2 ∧ o2 < off) ∧ ¬ o1 = o2 -> (let i1 : Z := s + nth (Z.to_nat o1) offsets inhabitant in let i2 : Z := s + nth (Z.to_nat o2) offsets inhabitant in (1%Z ≤ g i1 ∧ g i1 ≤ 9%Z) ∧ 1%Z ≤ g i2 ∧ g i2 ≤ 9%Z -> ¬ g i1 = g i2).
Definition valid_up_to (s : sudoku_chunks) (g : Z -> Z) (i : Z) := ∀(j : Z), 0%Z ≤ j ∧ j < i -> valid_column s g j ∧ valid_row s g j ∧ valid_square s g j.
Theorem check_valid'vc (s : sudoku_chunks) (g : list Z) (fact0 : well_formed_sudoku s) (fact1 : Z.of_nat (length g) = 81%Z) (fact2 : valid_values (nth_i g)) : (0%Z ≤ 80%Z + 1%Z -> valid_up_to s (nth_i g) 0%Z ∧ (∀(i : Z), (0%Z ≤ i ∧ i ≤ 80%Z) ∧ valid_up_to s (nth_i g) i -> (let o1 : list Z := column_offsets s in let o2 : list Z := column_start s in (Z.of_nat (length g) = 81%Z ∧ valid_values (nth_i g) ∧ is_index i ∧ chunk_valid_indexes o2 o1) ∧ (valid_chunk (nth_i g) i o2 o1 -> (let o3 : list Z := row_offsets s in let o4 : list Z := row_start s in (Z.of_nat (length g) = 81%Z ∧ valid_values (nth_i g) ∧ is_index i ∧ chunk_valid_indexes o4 o3) ∧ (valid_chunk (nth_i g) i o4 o3 -> (let o5 : list Z := square_offsets s in let o6 : list Z := square_start s in (Z.of_nat (length g) = 81%Z ∧ valid_values (nth_i g) ∧ is_index i ∧ chunk_valid_indexes o6 o5) ∧ (valid_chunk (nth_i g) i o6 o5 -> valid_up_to s (nth_i g) (i + 1%Z)) ∧ (¬ valid_chunk (nth_i g) i o6 o5 -> ¬ valid s (nth_i g)))) ∧ (¬ valid_chunk (nth_i g) i o4 o3 -> ¬ valid s (nth_i g)))) ∧ (¬ valid_chunk (nth_i g) i o2 o1 -> ¬ valid s (nth_i g)))) ∧ (valid_up_to s (nth_i g) (80%Z + 1%Z) -> valid s (nth_i g))) ∧ (80%Z + 1%Z < 0%Z -> valid s (nth_i g)).
Proof.
Admitted.
