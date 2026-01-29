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
Theorem goal18 (a_1 : addr) (i : Z) (i_1 : Z) (t_1 : addr -> Z) (t_3 : addr -> Z) (a : addr) (t : Z -> Z) (i_4 : Z) (i_2 : Z) (i_3 : Z) (t_2 : addr -> Z) : let a_2 : addr := shift a_1 0%Z in let x_1 : Z := 1%Z + i - i_1 in let a_3 : addr -> Z := havoc t_1 t_3 a_2 x_1 in let x_2 : Z := i - i_1 in let a_4 : addr := shift a x_2 in let a_5 : addr := shift a_1 x_2 in let a_6 : addr := shift a_1 x_1 in let x_3 : Z := to_uint32 (i - 1%Z) in ¬ i = 0%Z -> a_3 a_4 = 0%Z -> 0%Z ≤ i -> 0%Z ≤ i_1 -> i ≤ i_1 -> region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> linked t -> sconst t_3 -> is_sint8 i_4 -> is_uint32 i -> is_uint32 i_1 -> p_length_of_str_is t t_3 a i_2 -> p_length_of_str_is t t_3 a i_3 -> valid_rw t a_2 i_1 -> separated (shift a 0%Z) i_1 a_2 i_1 -> addr_le a a_4 -> addr_le a_1 a_5 -> addr_le a_4 (shift a i_1) -> addr_le a_5 (shift a_1 i_1) -> valid_rw t a_6 x_3 -> ¬ invalid t a_6 x_3 -> (¬ i_1 = i -> ¬ i_4 = 0%Z) -> (∀(i_5 : Z), 0%Z ≤ i_5 -> i_5 < x_3 -> havoc t_2 (fun_updt a_3 a_5 0%Z) a_6 x_3 (shift a_1 (1%Z + i_5 + i - i_1)) = 0%Z) -> included a_6 x_3 a_2 i_1.
Proof.
Admitted.
