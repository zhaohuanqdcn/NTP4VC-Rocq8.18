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
Require Import Why3.int.NumOf.
Open Scope Z_scope.
Axiom fc : list Z -> Z -> bool.
Axiom fc'def : forall  (a : list Z) (i : Z), (fc a i = true) = (¬ nth (Z.to_nat i) a inhabitant = 0%Z).
Definition numof (a : list Z) (l : Z) (u : Z) : Z := NumOf.numof (fc a) l u.
Theorem compact'vc (a : list Z) : let o1 : Z := Z.of_nat (length a) - 1%Z in (0%Z ≤ o1 + 1%Z -> 0%Z = numof a 0%Z 0%Z ∧ (∀(count : Z), (∀(i : Z), (0%Z ≤ i ∧ i ≤ o1) ∧ count = numof a 0%Z i -> (0%Z ≤ i ∧ i < Z.of_nat (length a)) ∧ (if decide (¬ nth (Z.to_nat i) a inhabitant = 0%Z) then count + 1%Z = numof a 0%Z (i + 1%Z) else count = numof a 0%Z (i + 1%Z))) ∧ (count = numof a 0%Z (o1 + 1%Z) -> 0%Z ≤ count ∧ (∀(u : list Z), (∀(i : Z), 0%Z ≤ i ∧ i < count -> nth (Z.to_nat i) u inhabitant = 0%Z) ∧ Z.of_nat (length u) = count -> (let o2 : Z := Z.of_nat (length a) - 1%Z in 0%Z ≤ o2 + 1%Z -> 0%Z = numof a 0%Z 0%Z ∧ (∀(u1 : list Z) (count1 : Z), length u1 = length u -> (∀(i : Z), (0%Z ≤ i ∧ i ≤ o2) ∧ count1 = numof a 0%Z i -> (0%Z ≤ i ∧ i < Z.of_nat (length a)) ∧ (if decide (¬ nth (Z.to_nat i) a inhabitant = 0%Z) then (0%Z ≤ i ∧ i < Z.of_nat (length a)) ∧ (let o3 : Z := nth (Z.to_nat i) a inhabitant in (0%Z ≤ count1 ∧ count1 < Z.of_nat (length u1)) ∧ (length (set_list u1 (Z.to_nat count1) o3) = length u1 -> nth_i (set_list u1 (Z.to_nat count1) o3) = fun_updt (nth_i u1) count1 o3 -> count1 + 1%Z = numof a 0%Z (i + 1%Z))) else count1 = numof a 0%Z (i + 1%Z))))))))) ∧ (o1 + 1%Z < 0%Z -> 0%Z ≤ 0%Z ∧ (∀(u : list Z), (∀(i : Z), 0%Z ≤ i ∧ i < 0%Z -> nth (Z.to_nat i) u inhabitant = 0%Z) ∧ Z.of_nat (length u) = 0%Z -> (let o2 : Z := Z.of_nat (length a) - 1%Z in 0%Z ≤ o2 + 1%Z -> 0%Z = numof a 0%Z 0%Z ∧ (∀(u1 : list Z) (count : Z), length u1 = length u -> (∀(i : Z), (0%Z ≤ i ∧ i ≤ o2) ∧ count = numof a 0%Z i -> (0%Z ≤ i ∧ i < Z.of_nat (length a)) ∧ (if decide (¬ nth (Z.to_nat i) a inhabitant = 0%Z) then (0%Z ≤ i ∧ i < Z.of_nat (length a)) ∧ (let o3 : Z := nth (Z.to_nat i) a inhabitant in (0%Z ≤ count ∧ count < Z.of_nat (length u1)) ∧ (length (set_list u1 (Z.to_nat count) o3) = length u1 -> nth_i (set_list u1 (Z.to_nat count) o3) = fun_updt (nth_i u1) count o3 -> count + 1%Z = numof a 0%Z (i + 1%Z))) else count = numof a 0%Z (i + 1%Z))))))).
Admitted.
