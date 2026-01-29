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
Require Import klibc_string.Compound.Compound.
Require Import Why3.Cint.Cint.
Require Import klibc_string.A_PosOfChar.A_PosOfChar.
Require Import klibc_string.Axiomatic1.Axiomatic1.
Require Import klibc_string.A_Length.A_Length.
Require Import klibc_string.Axiomatic.Axiomatic.
Open Scope Z_scope.
Theorem goal19 (t_2 : addr -> Z) (a : addr) (i_2 : Z) (a_1 : addr) (i_1 : Z) (i : Z) (t_1 : addr -> Z) (i_3 : Z) (t : Z -> Z) : let x : Z := t_2 (shift a i_2) in let a_2 : addr := shift a 0%Z in let a_3 : addr := shift a_1 0%Z in let x_1 : Z := i_1 - i in let a_4 : addr := shift a x_1 in let a_5 : addr := shift a_1 x_1 in let a_6 : addr -> Z := havoc t_1 t_2 a_3 x_1 in ¬ i = 0%Z -> x = to_sint8 i_3 -> 0%Z < i_1 -> 0%Z ≤ i -> i ≤ i_1 -> 0%Z ≤ i_2 -> i_2 < i_1 -> region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> - 128%Z ≤ i_3 -> i_3 ≤ 127%Z -> linked t -> sconst t_2 -> is_uint32 i -> is_uint32 i_1 -> is_sint32 i_3 -> valid_rw t a_2 i_1 -> valid_rw t a_3 i_1 -> separated a_2 i_1 a_3 i_1 -> addr_le a a_4 -> addr_le a_1 a_5 -> addr_le a_4 (shift a i_1) -> addr_le a_5 (shift a_1 i_1) -> ¬ invalid t a_5 1%Z -> (∀(i_4 : Z), 0%Z ≤ i_4 -> i_4 + i < i_1 -> a_6 (shift a_1 i_4) = a_6 (shift a i_4)) -> (∀(i_4 : Z), 0%Z ≤ i_4 -> i_4 + i < i_1 -> ¬ a_6 (shift a_1 i_4) = x) -> included a_5 1%Z a_3 (1%Z + l_posofchar t_2 a i_3).
Proof.
Admitted.
