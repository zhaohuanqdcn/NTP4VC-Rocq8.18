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
Require Import Why3.real.Truncate.
Open Scope Z_scope.
Definition pow2 (k : Z) : R := Rpower 2%R (Rdefinitions.IZR k).
Definition trunc_at (x : R) (k : Z) : R := Rmult (Rdefinitions.IZR (floor (Rmult x (pow2 (- k))))) (pow2 k).
Axiom fxp : Type.
Axiom fxp_inhabited : Inhabited fxp.
Global Existing Instance fxp_inhabited.
Axiom fxp_countable : Countable fxp.
Global Existing Instance fxp_countable.
Axiom ival : fxp -> bv 64%N.
Axiom rval : fxp -> R.
Axiom iexp : fxp -> Z.
Axiom fxp'invariant : forall  (self : fxp), rval self = trunc_at (rval self) (iexp self) ∧ bv_unsigned (ival self) = ZEuclid.modulo (floor (Rmult (rval self) (pow2 (- iexp self)))) (18446744073709551615%Z + 1%Z).
Definition fxp'eq (a : fxp) (b : fxp) := ival a = ival b ∧ rval a = rval b ∧ iexp a = iexp b.
Axiom fxp'inj : forall  (a : fxp) (b : fxp) (fact0 : fxp'eq a b), a = b.
