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
Require Import verifythis_fm2012_LRS_vcg.verifythis_fm2012_LRS.SuffixSort.
Open Scope Z_scope.
Definition permutation (m : Z -> Z) (u : Z) := MapInjection.range m u ∧ injective m u.
Theorem suffixArray'vc : 0%Z ≤ 0%Z ∧ (∀(o1 : list Z), (∀(i : Z), 0%Z ≤ i ∧ i < 0%Z -> nth (Z.to_nat i) o1 inhabitant = 0%Z) ∧ Z.of_nat (length o1) = 0%Z -> 0%Z ≤ 0%Z ∧ (∀(o2 : list Z), (∀(i : Z), 0%Z ≤ i ∧ i < 0%Z -> nth (Z.to_nat i) o2 inhabitant = 0%Z) ∧ Z.of_nat (length o2) = 0%Z -> length o2 = length o1 ∧ permutation (nth_i o1) (Z.of_nat (length o1)) ∧ sorted o2 o1)).
Proof.
Admitted.
