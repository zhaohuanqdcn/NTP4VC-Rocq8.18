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
Require Import klibc_stdio.Compound.Compound.
Require Import Why3.Cint.Cint.
Require Import klibc_stdio.Axiomatic3.Axiomatic3.
Open Scope Z_scope.
Theorem goal197 (a_2 : addr) (t_1 : addr -> Z) (a_1 : addr) (a : addr) (t_4 : addr -> addr) (i_3 : Z) (t_2 : addr -> Z) (t_3 : addr -> Z) (i_7 : Z) (i_5 : Z) (i_8 : Z) (i_4 : Z) (t : Z -> Z) (i_6 : Z) (i : Z) (i_1 : Z) (i_2 : Z) : let x : Z := base a_2 in let x_1 : Z := t_1 (shift a_1 7%Z) in let x_2 : Z := t_1 (shift a_1 9%Z) in let a_3 : addr := shift a 0%Z in let a_4 : addr := t_4 (shift a_1 5%Z) in let a_5 : addr := shift a_4 i_3 in let a_6 : addr := shift a_1 0%Z in let a_7 : addr -> Z := havoc t_2 t_3 a_5 i_7 in ¬ i_3 = 0%Z -> ¬ i_7 = 0%Z -> x = base a -> ¬ x_1 = 0%Z -> 0%Z ≤ i_5 -> 0%Z ≤ i_7 -> i_5 ≤ i_7 -> 0%Z ≤ i_8 -> i_7 ≤ i_8 -> region (base a_1) ≤ 0%Z -> region x ≤ 0%Z -> i_7 < to_uint32 (x_2 - i_3) -> - 1%Z ≤ i_4 -> framed t_4 -> linked t -> sconst t_3 -> is_uint32 i_3 -> is_uint32 i_5 -> is_uint32 i_7 -> is_uint32 i_8 -> is_sint32 i_4 -> is_sint32 i_6 -> addr_le a_2 a -> is_uint32 x_2 -> is_uint32 x_1 -> p_valid_io_file_pvt t t_4 t_1 a_1 -> addr_le a (shift a_2 i_8) -> valid_rw t a_3 i_7 -> valid_rw t (shift a_2 0%Z) i_8 -> valid_rw t a_5 i_7 -> separated a_3 i_7 a_5 i_7 -> p_valid_io_file_pvt t t_4 (fun_updt (fun_updt (fun_updt t_1 (shift a_1 8%Z) i) (shift a_6 1%Z) i_1) (shift a_6 2%Z) i_2) a_1 -> (i_4 = - 1%Z -> i_6 = 4%Z ∨ i_6 = 11%Z) -> (∀(i_9 : Z), 0%Z ≤ i_9 -> i_9 < i_7 -> a_7 (shift a_4 (i_9 + i_3)) = a_7 (shift a i_9)) -> 0%Z < i_7.
Proof.
Admitted.
