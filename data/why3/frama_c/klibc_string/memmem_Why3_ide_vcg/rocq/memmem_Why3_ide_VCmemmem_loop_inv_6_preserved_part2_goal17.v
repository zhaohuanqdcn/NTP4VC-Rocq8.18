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
Theorem goal17 (a_10 : addr) (a_11 : addr) (t_1 : addr -> Z) (a_1 : addr) (i_3 : Z) (a : addr) (i_2 : Z) (a_6 : addr) (a_7 : addr) (i : Z) (i_1 : Z) (a_5 : addr) (i_4 : Z) (a_4 : addr) (i_5 : Z) (t : Z -> Z) (a_3 : addr) (a_2 : addr) (a_9 : addr) (a_8 : addr) : let x : Z := base a_10 in let x_1 : Z := base a_11 in let x_2 : Z := t_1 (shift a_1 1%Z) in let x_3 : Z := t_1 (shift a_1 0%Z) in let x_4 : Z := to_uint32 (1%Z + i_3) in let x_5 : Z := t_1 (shift a x_4) in let x_6 : Z := to_uint32 (i_2 - 2%Z) in let a_12 : addr := shift a_10 0%Z in let a_13 : addr := shift a_11 0%Z in let a_14 : addr := shift a_6 0%Z in let a_15 : addr := shift a_7 0%Z in ¬ i = 0%Z -> ¬ i_1 = 0%Z -> ¬ i_2 = 0%Z -> ¬ i_2 = 1%Z -> x = base a_1 -> x_1 = base a -> x_2 = x_3 -> ¬ t_1 (shift a_5 i_4) = t_1 (shift a_4 i_4) -> x_5 = x_2 -> 0%Z ≤ i -> i_2 ≤ i -> 0%Z ≤ i_2 -> 0%Z ≤ i_3 -> 0%Z ≤ i_4 -> 0%Z ≤ i_5 -> region x ≤ 0%Z -> region x_1 ≤ 0%Z -> i_4 < x_6 -> i_5 < x_4 -> i_3 ≤ to_uint32 (i - i_2) -> i_2 + i_3 ≤ 2%Z + i -> linked t -> is_uint32 i -> is_uint32 i_2 -> is_uint32 i_3 -> is_sint32 i_1 -> is_uint8 x_3 -> is_uint8 x_2 -> valid_rw t a_12 i_2 -> valid_rw t a_13 i -> separated a_13 i a_12 i_2 -> valid_rw t a_14 x_6 -> valid_rw t a_15 x_6 -> separated a_15 x_6 a_14 x_6 -> is_uint8 x_5 -> (∀(i_6 : Z), 0%Z ≤ i_6 -> i_6 < i_3 -> (∃(i_7 : Z), 0%Z ≤ i_7 -> 3%Z + i_7 ≤ i_2 -> ¬ t_1 (shift a_3 (2%Z + i_7 + i_6)) = t_1 (shift a_2 (2%Z + i_7)))) -> (∃(i_6 : Z), 0%Z ≤ i_6 -> 3%Z + i_6 ≤ i_2 -> ¬ t_1 (shift a_9 (2%Z + i_6 + i_5)) = t_1 (shift a_8 (2%Z + i_6))).
Proof.
Admitted.
