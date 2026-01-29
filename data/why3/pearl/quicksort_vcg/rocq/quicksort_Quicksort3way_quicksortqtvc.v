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
Definition qs_partition (a1 : list Z) (a2 : list Z) (l : Z) (ml : Z) (mr : Z) (r : Z) (v : Z) := permut_sub' a1 a2 (Z.to_nat l) (Z.to_nat r) ∧ (∀(j : Z), l ≤ j ∧ j < ml -> nth (Z.to_nat j) a2 inhabitant < v) ∧ (∀(j : Z), ml ≤ j ∧ j < mr -> nth (Z.to_nat j) a2 inhabitant = v) ∧ (∀(j : Z), mr ≤ j ∧ j < r -> v < nth (Z.to_nat j) a2 inhabitant).
Theorem quicksort'vc (a : list Z) : let o1 : Z := Z.of_nat (length a) in (0%Z ≤ 0%Z ∧ 0%Z ≤ o1 ∧ o1 ≤ Z.of_nat (length a)) ∧ (∀(a1 : list Z), length a1 = length a -> sorted_sub1 a1 0%Z o1 ∧ permut_sub' a a1 0%nat (Z.to_nat o1) -> sorted a1 ∧ a ≡ₚ a1).
Proof.
Admitted.
