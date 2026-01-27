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
Theorem goal9 (i : Z) (i_1 : Z) (t_1 : addr -> Z) (a_5 : addr) (a_4 : addr) (a_6 : addr) (a_7 : addr) (t : Z -> Z) (a_1 : addr) (a : addr) (a_3 : addr) (a_2 : addr) : let x : Z := i - i_1 in let x_1 : Z := t_1 (shift a_5 x) in let x_2 : Z := t_1 (shift a_4 x) in let a_8 : addr := shift a_6 0%Z in let a_9 : addr := shift a_7 0%Z in ¬ i_1 = 0%Z -> ¬ x_1 = x_2 -> 0%Z ≤ i -> i_1 ≤ i -> 0%Z ≤ i_1 -> region (base a_6) ≤ 0%Z -> region (base a_7) ≤ 0%Z -> linked t -> is_uint32 i -> is_uint32 i_1 -> valid_rw t a_8 i -> valid_rw t a_9 i -> separated a_9 i a_8 i -> is_uint8 x_2 -> is_uint8 x_1 -> is_sint32 (x_1 - x_2) -> (∀(i_2 : Z), 0%Z ≤ i_2 -> i_2 < i -> t_1 (shift a_1 i_2) = t_1 (shift a i_2)) -> ¬ (∀(i_2 : Z), 0%Z ≤ i_2 -> i_2 + i_1 < i -> t_1 (shift a_3 i_2) = t_1 (shift a_2 i_2)).
Admitted.
