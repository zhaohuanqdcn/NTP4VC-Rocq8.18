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
Theorem division'vc (x : Z) (y : Z) (fact0 : 0%Z ≤ x) (fact1 : 0%Z < y) : 0%Z ≤ x ∧ x = 0%Z * y + x ∧ (∀(r : Z) (q : Z), 0%Z ≤ r ∧ x = q * y + r -> (if decide (y ≤ r) then (0%Z ≤ r ∧ r - y < r) ∧ 0%Z ≤ r - y ∧ x = (q + 1%Z) * y + (r - y) else (0%Z ≤ r ∧ r < y) ∧ x = q * y + r)).
Proof.
Admitted.
