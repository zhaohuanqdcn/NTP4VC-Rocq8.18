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
Require Import Why3.array.IntArraySorted.
Open Scope Z_scope.
Theorem test1'vc : 0%Z ≤ 3%Z ∧ (∀(a : list Z), (∀(i : Z), 0%Z ≤ i ∧ i < 3%Z -> nth (Z.to_nat i) a inhabitant = 0%Z) ∧ Z.of_nat (length a) = 3%Z -> (0%Z ≤ 0%Z ∧ 0%Z < Z.of_nat (length a)) ∧ (length (set_list a 0%nat 7%Z) = length a -> nth_i (set_list a 0%nat 7%Z) = fun_updt (nth_i a) 0%Z 7%Z -> (0%Z ≤ 1%Z ∧ 1%Z < Z.of_nat (length (set_list a 0%nat 7%Z))) ∧ (length (set_list (set_list a 0%nat 7%Z) 1%nat 3%Z) = length (set_list a 0%nat 7%Z) -> nth_i (set_list (set_list a 0%nat 7%Z) 1%nat 3%Z) = fun_updt (nth_i (set_list a 0%nat 7%Z)) 1%Z 3%Z -> 0%Z ≤ 2%Z ∧ 2%Z < Z.of_nat (length (set_list (set_list a 0%nat 7%Z) 1%nat 3%Z))))).
Proof.
Admitted.
