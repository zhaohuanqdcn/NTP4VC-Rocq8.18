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
Require Import Why3.int.Fact.
Open Scope Z_scope.
Theorem fact_imp'vc (x : Z) (fact0 : 0%Z ≤ x) : 0%Z ≤ 0%Z ∧ 0%Z ≤ x ∧ 1%Z = fact 0%Z ∧ (∀(y : Z), 0%Z ≤ y ∧ y ≤ x -> (if decide (y < x) then (0%Z ≤ x - y ∧ x - (y + 1%Z) < x - y) ∧ (0%Z ≤ y + 1%Z ∧ y + 1%Z ≤ x) ∧ fact y * (y + 1%Z) = fact (y + 1%Z) else fact y = fact x)).
Proof.
Admitted.
