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
Require Import arm_vcg.arm.ARM.
Open Scope Z_scope.
Axiom a : Z.
Definition separation (fp : Z) := a + 10%Z < fp - 24%Z.
Definition inv (mem : Z -> Z) := mem a = 0%Z ∧ (∀(k : Z), 1%Z ≤ k ∧ k ≤ 10%Z -> 0%Z < mem (a + k)).
Definition inv_l2 (mem : Z -> Z) (fp : Z) (l4 : Z) := (2%Z ≤ mem (fp - 16%Z) ∧ mem (fp - 16%Z) ≤ 11%Z) ∧ l4 = mem (fp - 16%Z) - 2%Z ∧ inv mem.
Theorem path_l2_exit'vc (fp : Z) (mem : Z -> Z) (l4 : Z) (fact0 : separation fp) (fact1 : inv_l2 mem fp l4) (fact2 : (false = true) = (mem (fp - 16%Z) ≤ 10%Z)) : l4 = 9%Z.
Admitted.
