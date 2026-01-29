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
Theorem goal166 (a_3 : addr) (t_1 : addr -> Z) (a_1 : addr) (a_2 : addr) (i_3 : Z) (i_7 : Z) (a : addr) (i_5 : Z) (i_8 : Z) (i : Z) (i_4 : Z) (t_3 : addr -> addr) (t : Z -> Z) (t_2 : addr -> Z) (i_6 : Z) (i_1 : Z) (i_2 : Z) : let x : Z := base a_3 in let x_1 : Z := t_1 (shift a_1 9%Z) in let a_4 : addr := shift a_1 8%Z in let a_5 : addr := shift a_1 0%Z in let a_6 : addr := shift a_2 0%Z in ¬ i_3 = 0%Z -> ¬ i_7 = 0%Z -> x = base a -> t_1 (shift a_1 7%Z) = 0%Z -> to_uint32 (x_1 - i_3) = 0%Z -> 0%Z ≤ i_5 -> 0%Z ≤ i_7 -> i_5 ≤ i_7 -> 0%Z ≤ i_8 -> i_7 ≤ i_8 -> x_1 ≤ i -> region (base a_1) ≤ 0%Z -> region x ≤ 0%Z -> - 1%Z ≤ i_4 -> framed t_3 -> linked t -> sconst t_2 -> is_uint32 i -> is_uint32 i_3 -> is_uint32 i_5 -> is_uint32 i_7 -> is_uint32 i_8 -> is_sint32 i_4 -> is_sint32 i_6 -> addr_le a_3 a -> is_uint32 x_1 -> p_valid_io_file_pvt t t_3 t_1 a_1 -> ¬ invalid t a_4 1%Z -> addr_le a (shift a_3 i_8) -> valid_rw t (shift a_3 0%Z) i_8 -> p_valid_io_file_pvt t t_3 (fun_updt (fun_updt (fun_updt t_1 a_4 i) (shift a_5 1%Z) i_1) (shift a_5 2%Z) i_2) a_1 -> (i_4 = - 1%Z -> i_6 = 4%Z ∨ i_6 = 11%Z) -> shift a_2 8%Z = a_4 ∨ shift a_6 1%Z = a_4 ∨ shift a_6 2%Z = a_4.
Proof.
Admitted.
