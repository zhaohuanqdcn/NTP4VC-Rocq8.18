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
Open Scope Z_scope.
Definition increasing (a : list Z) := ∀(i : Z) (j : Z), 0%Z ≤ i ∧ i < j ∧ j < Z.of_nat (length a) -> nth (Z.to_nat i) a inhabitant ≤ nth (Z.to_nat j) a inhabitant.
Theorem bagofsub'vc {α : Type} `{Inhabited α} `{Countable α} (lo : Z) (hi : Z) (a : list α) (fact0 : 0%Z ≤ lo) (fact1 : lo ≤ hi) (fact2 : hi ≤ Z.of_nat (length a)) (fact3 : ¬ hi ≤ lo) : let o1 : Z := lo + 1%Z in ((0%Z ≤ hi - lo ∧ hi - o1 < hi - lo) ∧ 0%Z ≤ o1 ∧ o1 ≤ hi ∧ hi ≤ Z.of_nat (length a)) ∧ 0%Z ≤ lo ∧ lo < Z.of_nat (length a).
Proof.
Admitted.
