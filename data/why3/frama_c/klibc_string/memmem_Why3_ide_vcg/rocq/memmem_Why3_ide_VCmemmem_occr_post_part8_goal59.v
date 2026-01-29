From Coq Require Import Strings.String.
From Coq Require Import String Ascii.
From Coq Require Arith.
From stdpp Require Import base.
From stdpp Require Import fin_maps.
From stdpp Require Import gmap.
From stdpp Require Import base gmultiset.
From Coq Require Classical.
From Coq Require Import ZArith.
From stdpp.bitvector Require Import definitions tactics.
From Coq Require Import Sorting.Sorted.
From Coq Require Import Reals.Rbasic_fun.
From Coq Require Import Reals.Abstract.ConstructiveAbs.
From Coq Require Import Reals.Rdefinitions.
From stdpp Require Import list_relations.
From stdpp Require Import list_numbers.
From stdpp Require Import functions.
From Coq Require Import ClassicalEpsilon.
From stdpp Require Import base decidable.
From Coq Require Import ZArith.Zeuclid.
From Coq Require Import ZArith.Znumtheory.
From stdpp Require Import propset.
From Coq Require Import Reals.
Require Import Why3.Base.
Require Import Why3.Qed.Qed.
Require Import Why3.Memory.Memory.
Require Import Why3.Cint.Cint.
Require Import klibc_string.Compound.Compound.
Open Scope Z_scope.
Theorem goal59 (a_8 : addr) (a_9 : addr) (a_5 : addr) (i_1 : Z) (i : Z) (t_1 : addr -> Z) (a : addr) (i_2 : Z) (t : Z -> Z) (a_6 : addr) (a_7 : addr) (a_4 : addr) (a_3 : addr) (a_2 : addr) (a_1 : addr) : let x : Z := base a_8 in let x_1 : Z := base a_9 in let a_10 : addr := shift a_5 (i_1 - i) in let x_2 : Z := t_1 a_10 in let x_3 : Z := t_1 a in let a_11 : addr := shift a_8 0%Z in let a_12 : addr := shift a_9 0%Z in ¬ i_1 = 0%Z -> x = base a -> x_1 = base a_5 -> x_2 = x_3 -> 0%Z < i -> 0%Z < i_1 -> 0%Z ≤ i_1 -> i ≤ i_1 -> 0%Z ≤ i_2 -> i_2 < i_1 -> region x ≤ 0%Z -> region x_1 ≤ 0%Z -> linked t -> is_uint32 i -> is_uint32 i_1 -> is_uint8 x_3 -> valid_rw t a_11 1%Z -> valid_rw t a_12 i_1 -> separated a_12 i_1 a_11 1%Z -> addr_le a_6 a_10 -> addr_le a_10 (shift a_7 i_1) -> is_uint8 x_2 -> (∀(i_3 : Z), 0%Z ≤ i_3 -> i_3 + i < i_1 -> ¬ t_1 (shift a_4 0%Z) = t_1 (shift a_3 i_3)) -> ¬ (∀(i_3 : Z), i_3 ≤ 0%Z -> 0%Z ≤ i_3 -> t_1 (shift a_2 (i_3 + i_2)) = t_1 (shift a_1 i_3)).
Proof.
Admitted.
