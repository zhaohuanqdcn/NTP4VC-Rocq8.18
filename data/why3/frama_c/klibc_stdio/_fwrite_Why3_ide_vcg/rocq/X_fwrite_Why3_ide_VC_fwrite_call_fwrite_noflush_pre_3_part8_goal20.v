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
Theorem goal20 (i_7 : Z) (i_8 : Z) (a_4 : addr) (a_5 : addr) (t_1 : addr -> Z) (i : Z) (i_1 : Z) (i_2 : Z) (a_2 : addr) (a : addr) (t_2 : addr -> Z) (t_3 : addr -> addr) (t : Z -> Z) (a_1 : addr) (a_3 : addr) (i_3 : Z) (i_4 : Z) (i_5 : Z) (i_6 : Z) : let x : Z := i_7 + i_8 in let a_6 : addr := shift a_4 0%Z in let a_7 : addr := shift a_5 8%Z in let a_8 : addr := shift a_5 0%Z in let a_9 : addr := shift a_8 1%Z in let a_10 : addr := shift a_8 2%Z in let m : addr -> Z := fun_updt (fun_updt (fun_updt t_1 a_7 i) a_9 i_1) a_10 i_2 in ¬ i_7 = 0%Z -> ¬ i_8 = 0%Z -> shift a_2 0%Z = shift a 0%Z -> t_1 (shift a_5 10%Z) = 1%Z -> t_2 (shift a_4 (to_uint32 (i_8 - 1%Z))) = 10%Z -> 0%Z ≤ i_7 -> 0%Z ≤ i_8 -> 0%Z ≤ x -> region (base a_2) ≤ 0%Z -> region (base a_4) ≤ 0%Z -> framed t_3 -> linked t -> sconst t_2 -> is_uint32 i_7 -> is_uint32 i_8 -> is_uint32 x -> p_valid_io_file_pvt t t_3 t_1 a_1 -> p_valid_io_file_pvt t t_3 t_1 a_3 -> p_valid_io_file_pvt t t_3 t_1 a_5 -> valid_rw t a_6 i_8 -> valid_rw t a_6 x -> p_valid_io_file_pvt t t_3 m a_5 -> (∀(i_9 : Z), i_8 < i_9 -> i_9 ≤ x -> ¬ t_2 (shift a_4 (i_9 - 1%Z)) = 10%Z) -> p_valid_io_file_pvt t t_3 (fun_updt (fun_updt (fun_updt (fun_updt m a_7 i_3) a_10 i_4) a_9 i_5) (shift a_5 7%Z) i_6) a_5.
Proof.
Admitted.
