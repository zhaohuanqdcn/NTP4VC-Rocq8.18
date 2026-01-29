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
Theorem gcd'vc (x : Z) (y : Z) (fact0 : 0%Z ≤ x) (fact1 : 0%Z ≤ y) : 0%Z ≤ x ∧ 0%Z ≤ y ∧ 1%Z * x + 0%Z * y = x ∧ 0%Z * x + 1%Z * y = y ∧ (∀(d : Z) (c : Z) (b : Z) (a : Z), (0%Z ≤ a * x + b * y ∧ 0%Z ≤ c * x + d * y) ∧ Z.gcd (a * x + b * y) (c * x + d * y) = Z.gcd x y -> (if decide (0%Z < c * x + d * y) then ¬ c * x + d * y = 0%Z ∧ ¬ c * x + d * y = 0%Z ∧ (let q : Z := Z.rem (a * x + b * y) (c * x + d * y) in (0%Z ≤ c * x + d * y ∧ Z.quot (a * x + b * y) (c * x + d * y) < c * x + d * y) ∧ (0%Z ≤ c * x + d * y ∧ 0%Z ≤ Z.quot (a * x + b * y) (c * x + d * y)) ∧ Z.gcd (c * x + d * y) (Z.quot (a * x + b * y) (c * x + d * y)) = Z.gcd x y ∧ (a - c * q) * x + (b - d * q) * y = Z.quot (a * x + b * y) (c * x + d * y)) else a * x + b * y = Z.gcd x y)).
Proof.
Admitted.
