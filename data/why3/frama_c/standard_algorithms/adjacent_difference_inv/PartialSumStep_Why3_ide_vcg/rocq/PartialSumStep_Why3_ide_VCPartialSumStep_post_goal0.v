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
Require Import Why3.Qed.Qed.
Require Import Why3.Memory.Memory.
Require Import adjacent_difference_inv.Compound.Compound.
Require Import adjacent_difference_inv.Axiomatic1.Axiomatic1.
Require Import adjacent_difference_inv.A_AccumulateAxiomatic.A_AccumulateAxiomatic.
Require Import Why3.Cint.Cint.
Require Import adjacent_difference_inv.Axiomatic.Axiomatic.
Open Scope Z_scope.
Theorem goal0 (t : addr -> Z) (a : addr) (i : Z) (a_1 : addr) : let x : Z := t (shift a i) in let x_1 : Z := 1%Z + i in x = l_accumulate_1' t a_1 x_1 0%Z -> 0%Z < i -> region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> is_uint32 i -> p_partialsum t a_1 i a -> is_sint32 x -> p_partialsum t a_1 x_1 a.
Admitted.
