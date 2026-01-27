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
Require Import Why3.int.Fact.
Open Scope Z_scope.
Theorem downward'vc (n : Z) (fact0 : 0%Z ≤ n) : 0%Z ≤ n ∧ n ≤ n ∧ 1%Z * fact n = fact n ∧ (∀(u : Z) (r : Z), (0%Z ≤ r ∧ r ≤ n) ∧ u * fact r = fact n -> (if decide (¬ r = 0%Z) then ((1%Z ≤ 1%Z ∧ 1%Z ≤ r) ∧ u = 1%Z * u) ∧ (∀(s : Z), 1%Z ≤ s ∧ s ≤ r -> (if decide (¬ s = r) then (0%Z ≤ r - s ∧ r - (s + 1%Z) < r - s) ∧ (1%Z ≤ s + 1%Z ∧ s + 1%Z ≤ r) ∧ s * u + u = (s + 1%Z) * u else (0%Z ≤ r ∧ r - 1%Z < r) ∧ (0%Z ≤ r - 1%Z ∧ r - 1%Z ≤ n) ∧ s * u * fact (r - 1%Z) = fact n)) else u = fact n)).
Admitted.
