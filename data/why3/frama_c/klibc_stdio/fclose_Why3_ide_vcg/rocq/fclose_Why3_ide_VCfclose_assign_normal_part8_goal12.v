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
Theorem goal12 (a_2 : addr) (t_1 : addr -> Z) (a_4 : addr) (i : Z) (a_5 : addr) (i_1 : Z) (a_6 : addr) (i_2 : Z) (a_7 : addr) (i_3 : Z) (a_16 : addr) (t_2 : addr -> addr) (a : addr) (t : Z -> Z) (i_4 : Z) (a_1 : addr) (a_3 : addr) (a_8 : addr) (a_9 : addr) (a_13 : addr) (a_10 : addr) (a_12 : addr) (a_11 : addr) (a_14 : addr) (a_15 : addr) : let a_17 : addr := shift a_2 0%Z in let x : Z := fun_updt (fun_updt (fun_updt (fun_updt t_1 (shift a_4 8%Z) i) (shift (shift a_5 0%Z) 2%Z) i_1) (shift (shift a_6 0%Z) 1%Z) i_2) (shift a_7 7%Z) i_3 (shift (shift a_16 0%Z) 0%Z) in let a_18 : addr := shift a_16 3%Z in let a_19 : addr := shift (fun_updt t_2 (shift (t_2 (shift a_16 4%Z)) 3%Z) (t_2 a_18) a_18) 4%Z in a_17 = shift a 0%Z -> region (base a_2) ≤ 0%Z -> 0%Z ≤ x -> framed t_2 -> linked t -> is_sint32 i_4 -> p_valid_io_file_pvt t t_2 t_1 a_1 -> p_valid_io_file_pvt t t_2 t_1 a_3 -> p_valid_io_file_pvt t t_2 t_1 a_8 -> is_sint32 x -> ¬ invalid t a_19 1%Z -> i_4 = - 1%Z ∨ i_4 = 0%Z -> a_17 = Mk_addr 0%Z 0%Z ∨ shift a_9 0%Z = a_17 -> a_19 = shift a_13 7%Z ∨ a_19 = shift a_10 8%Z ∨ a_19 = shift (shift a_12 0%Z) 1%Z ∨ a_19 = shift (shift a_11 0%Z) 2%Z ∨ a_19 = shift (t_2 (shift a_14 3%Z)) 4%Z ∨ a_19 = shift (t_2 (shift a_15 4%Z)) 3%Z.
Proof.
Admitted.
