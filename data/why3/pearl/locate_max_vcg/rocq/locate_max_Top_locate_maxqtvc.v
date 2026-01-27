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
Require Import Why3.mach.c.C.
Require Import Why3.mach.int.Unsigned.
Open Scope Z_scope.
Definition mixfix_lbrb {α : Type} `{Inhabited α} (a : ptr α) (i : Z) : α := nth_i (data a) (offset a + i).
Theorem locate_max'vc (n : bv 32%N) (a : ptr (bv 64%N)) (fact0 : 0%Z < bv_signed n) (fact1 : valid a (bv_signed n)) : int'32_in_bounds (bv_signed n - 1%Z) ∧ (∀(o1 : bv 32%N), bv_signed o1 = bv_signed n - 1%Z -> (1%Z ≤ bv_signed o1 + 1%Z -> ((0%Z ≤ 0%Z ∧ 0%Z < bv_signed n) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < 1%Z -> bv_signed (mixfix_lbrb a i) ≤ bv_signed (mixfix_lbrb a 0%Z))) ∧ (∀(idx : bv 32%N), (∀(j : bv 32%N), let j1 : Z := bv_signed j in (1%Z ≤ j1 ∧ j1 ≤ bv_signed o1) ∧ (0%Z ≤ bv_signed idx ∧ bv_signed idx < bv_signed n) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < j1 -> bv_signed (mixfix_lbrb a i) ≤ bv_signed (mixfix_lbrb a (bv_signed idx))) -> (min a ≤ offset a + bv_signed j ∧ offset a + bv_signed j < C.max a) ∧ (min a ≤ offset a + bv_signed idx ∧ offset a + bv_signed idx < C.max a) ∧ (if decide (bv_signed (pelts a (offset a + bv_signed idx)) < bv_signed (pelts a (offset a + bv_signed j))) then (0%Z ≤ bv_signed j ∧ bv_signed j < bv_signed n) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < j1 + 1%Z -> bv_signed (mixfix_lbrb a i) ≤ bv_signed (mixfix_lbrb a (bv_signed j))) else (0%Z ≤ bv_signed idx ∧ bv_signed idx < bv_signed n) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < j1 + 1%Z -> bv_signed (mixfix_lbrb a i) ≤ bv_signed (mixfix_lbrb a (bv_signed idx))))) ∧ ((0%Z ≤ bv_signed idx ∧ bv_signed idx < bv_signed n) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < bv_signed o1 + 1%Z -> bv_signed (mixfix_lbrb a i) ≤ bv_signed (mixfix_lbrb a (bv_signed idx))) -> (0%Z ≤ bv_signed idx ∧ bv_signed idx < bv_signed n) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < bv_signed n -> bv_signed (mixfix_lbrb a i) ≤ bv_signed (mixfix_lbrb a (bv_signed idx)))))) ∧ (bv_signed o1 + 1%Z < 1%Z -> (0%Z ≤ 0%Z ∧ 0%Z < bv_signed n) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < bv_signed n -> bv_signed (mixfix_lbrb a i) ≤ bv_signed (mixfix_lbrb a 0%Z)))).
Admitted.
