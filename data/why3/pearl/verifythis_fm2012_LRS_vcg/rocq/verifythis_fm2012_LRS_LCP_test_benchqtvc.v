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
Require Import verifythis_fm2012_LRS_vcg.verifythis_fm2012_LRS.LCP.
Open Scope Z_scope.
Theorem bench'vc : 0%Z ≤ 4%Z ∧ (∀(arr : list Z), (∀(i : Z), 0%Z ≤ i ∧ i < 4%Z -> nth (Z.to_nat i) arr inhabitant = 0%Z) ∧ Z.of_nat (length arr) = 4%Z -> (0%Z ≤ 0%Z ∧ 0%Z < Z.of_nat (length arr)) ∧ (length (set_list arr 0%nat 1%Z) = length arr -> nth_i (set_list arr 0%nat 1%Z) = fun_updt (nth_i arr) 0%Z 1%Z -> (0%Z ≤ 1%Z ∧ 1%Z < Z.of_nat (length (set_list arr 0%nat 1%Z))) ∧ (length (set_list (set_list arr 0%nat 1%Z) 1%nat 2%Z) = length (set_list arr 0%nat 1%Z) -> nth_i (set_list (set_list arr 0%nat 1%Z) 1%nat 2%Z) = fun_updt (nth_i (set_list arr 0%nat 1%Z)) 1%Z 2%Z -> (0%Z ≤ 2%Z ∧ 2%Z < Z.of_nat (length (set_list (set_list arr 0%nat 1%Z) 1%nat 2%Z))) ∧ (length (set_list (set_list (set_list arr 0%nat 1%Z) 1%nat 2%Z) 2%nat 2%Z) = length (set_list (set_list arr 0%nat 1%Z) 1%nat 2%Z) -> nth_i (set_list (set_list (set_list arr 0%nat 1%Z) 1%nat 2%Z) 2%nat 2%Z) = fun_updt (nth_i (set_list (set_list arr 0%nat 1%Z) 1%nat 2%Z)) 2%Z 2%Z -> (0%Z ≤ 3%Z ∧ 3%Z < Z.of_nat (length (set_list (set_list (set_list arr 0%nat 1%Z) 1%nat 2%Z) 2%nat 2%Z))) ∧ (length (set_list (set_list (set_list (set_list arr 0%nat 1%Z) 1%nat 2%Z) 2%nat 2%Z) 3%nat 5%Z) = length (set_list (set_list (set_list arr 0%nat 1%Z) 1%nat 2%Z) 2%nat 2%Z) -> nth_i (set_list (set_list (set_list (set_list arr 0%nat 1%Z) 1%nat 2%Z) 2%nat 2%Z) 3%nat 5%Z) = fun_updt (nth_i (set_list (set_list (set_list arr 0%nat 1%Z) 1%nat 2%Z) 2%nat 2%Z)) 3%Z 5%Z -> (0%Z ≤ 1%Z ∧ 1%Z ≤ Z.of_nat (length (set_list (set_list (set_list (set_list arr 0%nat 1%Z) 1%nat 2%Z) 2%nat 2%Z) 3%nat 5%Z))) ∧ 0%Z ≤ 2%Z ∧ 2%Z ≤ Z.of_nat (length (set_list (set_list (set_list (set_list arr 0%nat 1%Z) 1%nat 2%Z) 2%nat 2%Z) 3%nat 5%Z))))))).
Proof.
Admitted.
