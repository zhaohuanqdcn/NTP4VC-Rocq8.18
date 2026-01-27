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
Require Import Why3.int.Iter.
Open Scope Z_scope.
Definition spec (x : Z) : Z := if decide (x ≤ 100%Z) then 91%Z else x - 10%Z.
Axiom spec_closure : Z -> Z.
Axiom spec_closure_def : forall  (y : Z), spec_closure y = spec y.
Theorem f91_nonrec'vc (n0 : Z) : 0%Z ≤ 1%Z ∧ iter spec_closure 1%Z n0 = spec n0 ∧ (∀(e : Z) (n : Z), 0%Z ≤ e ∧ iter spec_closure e n = spec n0 -> (if decide (0%Z < e) then ∀(e1 : Z) (n1 : Z), (if decide (100%Z < n) then n1 = n - 10%Z ∧ e1 = e - 1%Z else n1 = n + 11%Z ∧ e1 = e + 1%Z) -> (0%Z ≤ 101%Z - n + 10%Z * e ∧ 101%Z - n1 + 10%Z * e1 < 101%Z - n + 10%Z * e ∨ 101%Z - n + 10%Z * e = 101%Z - n1 + 10%Z * e1 ∧ 0%Z ≤ e ∧ e1 < e) ∧ 0%Z ≤ e1 ∧ iter spec_closure e1 n1 = spec n0 else n = spec n0)).
Admitted.
