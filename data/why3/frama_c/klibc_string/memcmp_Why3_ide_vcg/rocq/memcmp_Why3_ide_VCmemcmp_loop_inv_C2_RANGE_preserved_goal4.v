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
Require Import klibc_string.Compound.Compound.
Open Scope Z_scope.
Theorem goal4 (i_1 : Z) (i : Z) (t_1 : addr -> Z) (a_3 : addr) (a_2 : addr) (a_5 : addr) (a_6 : addr) (t : Z -> Z) (a_1 : addr) (a : addr) (a_4 : addr) : let x_1 : Z := i_1 - i in let x_2 : Z := t_1 (shift a_3 x_1) in let x_3 : Z := t_1 (shift a_2 x_1) in let a_7 : addr := shift a_5 0%Z in let a_8 : addr := shift a_6 0%Z in ¬ i = 0%Z -> x_2 = x_3 -> 0%Z ≤ i -> 0%Z ≤ i_1 -> i ≤ i_1 -> region (base a_5) ≤ 0%Z -> region (base a_6) ≤ 0%Z -> linked t -> is_uint32 i -> is_uint32 i_1 -> valid_rw t a_7 i_1 -> valid_rw t a_8 i_1 -> separated a_8 i_1 a_7 i_1 -> is_uint8 x_3 -> is_uint8 x_2 -> (∀(i_2 : Z), 0%Z ≤ i_2 -> i_2 + i < i_1 -> t_1 (shift a_1 i_2) = t_1 (shift a i_2)) -> shift a_4 (i_1 - to_uint32 (i - 1%Z)) = shift a_2 (1%Z + i_1 - i).
Admitted.
