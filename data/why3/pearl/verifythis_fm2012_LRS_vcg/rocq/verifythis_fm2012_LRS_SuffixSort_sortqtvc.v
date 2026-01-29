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
Require Import Why3.map.MapInjection.
Require Import verifythis_fm2012_LRS_vcg.verifythis_fm2012_LRS.LCP.
Open Scope Z_scope.
Definition lt (a : list Z) (x : Z) (y : Z) := let n : Z := Z.of_nat (length a) in (0%Z ≤ x ∧ x ≤ n) ∧ (0%Z ≤ y ∧ y ≤ n) ∧ (∃(l : Z), is_common_prefix a x y l ∧ y + l < n ∧ (x + l = n ∨ nth (Z.to_nat (x + l)) a inhabitant < nth (Z.to_nat (y + l)) a inhabitant)).
Definition range (a : list Z) := MapInjection.range (nth_i a) (Z.of_nat (length a)).
Definition le (a : list Z) (x : Z) (y : Z) := x = y ∨ lt a x y.
Definition sorted_sub (a : list Z) (data : Z -> Z) (l : Z) (u : Z) := ∀(i1 : Z) (i2 : Z), l ≤ i1 ∧ i1 ≤ i2 ∧ i2 < u -> le a (data i1) (data i2).
Definition sorted (a : list Z) (data : list Z) := sorted_sub a (nth_i data) 0%Z (Z.of_nat (length data)).
Theorem sort'vc (data : list Z) (a : list Z) (fact0 : length data = length a) (fact1 : range data) : let o1 : Z := Z.of_nat (length data) - 1%Z in (0%Z ≤ o1 + 1%Z -> (data ≡ₚ data ∧ sorted_sub a (nth_i data) 0%Z 0%Z ∧ range data) ∧ (∀(data1 : list Z), length data1 = length data -> (∀(i : Z), (0%Z ≤ i ∧ i ≤ o1) ∧ data ≡ₚ data1 ∧ sorted_sub a (nth_i data1) 0%Z i ∧ range data1 -> ((0%Z ≤ i ∧ i ≤ i) ∧ range data1 ∧ data ≡ₚ data1 ∧ sorted_sub a (nth_i data1) 0%Z i ∧ sorted_sub a (nth_i data1) i (i + 1%Z) ∧ (∀(k1 : Z) (k2 : Z), (0%Z ≤ k1 ∧ k1 < i) ∧ i + 1%Z ≤ k2 ∧ k2 ≤ i -> le a (nth (Z.to_nat k1) data1 inhabitant) (nth (Z.to_nat k2) data1 inhabitant))) ∧ (∀(j : Z) (data2 : list Z), length data2 = length data1 -> (0%Z ≤ j ∧ j ≤ i) ∧ range data2 ∧ data ≡ₚ data2 ∧ sorted_sub a (nth_i data2) 0%Z j ∧ sorted_sub a (nth_i data2) j (i + 1%Z) ∧ (∀(k1 : Z) (k2 : Z), (0%Z ≤ k1 ∧ k1 < j) ∧ j + 1%Z ≤ k2 ∧ k2 ≤ i -> le a (nth (Z.to_nat k1) data2 inhabitant) (nth (Z.to_nat k2) data2 inhabitant)) -> (0%Z < j -> (0%Z ≤ j ∧ j < Z.of_nat (length data2)) ∧ (let o2 : Z := nth (Z.to_nat j) data2 inhabitant in let o3 : Z := j - 1%Z in (0%Z ≤ o3 ∧ o3 < Z.of_nat (length data2)) ∧ (let o4 : Z := nth (Z.to_nat o3) data2 inhabitant in (0%Z ≤ o4 ∧ o4 ≤ Z.of_nat (length a)) ∧ 0%Z ≤ o2 ∧ o2 ≤ Z.of_nat (length a)))) ∧ (∀(o2 : bool), (if decide (0%Z < j) then let o3 : Z := nth (Z.to_nat j) data2 inhabitant in let o4 : Z := nth (Z.to_nat (j - 1%Z)) data2 inhabitant in ∃(o5 : Z), ((o5 = 0%Z -> o4 = o3) ∧ (o5 < 0%Z -> lt a o4 o3) ∧ (0%Z < o5 -> lt a o3 o4)) ∧ o2 = (if decide (0%Z < o5) then true else false) else o2 = false) -> (if decide (o2 = true) then let b : Z := j - 1%Z in (0%Z ≤ j ∧ j < Z.of_nat (length data2)) ∧ (let t : Z := nth (Z.to_nat j) data2 inhabitant in (0%Z ≤ b ∧ b < Z.of_nat (length data2)) ∧ (let o3 : Z := nth (Z.to_nat b) data2 inhabitant in (0%Z ≤ j ∧ j < Z.of_nat (length data2)) ∧ (length (set_list data2 (Z.to_nat j) o3) = length data2 -> nth_i (set_list data2 (Z.to_nat j) o3) = fun_updt (nth_i data2) j o3 -> (0%Z ≤ b ∧ b < Z.of_nat (length (set_list data2 (Z.to_nat j) o3))) ∧ (length (set_list (set_list data2 (Z.to_nat j) o3) (Z.to_nat b) t) = length (set_list data2 (Z.to_nat j) o3) -> nth_i (set_list (set_list data2 (Z.to_nat j) o3) (Z.to_nat b) t) = fun_updt (nth_i (set_list data2 (Z.to_nat j) o3)) b t -> (0%Z ≤ j ∧ j - 1%Z < j) ∧ (0%Z ≤ j - 1%Z ∧ j - 1%Z ≤ i) ∧ range (set_list (set_list data2 (Z.to_nat j) o3) (Z.to_nat b) t) ∧ data ≡ₚ set_list (set_list data2 (Z.to_nat j) o3) (Z.to_nat b) t ∧ sorted_sub a (nth_i (set_list (set_list data2 (Z.to_nat j) o3) (Z.to_nat b) t)) 0%Z (j - 1%Z) ∧ sorted_sub a (nth_i (set_list (set_list data2 (Z.to_nat j) o3) (Z.to_nat b) t)) (j - 1%Z) (i + 1%Z) ∧ (∀(k1 : Z) (k2 : Z), (0%Z ≤ k1 ∧ k1 < j - 1%Z) ∧ j - 1%Z + 1%Z ≤ k2 ∧ k2 ≤ i -> le a (nth (Z.to_nat k1) (set_list (set_list data2 (Z.to_nat j) o3) (Z.to_nat b) t) inhabitant) (nth (Z.to_nat k2) (set_list (set_list data2 (Z.to_nat j) o3) (Z.to_nat b) t) inhabitant)))))) else data ≡ₚ data2 ∧ sorted_sub a (nth_i data2) 0%Z (i + 1%Z) ∧ range data2)))) ∧ (data ≡ₚ data1 ∧ sorted_sub a (nth_i data1) 0%Z (o1 + 1%Z) ∧ range data1 -> sorted a data1 ∧ data ≡ₚ data1))) ∧ (o1 + 1%Z < 0%Z -> sorted a data ∧ data ≡ₚ data).
Proof.
Admitted.
