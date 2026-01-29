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
Theorem goal28 (a_7 : addr) (a_8 : addr) (i : Z) (a_3 : addr) (i_1 : Z) (t_1 : addr -> Z) (a : addr) (t : Z -> Z) (a_4 : addr) (a_5 : addr) (a_2 : addr) (a_1 : addr) (a_6 : addr) : let x : Z := base a_7 in let x_1 : Z := base a_8 in let x_2 : Z := to_uint32 (i - 1%Z) in let a_9 : addr := shift a_3 (i_1 - i) in let x_4 : Z := t_1 a_9 in let x_5 : Z := t_1 a in let a_10 : addr := shift a_7 0%Z in let a_11 : addr := shift a_8 0%Z in x = base a -> x_1 = base a_3 -> ¬ x_2 = 0%Z -> ¬ x_4 = x_5 -> 0%Z < i -> 0%Z < i_1 -> 0%Z ≤ i_1 -> i ≤ i_1 -> region x ≤ 0%Z -> region x_1 ≤ 0%Z -> linked t -> is_uint32 i -> is_uint32 i_1 -> is_uint8 x_5 -> valid_rw t a_10 1%Z -> valid_rw t a_11 i_1 -> separated a_11 i_1 a_10 1%Z -> addr_le a_4 a_9 -> addr_le a_9 (shift a_5 i_1) -> is_uint8 x_4 -> (∀(i_2 : Z), 0%Z ≤ i_2 -> i_2 + i < i_1 -> ¬ t_1 (shift a_2 0%Z) = t_1 (shift a_1 i_2)) -> shift a_6 (i_1 - x_2) = shift a_3 (1%Z + i_1 - i).
Proof.
Admitted.
