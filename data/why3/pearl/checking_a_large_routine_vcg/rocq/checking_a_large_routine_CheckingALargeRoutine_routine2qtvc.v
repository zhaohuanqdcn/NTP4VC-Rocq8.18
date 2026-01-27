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
Theorem routine2'vc (n : Z) (fact0 : 0%Z ≤ n) : let o1 : Z := n - 1%Z in (0%Z ≤ o1 + 1%Z -> 1%Z = fact 0%Z ∧ (∀(u : Z), (∀(r : Z), (0%Z ≤ r ∧ r ≤ o1) ∧ u = fact r -> (1%Z ≤ r + 1%Z -> u = 1%Z * fact r ∧ (∀(u1 : Z), (∀(s : Z), (1%Z ≤ s ∧ s ≤ r) ∧ u1 = s * fact r -> u1 + u = (s + 1%Z) * fact r) ∧ (u1 = (r + 1%Z) * fact r -> u1 = fact (r + 1%Z)))) ∧ (r + 1%Z < 1%Z -> u = fact (r + 1%Z))) ∧ (u = fact (o1 + 1%Z) -> u = fact n))) ∧ (o1 + 1%Z < 0%Z -> 1%Z = fact n).
Admitted.
