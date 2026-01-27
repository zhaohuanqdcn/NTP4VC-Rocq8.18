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
Require Import sudoku_vcg.sudoku.Grid.
Open Scope Z_scope.
Definition valid_chunk_up_to (g : Z -> Z) (i : Z) (start : list Z) (offsets : list Z) (off : Z) := let s : Z := nth (Z.to_nat i) start inhabitant in ∀(o1 : Z) (o2 : Z), (0%Z ≤ o1 ∧ o1 < off) ∧ (0%Z ≤ o2 ∧ o2 < off) ∧ ¬ o1 = o2 -> (let i1 : Z := s + nth (Z.to_nat o1) offsets inhabitant in let i2 : Z := s + nth (Z.to_nat o2) offsets inhabitant in (1%Z ≤ g i1 ∧ g i1 ≤ 9%Z) ∧ 1%Z ≤ g i2 ∧ g i2 ≤ 9%Z -> ¬ g i1 = g i2).
Definition valid_up_to (s : sudoku_chunks) (g : Z -> Z) (i : Z) := ∀(j : Z), 0%Z ≤ j ∧ j < i -> valid_column s g j ∧ valid_row s g j ∧ valid_square s g j.
Definition full_up_to (g : Z -> Z) (i : Z) := ∀(j : Z), 0%Z ≤ j ∧ j < i -> 1%Z ≤ g j ∧ g j ≤ 9%Z.
Theorem valid_changed_chunks'vc (i1 : Z) (i2 : Z) (k : Z) (start : list Z) (g : Z -> Z) (offsets : list Z) (fact0 : is_index i1) (fact1 : is_index i2) (fact2 : 1%Z ≤ k) (fact3 : k ≤ 9%Z) (fact4 : nth (Z.to_nat i1) start inhabitant = nth (Z.to_nat i2) start inhabitant) (fact5 : valid_chunk (fun_updt g i1 k) i1 start offsets) : valid_chunk (fun_updt g i1 k) i2 start offsets.
Admitted.
