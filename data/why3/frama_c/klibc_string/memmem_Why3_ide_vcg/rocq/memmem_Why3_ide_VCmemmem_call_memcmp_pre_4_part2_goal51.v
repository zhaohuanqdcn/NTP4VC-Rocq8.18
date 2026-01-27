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
Theorem goal51 (a_6 : addr) (a_7 : addr) (t_1 : addr -> Z) (a_1 : addr) (a : addr) (i_2 : Z) (i_1 : Z) (i : Z) (t : Z -> Z) (a_3 : addr) (a_2 : addr) (a_5 : addr) (a_4 : addr) : let x : Z := base a_6 in let x_1 : Z := base a_7 in let x_2 : Z := t_1 (shift a_1 1%Z) in let x_3 : Z := t_1 (shift a_1 0%Z) in let x_4 : Z := t_1 (shift a (to_uint32 (1%Z + i_2))) in let a_8 : addr := shift a_6 0%Z in let a_9 : addr := shift a_7 0%Z in let x_5 : Z := to_uint32 (i_1 - 2%Z) in ¬ i = 0%Z -> ¬ i_1 = 0%Z -> ¬ i_1 = 1%Z -> x = base a_1 -> x_1 = base a -> ¬ x_2 = x_3 -> x_4 = x_2 -> 0%Z ≤ i -> i_1 ≤ i -> 0%Z ≤ i_1 -> 0%Z ≤ i_2 -> region x ≤ 0%Z -> region x_1 ≤ 0%Z -> i_2 ≤ to_uint32 (i - i_1) -> i_1 + i_2 ≤ 2%Z + i -> linked t -> is_uint32 i -> is_uint32 i_1 -> is_uint32 i_2 -> is_uint8 x_3 -> is_uint8 x_2 -> valid_rw t a_8 i_1 -> valid_rw t a_9 i -> separated a_9 i a_8 i_1 -> is_uint8 x_4 -> (∀(i_3 : Z), 0%Z ≤ i_3 -> i_3 < i_2 -> (∃(i_4 : Z), 0%Z ≤ i_4 -> 3%Z + i_4 ≤ i_1 -> ¬ t_1 (shift a_3 (2%Z + i_4 + i_3)) = t_1 (shift a_2 (2%Z + i_4)))) -> separated (shift a_5 0%Z) x_5 (shift a_4 0%Z) x_5.
Admitted.
