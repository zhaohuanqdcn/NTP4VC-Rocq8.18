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
Theorem routine'vc (n : Z) (fact0 : 0%Z ≤ n) : 0%Z ≤ 0%Z ∧ 0%Z ≤ n ∧ 1%Z = fact 0%Z ∧ (∀(r : Z), 0%Z ≤ r ∧ r ≤ n -> (if decide (r < n) then ((1%Z ≤ 1%Z ∧ 1%Z ≤ r + 1%Z) ∧ fact r = 1%Z * fact r) ∧ (∀(s : Z), 1%Z ≤ s ∧ s ≤ r + 1%Z -> (if decide (s ≤ r) then (0%Z ≤ r - s ∧ r - (s + 1%Z) < r - s) ∧ (1%Z ≤ s + 1%Z ∧ s + 1%Z ≤ r + 1%Z) ∧ s * fact r + fact r = (s + 1%Z) * fact r else (0%Z ≤ n - r ∧ n - (r + 1%Z) < n - r) ∧ (0%Z ≤ r + 1%Z ∧ r + 1%Z ≤ n) ∧ s * fact r = fact (r + 1%Z))) else fact r = fact n)).
Admitted.
