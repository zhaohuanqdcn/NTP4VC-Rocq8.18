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
Require Import count.Axiomatic1.Axiomatic1.
Require Import count.A_Count.A_Count.
Require Import Why3.Cint.Cint.
Require Import count.Compound.Compound.
Require Import count.Axiomatic.Axiomatic.
Open Scope Z_scope.
Theorem goal6 (a : addr) (i_1 : Z) (t_1 : addr -> Z) (i : Z) (t : Z -> Z) : let a_1 : addr := shift a i_1 in let x : Z := t_1 a_1 in let x_1 : Z := l_count_1' t_1 a 0%Z i_1 x in i_1 ≤ i -> 0%Z ≤ i_1 -> i_1 < i -> region (base a) ≤ 0%Z -> x_1 ≤ i_1 -> 0%Z ≤ x_1 -> linked t -> is_uint32 i -> is_uint32 i_1 -> is_sint32 x -> valid_rd t (shift a 0%Z) i -> valid_rd t a_1 1%Z -> is_uint32 x_1 -> x_1 ≤ 4294967294%Z.
Admitted.
