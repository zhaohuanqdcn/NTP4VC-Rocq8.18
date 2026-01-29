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
Definition full_up_to (g : Z -> Z) (i : Z) := ∀(j : Z), 0%Z ≤ j ∧ j < i -> 1%Z ≤ g j ∧ g j ≤ 9%Z.
Theorem solve'vc (s : sudoku_chunks) (g : list Z) (fact0 : well_formed_sudoku s) (fact1 : Z.of_nat (length g) = 81%Z) (fact2 : valid_values (nth_i g)) : well_formed_sudoku s ∧ Z.of_nat (length g) = 81%Z ∧ valid_values (nth_i g) ∧ 0%Z ≤ 0%Z ∧ 0%Z ≤ 81%Z ∧ valid_up_to s (nth_i g) 0%Z ∧ full_up_to (nth_i g) 0%Z ∧ (∀(g1 : list Z), length g1 = length g -> grid_eq_sub (nth_i g) (nth_i g1) 0%Z 81%Z ∧ (∀(h : Z -> Z), included (nth_i g1) h ∧ full h -> ¬ valid s h) -> (∀(h : Z -> Z), included (nth_i g1) h ∧ full h -> ¬ valid s h)).
Proof.
Admitted.
