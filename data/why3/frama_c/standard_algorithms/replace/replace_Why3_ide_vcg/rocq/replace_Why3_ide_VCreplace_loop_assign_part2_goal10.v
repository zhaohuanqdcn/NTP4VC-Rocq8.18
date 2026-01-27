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
Require Import replace.Compound.Compound.
Require Import replace.Axiomatic.Axiomatic.
Open Scope Z_scope.
Theorem goal10 (a : addr) (i_2 : Z) (t_1 : addr -> Z) (t_2 : addr -> Z) (i_1 : Z) (t : Z -> Z) (i : Z) : let a_1 : addr := shift a i_2 in let a_2 : addr := shift a 0%Z in let a_3 : addr -> Z := havoc t_1 t_2 a_2 i_1 in let a_4 : Z := a_3 a_1 in i_2 ≤ i_1 -> 0%Z ≤ i_2 -> i_2 < i_1 -> region (base a) ≤ 0%Z -> i_2 ≤ 4294967294%Z -> linked t -> is_uint32 i_1 -> is_uint32 i_2 -> is_sint32 i -> valid_rd t a_1 1%Z -> valid_rw t a_2 i_1 -> valid_rw t a_1 1%Z -> ¬ invalid t a_1 1%Z -> is_sint32 a_4 -> p_unchanged_1' a_3 t_2 a i_2 i_1 -> p_replace_2' a_3 t_2 a i_2 a_4 i -> included a_1 1%Z a_2 i_1.
Admitted.
