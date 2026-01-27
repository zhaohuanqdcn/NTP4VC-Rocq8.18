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
Axiom t : Type.
Axiom t_inhabited : Inhabited t.
Global Existing Instance t_inhabited.
Axiom t_countable : Countable t.
Global Existing Instance t_countable.
Axiom rvars : Type.
Axiom rvars_inhabited : Inhabited rvars.
Global Existing Instance rvars_inhabited.
Axiom rvars_countable : Countable rvars.
Global Existing Instance rvars_countable.
Definition rinterp (t1 : Z * Z) (x_v : Z -> R) : R := match t1 with | (n, d) => Rdiv (Rdefinitions.IZR n) (Rdefinitions.IZR d) end.
Theorem gcd'vc (x : Z) (y : Z) (fact0 : 0%Z < x) (fact1 : 0%Z < y) : 0%Z ≤ x ∧ 0%Z ≤ y ∧ (∀(y1 : Z) (x1 : Z), (0%Z ≤ x1 ∧ 0%Z ≤ y1) ∧ Z.gcd x1 y1 = Z.gcd x y ∧ (0%Z < x -> 0%Z < x1) -> (if decide (0%Z < y1) then ¬ y1 = 0%Z ∧ ¬ y1 = 0%Z ∧ (0%Z ≤ y1 ∧ Z.quot x1 y1 < y1) ∧ (0%Z ≤ y1 ∧ 0%Z ≤ Z.quot x1 y1) ∧ Z.gcd y1 (Z.quot x1 y1) = Z.gcd x y ∧ (0%Z < x -> 0%Z < y1) else x1 = Z.gcd x y ∧ 0%Z < x1)).
Admitted.
