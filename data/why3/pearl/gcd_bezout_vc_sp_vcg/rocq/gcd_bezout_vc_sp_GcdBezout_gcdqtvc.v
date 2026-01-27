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
Open Scope Z_scope.
Theorem gcd'vc (x : Z) (y : Z) (fact0 : 0%Z ≤ x) (fact1 : 0%Z ≤ y) : 0%Z ≤ x ∧ 0%Z ≤ y ∧ 1%Z * x + 0%Z * y = x ∧ 0%Z * x + 1%Z * y = y ∧ (∀(a : Z) (b : Z) (c : Z) (d : Z), (0%Z ≤ a * x + b * y ∧ 0%Z ≤ c * x + d * y) ∧ Z.gcd (a * x + b * y) (c * x + d * y) = Z.gcd x y -> (if decide (0%Z < c * x + d * y) then ¬ c * x + d * y = 0%Z ∧ ¬ c * x + d * y = 0%Z ∧ (let q : Z := Z.rem (a * x + b * y) (c * x + d * y) in (0%Z ≤ c * x + d * y ∧ Z.quot (a * x + b * y) (c * x + d * y) < c * x + d * y) ∧ (0%Z ≤ c * x + d * y ∧ 0%Z ≤ Z.quot (a * x + b * y) (c * x + d * y)) ∧ Z.gcd (c * x + d * y) (Z.quot (a * x + b * y) (c * x + d * y)) = Z.gcd x y ∧ (a - c * q) * x + (b - d * q) * y = Z.quot (a * x + b * y) (c * x + d * y)) else a * x + b * y = Z.gcd x y ∧ (∃(a1 : Z) (b1 : Z), a1 * x + b1 * y = a * x + b * y))).
Admitted.
