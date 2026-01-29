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
Require Import klibc_string.Axiomatic.Axiomatic.
Open Scope Z_scope.
Theorem goal9 (a_1 : addr) (i : Z) (i_1 : Z) (a : addr) (t_1 : addr -> Z) (t_2 : addr -> Z) (t : Z -> Z) (i_4 : Z) (i_2 : Z) (i_3 : Z) : let a_2 : addr := shift a_1 0%Z in let x_1 : Z := i - i_1 in let a_3 : addr := shift a x_1 in let a_4 : Z := havoc t_1 t_2 a_2 (1%Z + i - i_1) a_3 in let a_5 : addr := shift a_1 x_1 in ¬ i = 0%Z -> ¬ a_4 = 0%Z -> 0%Z ≤ i -> 0%Z ≤ i_1 -> i ≤ i_1 -> region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> linked t -> sconst t_2 -> is_sint8 i_4 -> is_uint32 i -> is_uint32 i_1 -> p_length_of_str_is t t_2 a i_2 -> p_length_of_str_is t t_2 a i_3 -> valid_rw t a_2 i_1 -> separated (shift a 0%Z) i_1 a_2 i_1 -> addr_le a a_3 -> addr_le a_1 a_5 -> addr_le a_3 (shift a i_1) -> addr_le a_5 (shift a_1 i_1) -> is_sint8 a_4 -> (¬ i_1 = i -> ¬ i_4 = 0%Z) -> 1%Z + i = to_uint32 (i - 1%Z).
Proof.
Admitted.
