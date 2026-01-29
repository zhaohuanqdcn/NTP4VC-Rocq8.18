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
Require Import Why3.map.MapEq.
Require Import Why3.map.MapExchange.
Require Import Why3.map.MapPermut.
Require Import verifythis_2021_lexicographic_permutations_2_vcg.verifythis_2021_lexicographic_permutations_2.ArrayListConversions.
Require Import Why3.array.IntArraySorted.
Require Import verifythis_2021_lexicographic_permutations_2_vcg.verifythis_2021_lexicographic_permutations_2.BoxedIntArrays.
Require Import Why3.queue.Queue.
Open Scope Z_scope.
Definition sorted_sub (a : list Z) (l : Z) (u : Z) := ∀(i1 : Z) (i2 : Z), l ≤ i1 ∧ i1 < i2 ∧ i2 < u -> nth (Z.to_nat i2) a inhabitant ≤ nth (Z.to_nat i1) a inhabitant.
Definition sorted (a : list Z) := ∀(i1 : Z) (i2 : Z), 0%Z ≤ i1 ∧ i1 < i2 ∧ i2 < Z.of_nat (length a) -> nth (Z.to_nat i2) a inhabitant ≤ nth (Z.to_nat i1) a inhabitant.
Definition le (a1 : list Z) (a2 : list Z) := length a1 = length a2 ∧ (∃(i : Z), (0%Z ≤ i ∧ i ≤ Z.of_nat (length a1)) ∧ (∀(j : Z), 0%Z ≤ j ∧ j < i -> nth (Z.to_nat j) a1 inhabitant = nth (Z.to_nat j) a2 inhabitant) ∧ (i < Z.of_nat (length a1) -> nth (Z.to_nat i) a1 inhabitant < nth (Z.to_nat i) a2 inhabitant)).
Definition lt (a1 : list Z) (a2 : list Z) := le a1 a2 ∧ ¬ a1 = a2.
Axiom find_eq : list Z -> list Z -> Z -> Z.
Axiom find_eq'def : forall  (a1 : list Z) (a2 : list Z) (i : Z) (fact0 : length a1 = length a2) (fact1 : 0%Z ≤ i) (fact2 : i ≤ Z.of_nat (length a1)) (fact3 : drop 0%nat (take (Z.to_nat i - 0%nat) a1) = drop 0%nat (take (Z.to_nat i - 0%nat) a2)), if decide (i = Z.of_nat (length a1) ∨ ¬ nth (Z.to_nat i) a1 inhabitant = nth (Z.to_nat i) a2 inhabitant) then find_eq a1 a2 i = i else find_eq a1 a2 i = find_eq a1 a2 (i + 1%Z).
Axiom find_eq'spec'1 : forall  (a1 : list Z) (a2 : list Z) (i : Z) (fact0 : length a1 = length a2) (fact1 : 0%Z ≤ i) (fact2 : i ≤ Z.of_nat (length a1)) (fact3 : drop 0%nat (take (Z.to_nat i - 0%nat) a1) = drop 0%nat (take (Z.to_nat i - 0%nat) a2)), 0%Z ≤ find_eq a1 a2 i ∧ find_eq a1 a2 i ≤ Z.of_nat (length a1).
Axiom find_eq'spec'0 : forall  (a1 : list Z) (a2 : list Z) (i : Z) (fact0 : length a1 = length a2) (fact1 : 0%Z ≤ i) (fact2 : i ≤ Z.of_nat (length a1)) (fact3 : drop 0%nat (take (Z.to_nat i - 0%nat) a1) = drop 0%nat (take (Z.to_nat i - 0%nat) a2)), drop 0%nat (take (Z.to_nat (find_eq a1 a2 i) - 0%nat) a1) = drop 0%nat (take (Z.to_nat (find_eq a1 a2 i) - 0%nat) a2).
Axiom find_eq'spec : forall  (a1 : list Z) (a2 : list Z) (i : Z) (fact0 : length a1 = length a2) (fact1 : 0%Z ≤ i) (fact2 : i ≤ Z.of_nat (length a1)) (fact3 : drop 0%nat (take (Z.to_nat i - 0%nat) a1) = drop 0%nat (take (Z.to_nat i - 0%nat) a2)) (fact4 : find_eq a1 a2 i < Z.of_nat (length a1)), ¬ nth (Z.to_nat (find_eq a1 a2 i)) a1 inhabitant = nth (Z.to_nat (find_eq a1 a2 i)) a2 inhabitant.
Definition find_le (a1 : list Z) (a2 : list Z) : bool := if decide (length a1 = length a2) then let i : Z := find_eq a1 a2 0%Z in if decide (i = Z.of_nat (length a1)) then true else if decide (nth (Z.to_nat i) a1 inhabitant < nth (Z.to_nat i) a2 inhabitant) then true else false else false.
Axiom find_le'spec : forall  (a1 : list Z) (a2 : list Z), (find_le a1 a2 = true) = le a1 a2.
Axiom as_num : Z -> list Z -> Z -> Z.
Axiom as_num'def : forall  (base : Z) (a : list Z) (i : Z) (fact0 : boxed base a) (fact1 : 0%Z ≤ i) (fact2 : i ≤ Z.of_nat (length a)), if decide (i = Z.of_nat (length a)) then as_num base a i = 0%Z else as_num base a i = nth (Z.to_nat i) a inhabitant * Z.pow base (Z.of_nat (length a) - 1%Z - i) + as_num base a (i + 1%Z).
Axiom as_num'spec : forall  (base : Z) (a : list Z) (i : Z) (fact0 : boxed base a) (fact1 : 0%Z ≤ i) (fact2 : i ≤ Z.of_nat (length a)), 2%Z * Z.abs (as_num base a i) < Z.pow base (Z.of_nat (length a) - i).
Axiom as_number : Z -> list Z -> Z.
Axiom as_number'def : forall  (base : Z) (a : list Z) (fact0 : boxed base a), as_number base a = as_num base a 0%Z.
Axiom as_number'spec : forall  (base : Z) (a : list Z) (fact0 : boxed base a), Z.abs (as_number base a) ≤ maxi base a.
Theorem permut'vc (a : list Z) : let base : Z := greater a in 0%Z ≤ base ∧ (∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length a) -> 2%Z * Z.abs (nth (Z.to_nat i) a inhabitant) < base) -> (∀(res : t (list Z)), seq res = ([] : list (list Z)) -> (if decide (Z.of_nat (length a) = 0%Z) then ∀(res1 : t (list Z)), seq res1 = seq res ++ [([] : list Z)] -> (∀(i1 : Z) (i2 : Z), 0%Z ≤ i1 ∧ i1 < i2 ∧ i2 < Z.of_nat (length (seq res1)) -> lt (of_list (nth (Z.to_nat i1) (seq res1) inhabitant)) (of_list (nth (Z.to_nat i2) (seq res1) inhabitant))) ∧ (∀(a' : list Z), a ≡ₚ a' -> to_list_from 0%Z a' ∈ seq res1) else ∀(a1 : list Z), length a1 = length a -> a1 ≡ₚ a ∧ IntArraySorted.sorted a1 -> (a1 ≡ₚ a ∧ boxed base a1 ∧ (∀(a' : list Z), a' ≡ₚ a1 -> lt a' a1 -> to_list_from 0%Z a' ∈ seq res) ∧ (∀(a' : list Z), to_list_from 0%Z a' ∈ seq res -> lt a' a1) ∧ (∀(i1 : Z) (i2 : Z), 0%Z ≤ i1 ∧ i1 < i2 ∧ i2 < Z.of_nat (length (seq res)) -> lt (of_list (nth (Z.to_nat i1) (seq res) inhabitant)) (of_list (nth (Z.to_nat i2) (seq res) inhabitant)))) ∧ (∀(cont_int : Z) (cont : bool) (res1 : t (list Z)) (a2 : list Z), length a2 = length a1 -> a2 ≡ₚ a ∧ boxed base a2 ∧ (cont_int = 1%Z) = (cont = true) ∧ (cont = true -> (∀(a' : list Z), a' ≡ₚ a2 -> lt a' a2 -> to_list_from 0%Z a' ∈ seq res1)) ∧ (¬ cont = true -> (∀(a' : list Z), a' ≡ₚ a2 -> le a' a2 -> to_list_from 0%Z a' ∈ seq res1)) ∧ (cont = true -> (∀(a' : list Z), to_list_from 0%Z a' ∈ seq res1 -> lt a' a2)) ∧ (¬ cont = true -> (∀(a' : list Z), a2 ≡ₚ a' -> le a2 a' -> a2 = a')) ∧ (∀(i1 : Z) (i2 : Z), 0%Z ≤ i1 ∧ i1 < i2 ∧ i2 < Z.of_nat (length (seq res1)) -> lt (of_list (nth (Z.to_nat i1) (seq res1) inhabitant)) (of_list (nth (Z.to_nat i2) (seq res1) inhabitant))) -> (if decide (cont = true) then ∀(res2 : t (list Z)), seq res2 = seq res1 ++ [to_list_from 0%Z a2] -> (∀(a3 : list Z), length a3 = length a2 -> (∀(o1 : bool), a3 ≡ₚ a2 ∧ (¬ o1 = true -> a3 = a2 ∧ (∀(a' : list Z), a3 ≡ₚ a' -> le a3 a' -> a3 = a')) ∧ (o1 = true -> lt a2 a3 ∧ (∀(a' : list Z), a2 ≡ₚ a' -> lt a2 a' -> le a3 a')) -> (if decide (o1 = true) then (0%Z ≤ cont_int ∧ cont_int < cont_int ∨ 0%Z ≤ maxi base a2 - as_number base a2 ∧ maxi base a3 - as_number base a3 < maxi base a2 - as_number base a2) ∧ a3 ≡ₚ a ∧ boxed base a3 ∧ (cont_int = 1%Z) = (o1 = true) ∧ (o1 = true -> (∀(a' : list Z), a' ≡ₚ a3 -> lt a' a3 -> to_list_from 0%Z a' ∈ seq res2)) ∧ (¬ o1 = true -> (∀(a' : list Z), a' ≡ₚ a3 -> le a' a3 -> to_list_from 0%Z a' ∈ seq res2)) ∧ (o1 = true -> (∀(a' : list Z), to_list_from 0%Z a' ∈ seq res2 -> lt a' a3)) ∧ (¬ o1 = true -> (∀(a' : list Z), a3 ≡ₚ a' -> le a3 a' -> a3 = a')) ∧ (∀(i1 : Z) (i2 : Z), 0%Z ≤ i1 ∧ i1 < i2 ∧ i2 < Z.of_nat (length (seq res2)) -> lt (of_list (nth (Z.to_nat i1) (seq res2) inhabitant)) (of_list (nth (Z.to_nat i2) (seq res2) inhabitant))) else (0%Z ≤ cont_int ∧ 0%Z < cont_int ∨ cont_int = 0%Z ∧ 0%Z ≤ maxi base a2 - as_number base a2 ∧ maxi base a3 - as_number base a3 < maxi base a2 - as_number base a2) ∧ a3 ≡ₚ a ∧ boxed base a3 ∧ (0%Z = 1%Z) = (o1 = true) ∧ (o1 = true -> (∀(a' : list Z), a' ≡ₚ a3 -> lt a' a3 -> to_list_from 0%Z a' ∈ seq res2)) ∧ (¬ o1 = true -> (∀(a' : list Z), a' ≡ₚ a3 -> le a' a3 -> to_list_from 0%Z a' ∈ seq res2)) ∧ (o1 = true -> (∀(a' : list Z), to_list_from 0%Z a' ∈ seq res2 -> lt a' a3)) ∧ (¬ o1 = true -> (∀(a' : list Z), a3 ≡ₚ a' -> le a3 a' -> a3 = a')) ∧ (∀(i1 : Z) (i2 : Z), 0%Z ≤ i1 ∧ i1 < i2 ∧ i2 < Z.of_nat (length (seq res2)) -> lt (of_list (nth (Z.to_nat i1) (seq res2) inhabitant)) (of_list (nth (Z.to_nat i2) (seq res2) inhabitant)))))) else (∀(i1 : Z) (i2 : Z), 0%Z ≤ i1 ∧ i1 < i2 ∧ i2 < Z.of_nat (length (seq res1)) -> lt (of_list (nth (Z.to_nat i1) (seq res1) inhabitant)) (of_list (nth (Z.to_nat i2) (seq res1) inhabitant))) ∧ (∀(a' : list Z), a2 ≡ₚ a' -> to_list_from 0%Z a' ∈ seq res1))))).
Proof.
Admitted.
