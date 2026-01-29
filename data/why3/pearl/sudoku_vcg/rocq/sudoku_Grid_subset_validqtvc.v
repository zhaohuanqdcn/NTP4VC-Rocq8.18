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
Open Scope Z_scope.
Axiom grid : Type.
Axiom grid_inhabited : Inhabited grid.
Global Existing Instance grid_inhabited.
Axiom grid_countable : Countable grid.
Global Existing Instance grid_countable.
Definition is_index (i : Z) := 0%Z ≤ i ∧ i < 81%Z.
Definition valid_values (g : Z -> Z) := ∀(i : Z), is_index i -> 0%Z ≤ g i ∧ g i ≤ 9%Z.
Definition grid_eq_sub (g1 : Z -> Z) (g2 : Z -> Z) (a : Z) (b : Z) := ∀(j : Z), a ≤ j ∧ j < b -> g1 j = g2 j.
Inductive sudoku_chunks :=
  | sudoku_chunks'mk : list Z -> list Z -> list Z -> list Z -> list Z -> list Z -> sudoku_chunks.
Axiom sudoku_chunks_inhabited : Inhabited sudoku_chunks.
Global Existing Instance sudoku_chunks_inhabited.
Axiom sudoku_chunks_countable : Countable sudoku_chunks.
Global Existing Instance sudoku_chunks_countable.
Definition column_start (x : sudoku_chunks) := match x with |  sudoku_chunks'mk a _ _ _ _ _ => a end.
Definition column_offsets (x : sudoku_chunks) := match x with |  sudoku_chunks'mk _ a _ _ _ _ => a end.
Definition row_start (x : sudoku_chunks) := match x with |  sudoku_chunks'mk _ _ a _ _ _ => a end.
Definition row_offsets (x : sudoku_chunks) := match x with |  sudoku_chunks'mk _ _ _ a _ _ => a end.
Definition square_start (x : sudoku_chunks) := match x with |  sudoku_chunks'mk _ _ _ _ a _ => a end.
Definition square_offsets (x : sudoku_chunks) := match x with |  sudoku_chunks'mk _ _ _ _ _ a => a end.
Definition chunk_valid_indexes (start : list Z) (offsets : list Z) := Z.of_nat (length start) = 81%Z ∧ Z.of_nat (length offsets) = 9%Z ∧ (∀(i : Z) (o1 : Z), is_index i ∧ 0%Z ≤ o1 ∧ o1 < 9%Z -> is_index (nth (Z.to_nat i) start inhabitant + nth (Z.to_nat o1) offsets inhabitant)).
Definition disjoint_chunks (start : list Z) (offsets : list Z) := Z.of_nat (length start) = 81%Z ∧ Z.of_nat (length offsets) = 9%Z ∧ (∀(i1 : Z) (i2 : Z) (o1 : Z), is_index i1 ∧ is_index i2 ∧ 0%Z ≤ o1 ∧ o1 < 9%Z -> (let s2 : Z := nth (Z.to_nat i2) start inhabitant in ¬ nth (Z.to_nat i1) start inhabitant = s2 -> ¬ i1 = s2 + nth (Z.to_nat o1) offsets inhabitant)).
Definition well_formed_sudoku (s : sudoku_chunks) := chunk_valid_indexes (column_start s) (column_offsets s) ∧ chunk_valid_indexes (row_start s) (row_offsets s) ∧ chunk_valid_indexes (square_start s) (square_offsets s) ∧ disjoint_chunks (column_start s) (column_offsets s) ∧ disjoint_chunks (row_start s) (row_offsets s) ∧ disjoint_chunks (square_start s) (square_offsets s).
Definition valid_chunk (g : Z -> Z) (i : Z) (start : list Z) (offsets : list Z) := let s : Z := nth (Z.to_nat i) start inhabitant in ∀(o1 : Z) (o2 : Z), (0%Z ≤ o1 ∧ o1 < 9%Z) ∧ (0%Z ≤ o2 ∧ o2 < 9%Z) ∧ ¬ o1 = o2 -> (let i1 : Z := s + nth (Z.to_nat o1) offsets inhabitant in let i2 : Z := s + nth (Z.to_nat o2) offsets inhabitant in (1%Z ≤ g i1 ∧ g i1 ≤ 9%Z) ∧ 1%Z ≤ g i2 ∧ g i2 ≤ 9%Z -> ¬ g i1 = g i2).
Definition valid_column (s : sudoku_chunks) (g : Z -> Z) (i : Z) := valid_chunk g i (column_start s) (column_offsets s).
Definition valid_row (s : sudoku_chunks) (g : Z -> Z) (i : Z) := valid_chunk g i (row_start s) (row_offsets s).
Definition valid_square (s : sudoku_chunks) (g : Z -> Z) (i : Z) := valid_chunk g i (square_start s) (square_offsets s).
Definition valid (s : sudoku_chunks) (g : Z -> Z) := ∀(i : Z), is_index i -> valid_column s g i ∧ valid_row s g i ∧ valid_square s g i.
Definition full (g : Z -> Z) := ∀(i : Z), is_index i -> 1%Z ≤ g i ∧ g i ≤ 9%Z.
Definition included (g1 : Z -> Z) (g2 : Z -> Z) := ∀(i : Z), is_index i ∧ 1%Z ≤ g1 i ∧ g1 i ≤ 9%Z -> g2 i = g1 i.
Theorem subset_valid'vc (s : sudoku_chunks) (g : Z -> Z) (h : Z -> Z) (fact0 : well_formed_sudoku s) (fact1 : included g h) (fact2 : valid s h) : valid s g.
Proof.
Admitted.
