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
Require Import Why3.map.MapEq.
Open Scope Z_scope.
Axiom to_list_from : Z -> list Z -> list Z.
Axiom to_list_from'def : forall  (i : Z) (a : list Z) (fact0 : 0%Z ≤ i) (fact1 : i ≤ Z.of_nat (length a)), if decide (i = Z.of_nat (length a)) then to_list_from i a = ([] : list Z) else to_list_from i a = cons (nth (Z.to_nat i) a inhabitant) (to_list_from (i + 1%Z) a).
Axiom to_list_from'spec'0 : forall  (i : Z) (a : list Z) (fact0 : 0%Z ≤ i) (fact1 : i ≤ Z.of_nat (length a)), Z.of_nat (length (to_list_from i a)) = Z.of_nat (length a) - i.
Axiom to_list_from'spec : forall  (i : Z) (a : list Z) (k : Z) (fact0 : 0%Z ≤ i) (fact1 : i ≤ Z.of_nat (length a)) (fact2 : 0%Z ≤ k) (fact3 : k < Z.of_nat (length a) - i), nth_error_i (to_list_from i a) k = Some (nth (Z.to_nat (k + i)) a inhabitant).
Theorem of_list'vc (l : list Z) : let o1 : Z := Z.of_nat (length l) in 0%Z ≤ o1 ∧ (∀(a : list Z), (∀(i : Z), 0%Z ≤ i ∧ i < o1 -> nth (Z.to_nat i) a inhabitant = 0%Z) ∧ Z.of_nat (length a) = o1 -> (∀(a1 : list Z), length a1 = length a -> (∀(l' : list Z) (i : Z), 0%Z ≤ i ∧ Z.of_nat (length l') = Z.of_nat (length l) - i ∧ (∀(k : Z), 0%Z ≤ k ∧ k < Z.of_nat (length l') -> nth_error_i l (k + i) = nth_error_i l' k) -> (match l' with | [] => (∀(k : Z), i ≤ k ∧ k < Z.of_nat (length l) -> nth_error_i l k = Some (nth (Z.to_nat k) a1 inhabitant)) | cons v t => (0%Z ≤ i ∧ i < Z.of_nat (length a1)) ∧ (length (set_list a1 (Z.to_nat i) v) = length a1 -> nth_i (set_list a1 (Z.to_nat i) v) = fun_updt (nth_i a1) i v -> (let o2 : Z := i + 1%Z in ((match l' with | [] => False | cons _ f => f = t end) ∧ 0%Z ≤ o2 ∧ Z.of_nat (length t) = Z.of_nat (length l) - o2 ∧ (∀(k : Z), 0%Z ≤ k ∧ k < Z.of_nat (length t) -> nth_error_i l (k + o2) = nth_error_i t k)) ∧ (∀(a2 : list Z), length a2 = length (set_list a1 (Z.to_nat i) v) -> (∀(k : Z), o2 ≤ k ∧ k < Z.of_nat (length l) -> nth_error_i l k = Some (nth (Z.to_nat k) a2 inhabitant)) ∧ (∀(k : Z), 0%Z ≤ k ∧ k < o2 -> nth (Z.to_nat k) a2 inhabitant = nth (Z.to_nat k) (set_list a1 (Z.to_nat i) v) inhabitant) -> (∀(k : Z), i ≤ k ∧ k < Z.of_nat (length l) -> nth_error_i l k = Some (nth (Z.to_nat k) a2 inhabitant)) ∧ (∀(k : Z), 0%Z ≤ k ∧ k < i -> nth (Z.to_nat k) a2 inhabitant = nth (Z.to_nat k) a1 inhabitant)))) end))) ∧ (0%Z ≤ 0%Z ∧ Z.of_nat (length l) = Z.of_nat (length l) - 0%Z ∧ (∀(k : Z), 0%Z ≤ k ∧ k < Z.of_nat (length l) -> nth_error_i l (k + 0%Z) = nth_error_i l k)) ∧ (∀(a1 : list Z), length a1 = length a -> (∀(k : Z), 0%Z ≤ k ∧ k < Z.of_nat (length l) -> nth_error_i l k = Some (nth (Z.to_nat k) a1 inhabitant)) ∧ (∀(k : Z), 0%Z ≤ k ∧ k < 0%Z -> nth (Z.to_nat k) a1 inhabitant = nth (Z.to_nat k) a inhabitant) -> length a1 = length l ∧ (∀(k : Z), 0%Z ≤ k ∧ k < Z.of_nat (length l) -> nth_error_i l k = Some (nth (Z.to_nat k) a1 inhabitant)))).
Proof.
Admitted.
