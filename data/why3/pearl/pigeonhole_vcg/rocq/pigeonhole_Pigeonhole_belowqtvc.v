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
Theorem below'vc (n : Z) (fact0 : 0%Z ≤ n) : (¬ n = 0%Z -> (let o1 : Z := n - 1%Z in (0%Z ≤ n ∧ o1 < n) ∧ 0%Z ≤ o1)) ∧ (∀(result : gset Z), (if decide (n = 0%Z) then result = (∅ : gset Z) else let o1 : Z := n - 1%Z in ∃(o2 : gset Z), ((∀(i : Z), (i ∈ o2) = (0%Z ≤ i ∧ i < o1)) ∧ Z.of_nat (size o2) = o1) ∧ result = insert_set (n - 1%Z) o2) -> (∀(i : Z), (i ∈ result) = (0%Z ≤ i ∧ i < n)) ∧ Z.of_nat (size result) = n).
Proof.
Admitted.
