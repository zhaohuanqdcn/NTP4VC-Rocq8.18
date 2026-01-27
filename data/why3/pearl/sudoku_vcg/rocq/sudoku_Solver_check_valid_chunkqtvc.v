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
Theorem check_valid_chunk'vc (g : list Z) (i : Z) (start : list Z) (offsets : list Z) (fact0 : Z.of_nat (length g) = 81%Z) (fact1 : valid_values (nth_i g)) (fact2 : is_index i) (fact3 : chunk_valid_indexes start offsets) : 0%Z ≤ i ∧ i < Z.of_nat (length start) ∧ (let s : Z := nth (Z.to_nat i) start inhabitant in 0%Z ≤ 10%Z ∧ (∀(b : list bool), (∀(i1 : Z), 0%Z ≤ i1 ∧ i1 < 10%Z -> nth (Z.to_nat i1) b inhabitant = false) ∧ Z.of_nat (length b) = 10%Z -> (0%Z ≤ 8%Z + 1%Z -> (valid_chunk_up_to (nth_i g) i start offsets 0%Z ∧ (∀(o1 : Z), 0%Z ≤ o1 ∧ o1 < 0%Z -> (let v : Z := nth (Z.to_nat (s + nth (Z.to_nat o1) offsets inhabitant)) g inhabitant in 1%Z ≤ v ∧ v ≤ 9%Z -> nth (Z.to_nat v) b inhabitant = true)) ∧ (∀(j : Z), 1%Z ≤ j ∧ j ≤ 9%Z -> nth (Z.to_nat j) b inhabitant = true -> (∃(o1 : Z), (0%Z ≤ o1 ∧ o1 < 0%Z) ∧ nth_i g (s + nth (Z.to_nat o1) offsets inhabitant) = j))) ∧ (∀(b1 : list bool), length b1 = length b -> (∀(off : Z), (0%Z ≤ off ∧ off ≤ 8%Z) ∧ valid_chunk_up_to (nth_i g) i start offsets off ∧ (∀(o1 : Z), 0%Z ≤ o1 ∧ o1 < off -> (let v : Z := nth (Z.to_nat (s + nth (Z.to_nat o1) offsets inhabitant)) g inhabitant in 1%Z ≤ v ∧ v ≤ 9%Z -> nth (Z.to_nat v) b1 inhabitant = true)) ∧ (∀(j : Z), 1%Z ≤ j ∧ j ≤ 9%Z -> nth (Z.to_nat j) b1 inhabitant = true -> (∃(o1 : Z), (0%Z ≤ o1 ∧ o1 < off) ∧ nth_i g (s + nth (Z.to_nat o1) offsets inhabitant) = j)) -> (0%Z ≤ off ∧ off < Z.of_nat (length offsets)) ∧ (let o1 : Z := s + nth (Z.to_nat off) offsets inhabitant in (0%Z ≤ o1 ∧ o1 < Z.of_nat (length g)) ∧ (let v : Z := nth (Z.to_nat o1) g inhabitant in ∀(o2 : bool), (if decide (1%Z ≤ v) then o2 = (if decide (v ≤ 9%Z) then true else false) else o2 = false) -> (if decide (o2 = true) then (0%Z ≤ v ∧ v < Z.of_nat (length b1)) ∧ (if decide (nth (Z.to_nat v) b1 inhabitant = true) then ¬ valid_chunk (nth_i g) i start offsets else let o3 : bool := true in (0%Z ≤ v ∧ v < Z.of_nat (length b1)) ∧ (length (set_list b1 (Z.to_nat v) o3) = length b1 -> nth_i (set_list b1 (Z.to_nat v) o3) = fun_updt (nth_i b1) v o3 -> valid_chunk_up_to (nth_i g) i start offsets (off + 1%Z) ∧ (∀(o4 : Z), 0%Z ≤ o4 ∧ o4 < off + 1%Z -> (let v1 : Z := nth (Z.to_nat (s + nth (Z.to_nat o4) offsets inhabitant)) g inhabitant in 1%Z ≤ v1 ∧ v1 ≤ 9%Z -> nth (Z.to_nat v1) (set_list b1 (Z.to_nat v) o3) inhabitant = true)) ∧ (∀(j : Z), 1%Z ≤ j ∧ j ≤ 9%Z -> nth (Z.to_nat j) (set_list b1 (Z.to_nat v) o3) inhabitant = true -> (∃(o4 : Z), (0%Z ≤ o4 ∧ o4 < off + 1%Z) ∧ nth_i g (s + nth (Z.to_nat o4) offsets inhabitant) = j)))) else valid_chunk_up_to (nth_i g) i start offsets (off + 1%Z) ∧ (∀(o3 : Z), 0%Z ≤ o3 ∧ o3 < off + 1%Z -> (let v1 : Z := nth (Z.to_nat (s + nth (Z.to_nat o3) offsets inhabitant)) g inhabitant in 1%Z ≤ v1 ∧ v1 ≤ 9%Z -> nth (Z.to_nat v1) b1 inhabitant = true)) ∧ (∀(j : Z), 1%Z ≤ j ∧ j ≤ 9%Z -> nth (Z.to_nat j) b1 inhabitant = true -> (∃(o3 : Z), (0%Z ≤ o3 ∧ o3 < off + 1%Z) ∧ nth_i g (s + nth (Z.to_nat o3) offsets inhabitant) = j)))))) ∧ (valid_chunk_up_to (nth_i g) i start offsets (8%Z + 1%Z) ∧ (∀(o1 : Z), 0%Z ≤ o1 ∧ o1 < 8%Z + 1%Z -> (let v : Z := nth (Z.to_nat (s + nth (Z.to_nat o1) offsets inhabitant)) g inhabitant in 1%Z ≤ v ∧ v ≤ 9%Z -> nth (Z.to_nat v) b1 inhabitant = true)) ∧ (∀(j : Z), 1%Z ≤ j ∧ j ≤ 9%Z -> nth (Z.to_nat j) b1 inhabitant = true -> (∃(o1 : Z), (0%Z ≤ o1 ∧ o1 < 8%Z + 1%Z) ∧ nth_i g (s + nth (Z.to_nat o1) offsets inhabitant) = j)) -> valid_chunk (nth_i g) i start offsets))) ∧ (8%Z + 1%Z < 0%Z -> valid_chunk (nth_i g) i start offsets))).
Admitted.
