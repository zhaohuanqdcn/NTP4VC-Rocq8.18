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
Require Import Why3.Cint.Cint.
Require Import replace_copy.Compound.Compound.
Require Import replace_copy.Axiomatic.Axiomatic.
Open Scope Z_scope.
Theorem goal9 (a : addr) (t_1 : addr -> Z) (t_2 : addr -> Z) (i_2 : Z) (a_1 : addr) (i_3 : Z) (i_1 : Z) (t : Z -> Z) (i : Z) : let a_2 : addr := shift a 0%Z in let a_3 : addr -> Z := havoc t_1 t_2 a_2 i_2 in let a_4 : addr := shift a_1 i_3 in let a_5 : Z := a_3 a_4 in let a_6 : addr := shift a_1 0%Z in ¬ a_5 = i_1 -> i_3 ≤ i_2 -> 0%Z ≤ i_3 -> i_3 < i_2 -> region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> linked t -> is_uint32 i_2 -> is_uint32 i_3 -> is_sint32 i -> is_sint32 i_1 -> valid_rd t a_6 i_2 -> valid_rd t a_4 1%Z -> valid_rw t a_2 i_2 -> separated a_6 i_2 a 1%Z -> is_sint32 a_5 -> p_unchanged_1' a_3 t_2 a_1 i_3 i_2 -> p_replace_1' a_3 t_2 a_1 i_3 a i_1 i -> valid_rw t (shift a i_3) 1%Z.
Admitted.
