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
Require Import klibc_stdio.Compound.Compound.
Require Import Why3.Cint.Cint.
Open Scope Z_scope.
Theorem goal3 (t_1 : addr -> Z) (a : addr) (a_2 : addr) (a_3 : addr) (t_2 : addr -> addr) (t : Z -> Z) (i : Z) (i_1 : Z) (a_1 : addr) : let x : Z := t_1 (shift a 9%Z) in region (base a_2) ≤ 0%Z -> region (base a_3) ≤ 0%Z -> framed t_2 -> linked t -> is_uint32 i -> is_uint32 i_1 -> is_uint32 x -> separated (shift a_2 0%Z) (to_uint32 (i * i_1)) (shift (t_2 (shift a_1 5%Z)) 0%Z) (32%Z + x).
Admitted.
