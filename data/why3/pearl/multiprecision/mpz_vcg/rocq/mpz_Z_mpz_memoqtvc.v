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
Require Import Why3.map.Const.
Require Import Why3.map.MapEq.
Require Import Why3.mach.int.Unsigned.
Require Import Why3.mach.c.C.
Require Import multiprecision.types.Config.
Require Import multiprecision.types.Types.
Require Import multiprecision.types.Int32Eq.
Require Import multiprecision.types.UInt64Eq.
Require Import multiprecision.lemmas.Lemmas.
Open Scope Z_scope.
Axiom mpz_ptr : Type.
Axiom mpz_ptr_inhabited : Inhabited mpz_ptr.
Global Existing Instance mpz_ptr_inhabited.
Axiom mpz_ptr_countable : Countable mpz_ptr.
Global Existing Instance mpz_ptr_countable.
Axiom mpz_eq : mpz_ptr -> mpz_ptr -> Prop.
Axiom mpz_eq'spec : forall  (x : mpz_ptr) (y : mpz_ptr), mpz_eq x y = (x = y).
Axiom o1 : mpz_ptr -> Z.
Axiom o2 : mpz_ptr -> Z.
Axiom o3 : mpz_ptr -> Z.
Axiom o4 : mpz_ptr -> Z.
Axiom o'def : forall  (x : mpz_ptr), o1 x = 1%Z.
Axiom o'def1 : forall  (x : mpz_ptr), o2 x = 0%Z.
Axiom o'def2 : forall  (x : mpz_ptr), o3 x = 0%Z.
Axiom o'def3 : forall  (x : mpz_ptr), o4 x = 0%Z.
Theorem mpz_memo'vc : let o5 : mpz_ptr -> Z := o1 in let o6 : mpz_ptr -> Z := o2 in let o7 : mpz_ptr -> Z := o3 in let o8 : mpz_ptr -> Z := o4 in ∀(p : mpz_ptr), 0%Z ≤ o7 p ∧ (o5 p = 1%Z ∨ o5 p = - 1%Z) ∧ o6 p ≤ o7 p ∧ (0%Z ≤ o6 p ∧ o6 p ≤ 2147483647%Z) ∧ 0%Z ≤ o8 p ∧ (1%Z ≤ o6 p -> Z.pow (18446744073709551615%Z + 1%Z) (o6 p - 1%Z) ≤ o8 p) ∧ o8 p < Z.pow (18446744073709551615%Z + 1%Z) (o6 p).
Admitted.
