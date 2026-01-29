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
Theorem goal58 (a_6 : addr) (a_7 : addr) (t_1 : addr -> Z) (a_1 : addr) (i : Z) (i_1 : Z) (a : addr) (i_2 : Z) (i_3 : Z) (t : Z -> Z) (a_3 : addr) (a_2 : addr) (a_5 : addr) (a_4 : addr) : let x : Z := base a_6 in let x_1 : Z := base a_7 in let x_2 : Z := t_1 (shift a_1 1%Z) in let x_3 : Z := t_1 (shift a_1 0%Z) in let a_8 : addr := shift a_6 0%Z in let a_9 : addr := shift a_7 0%Z in ¬ i = 0%Z -> ¬ i_1 = 0%Z -> ¬ i_1 = 1%Z -> x = base a_1 -> x_1 = base a -> ¬ x_2 = x_3 -> 0%Z ≤ i -> i_1 ≤ i -> 0%Z ≤ i_1 -> 0%Z ≤ i_2 -> 0%Z ≤ i_3 -> i_1 + i_3 ≤ i -> region x ≤ 0%Z -> region x_1 ≤ 0%Z -> to_uint32 (i - i_1) < i_2 -> i_1 + i_2 ≤ 2%Z + i -> linked t -> is_uint32 i -> is_uint32 i_1 -> is_uint32 i_2 -> is_uint8 x_3 -> is_uint8 x_2 -> valid_rw t a_8 i_1 -> valid_rw t a_9 i -> separated a_9 i a_8 i_1 -> is_uint8 (t_1 (shift a (to_uint32 (1%Z + i_2)))) -> (∀(i_4 : Z), 0%Z ≤ i_4 -> i_4 < i_1 -> t_1 (shift a_3 (i_4 + i_3)) = t_1 (shift a_2 i_4)) -> ¬ (∀(i_4 : Z), 0%Z ≤ i_4 -> i_4 < i_2 -> (∃(i_5 : Z), 0%Z ≤ i_5 -> 3%Z + i_5 ≤ i_1 -> ¬ t_1 (shift a_5 (2%Z + i_5 + i_4)) = t_1 (shift a_4 (2%Z + i_5)))).
Proof.
Admitted.
