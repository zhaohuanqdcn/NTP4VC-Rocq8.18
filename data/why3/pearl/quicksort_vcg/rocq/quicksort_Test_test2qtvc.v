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
Require Import Why3.map.MapEq.
Require Import Why3.map.MapExchange.
Require Import Why3.map.MapPermut.
Require Import quicksort_vcg.quicksort.Quicksort.
Require Import Why3.array.IntArraySorted.
Open Scope Z_scope.
Theorem test2'vc : 0%Z ≤ 8%Z ∧ (∀(a : list Z), (∀(i : Z), 0%Z ≤ i ∧ i < 8%Z -> nth (Z.to_nat i) a inhabitant = 0%Z) ∧ Z.of_nat (length a) = 8%Z -> (0%Z ≤ 0%Z ∧ 0%Z < Z.of_nat (length a)) ∧ (length (set_list a 0%nat 53%Z) = length a -> nth_i (set_list a 0%nat 53%Z) = fun_updt (nth_i a) 0%Z 53%Z -> (0%Z ≤ 1%Z ∧ 1%Z < Z.of_nat (length (set_list a 0%nat 53%Z))) ∧ (length (set_list (set_list a 0%nat 53%Z) 1%nat 91%Z) = length (set_list a 0%nat 53%Z) -> nth_i (set_list (set_list a 0%nat 53%Z) 1%nat 91%Z) = fun_updt (nth_i (set_list a 0%nat 53%Z)) 1%Z 91%Z -> (0%Z ≤ 2%Z ∧ 2%Z < Z.of_nat (length (set_list (set_list a 0%nat 53%Z) 1%nat 91%Z))) ∧ (length (set_list (set_list (set_list a 0%nat 53%Z) 1%nat 91%Z) 2%nat 17%Z) = length (set_list (set_list a 0%nat 53%Z) 1%nat 91%Z) -> nth_i (set_list (set_list (set_list a 0%nat 53%Z) 1%nat 91%Z) 2%nat 17%Z) = fun_updt (nth_i (set_list (set_list a 0%nat 53%Z) 1%nat 91%Z)) 2%Z 17%Z -> (0%Z ≤ 3%Z ∧ 3%Z < Z.of_nat (length (set_list (set_list (set_list a 0%nat 53%Z) 1%nat 91%Z) 2%nat 17%Z))) ∧ (length (set_list (set_list (set_list (set_list a 0%nat 53%Z) 1%nat 91%Z) 2%nat 17%Z) 3%nat (- 5%Z)) = length (set_list (set_list (set_list a 0%nat 53%Z) 1%nat 91%Z) 2%nat 17%Z) -> nth_i (set_list (set_list (set_list (set_list a 0%nat 53%Z) 1%nat 91%Z) 2%nat 17%Z) 3%nat (- 5%Z)) = fun_updt (nth_i (set_list (set_list (set_list a 0%nat 53%Z) 1%nat 91%Z) 2%nat 17%Z)) 3%Z (- 5%Z) -> (0%Z ≤ 4%Z ∧ 4%Z < Z.of_nat (length (set_list (set_list (set_list (set_list a 0%nat 53%Z) 1%nat 91%Z) 2%nat 17%Z) 3%nat (- 5%Z)))) ∧ (length (set_list (set_list (set_list (set_list (set_list a 0%nat 53%Z) 1%nat 91%Z) 2%nat 17%Z) 3%nat (- 5%Z)) 4%nat 413%Z) = length (set_list (set_list (set_list (set_list a 0%nat 53%Z) 1%nat 91%Z) 2%nat 17%Z) 3%nat (- 5%Z)) -> nth_i (set_list (set_list (set_list (set_list (set_list a 0%nat 53%Z) 1%nat 91%Z) 2%nat 17%Z) 3%nat (- 5%Z)) 4%nat 413%Z) = fun_updt (nth_i (set_list (set_list (set_list (set_list a 0%nat 53%Z) 1%nat 91%Z) 2%nat 17%Z) 3%nat (- 5%Z))) 4%Z 413%Z -> (0%Z ≤ 5%Z ∧ 5%Z < Z.of_nat (length (set_list (set_list (set_list (set_list (set_list a 0%nat 53%Z) 1%nat 91%Z) 2%nat 17%Z) 3%nat (- 5%Z)) 4%nat 413%Z))) ∧ (length (set_list (set_list (set_list (set_list (set_list (set_list a 0%nat 53%Z) 1%nat 91%Z) 2%nat 17%Z) 3%nat (- 5%Z)) 4%nat 413%Z) 5%nat 42%Z) = length (set_list (set_list (set_list (set_list (set_list a 0%nat 53%Z) 1%nat 91%Z) 2%nat 17%Z) 3%nat (- 5%Z)) 4%nat 413%Z) -> nth_i (set_list (set_list (set_list (set_list (set_list (set_list a 0%nat 53%Z) 1%nat 91%Z) 2%nat 17%Z) 3%nat (- 5%Z)) 4%nat 413%Z) 5%nat 42%Z) = fun_updt (nth_i (set_list (set_list (set_list (set_list (set_list a 0%nat 53%Z) 1%nat 91%Z) 2%nat 17%Z) 3%nat (- 5%Z)) 4%nat 413%Z)) 5%Z 42%Z -> (0%Z ≤ 6%Z ∧ 6%Z < Z.of_nat (length (set_list (set_list (set_list (set_list (set_list (set_list a 0%nat 53%Z) 1%nat 91%Z) 2%nat 17%Z) 3%nat (- 5%Z)) 4%nat 413%Z) 5%nat 42%Z))) ∧ (length (set_list (set_list (set_list (set_list (set_list (set_list (set_list a 0%nat 53%Z) 1%nat 91%Z) 2%nat 17%Z) 3%nat (- 5%Z)) 4%nat 413%Z) 5%nat 42%Z) 6%nat 69%Z) = length (set_list (set_list (set_list (set_list (set_list (set_list a 0%nat 53%Z) 1%nat 91%Z) 2%nat 17%Z) 3%nat (- 5%Z)) 4%nat 413%Z) 5%nat 42%Z) -> nth_i (set_list (set_list (set_list (set_list (set_list (set_list (set_list a 0%nat 53%Z) 1%nat 91%Z) 2%nat 17%Z) 3%nat (- 5%Z)) 4%nat 413%Z) 5%nat 42%Z) 6%nat 69%Z) = fun_updt (nth_i (set_list (set_list (set_list (set_list (set_list (set_list a 0%nat 53%Z) 1%nat 91%Z) 2%nat 17%Z) 3%nat (- 5%Z)) 4%nat 413%Z) 5%nat 42%Z)) 6%Z 69%Z -> (0%Z ≤ 7%Z ∧ 7%Z < Z.of_nat (length (set_list (set_list (set_list (set_list (set_list (set_list (set_list a 0%nat 53%Z) 1%nat 91%Z) 2%nat 17%Z) 3%nat (- 5%Z)) 4%nat 413%Z) 5%nat 42%Z) 6%nat 69%Z))) ∧ (length (set_list (set_list (set_list (set_list (set_list (set_list (set_list (set_list a 0%nat 53%Z) 1%nat 91%Z) 2%nat 17%Z) 3%nat (- 5%Z)) 4%nat 413%Z) 5%nat 42%Z) 6%nat 69%Z) 7%nat 6%Z) = length (set_list (set_list (set_list (set_list (set_list (set_list (set_list a 0%nat 53%Z) 1%nat 91%Z) 2%nat 17%Z) 3%nat (- 5%Z)) 4%nat 413%Z) 5%nat 42%Z) 6%nat 69%Z) -> nth_i (set_list (set_list (set_list (set_list (set_list (set_list (set_list (set_list a 0%nat 53%Z) 1%nat 91%Z) 2%nat 17%Z) 3%nat (- 5%Z)) 4%nat 413%Z) 5%nat 42%Z) 6%nat 69%Z) 7%nat 6%Z) = fun_updt (nth_i (set_list (set_list (set_list (set_list (set_list (set_list (set_list a 0%nat 53%Z) 1%nat 91%Z) 2%nat 17%Z) 3%nat (- 5%Z)) 4%nat 413%Z) 5%nat 42%Z) 6%nat 69%Z)) 7%Z 6%Z -> (∀(a1 : list Z), length a1 = length (set_list (set_list (set_list (set_list (set_list (set_list (set_list (set_list a 0%nat 53%Z) 1%nat 91%Z) 2%nat 17%Z) 3%nat (- 5%Z)) 4%nat 413%Z) 5%nat 42%Z) 6%nat 69%Z) 7%nat 6%Z) -> sorted a1 ∧ set_list (set_list (set_list (set_list (set_list (set_list (set_list (set_list a 0%nat 53%Z) 1%nat 91%Z) 2%nat 17%Z) 3%nat (- 5%Z)) 4%nat 413%Z) 5%nat 42%Z) 6%nat 69%Z) 7%nat 6%Z ≡ₚ a1 -> Z.of_nat (length a1) = 8%Z)))))))))).
Admitted.
