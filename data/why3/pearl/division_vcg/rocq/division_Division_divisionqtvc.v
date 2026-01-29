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
Theorem division'vc (a : Z) (b : Z) (fact0 : 0%Z ≤ a) (fact1 : 0%Z < b) : 0%Z * b + a = a ∧ 0%Z ≤ a ∧ (∀(r : Z) (q : Z), q * b + r = a ∧ 0%Z ≤ r -> (if decide (b ≤ r) then (0%Z ≤ r ∧ r - b < r) ∧ (q + 1%Z) * b + (r - b) = a ∧ 0%Z ≤ r - b else ∃(r1 : Z), q * b + r1 = a ∧ 0%Z ≤ r1 ∧ r1 < b)).
Proof.
Admitted.
