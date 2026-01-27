From Stdlib Require Import Strings.String.
From Stdlib Require Import String Ascii.
From Stdlib Require Arith.
From stdpp Require Import base.
From stdpp Require Import fin_maps.
From stdpp Require Import gmap.
From stdpp Require Import base gmultiset.
From Stdlib Require Classical.
From Stdlib Require Import ZArith.
From stdpp.bitvector Require Import definitions tactics.
From Stdlib Require Import Sorting.Sorted.
From Stdlib Require Import Reals.Rbasic_fun.
From Stdlib Require Import Reals.Abstract.ConstructiveAbs.
From Stdlib Require Import Reals.Rdefinitions.
From stdpp Require Import list_relations.
From stdpp Require Import list_numbers.
From stdpp Require Import functions.
From Stdlib Require Import ClassicalEpsilon.
From stdpp Require Import base decidable.
From Stdlib Require Import ZArith.Zeuclid.
From Stdlib Require Import ZArith.Znumtheory.
From stdpp Require Import propset.
From Stdlib Require Import Reals.
Require Import Why3.Base.
Require Import Why3.Qed.Qed.
Require Import Why3.Memory.Memory.
Require Import klibc_stdio.Compound.Compound.
Require Import Why3.Cint.Cint.
Require Import klibc_stdio.Axiomatic3.Axiomatic3.
Open Scope Z_scope.
Theorem goal15 (a_2 : addr) (t_1 : addr -> Z) (a_4 : addr) (i : Z) (a_5 : addr) (i_1 : Z) (a_6 : addr) (i_2 : Z) (a_7 : addr) (i_3 : Z) (a_10 : addr) (a : addr) (t_2 : addr -> addr) (t : Z -> Z) (a_1 : addr) (a_3 : addr) (a_8 : addr) (a_9 : addr) : let a_11 : addr := shift a_2 0%Z in let x : Z := fun_updt (fun_updt (fun_updt (fun_updt t_1 (shift a_4 8%Z) i) (shift (shift a_5 0%Z) 2%Z) i_1) (shift (shift a_6 0%Z) 1%Z) i_2) (shift a_7 7%Z) i_3 (shift (shift a_10 0%Z) 0%Z) in a_11 = shift a 0%Z -> region (base a_2) ≤ 0%Z -> framed t_2 -> linked t -> p_valid_io_file_pvt t t_2 t_1 a_1 -> p_valid_io_file_pvt t t_2 t_1 a_3 -> p_valid_io_file_pvt t t_2 t_1 a_8 -> is_sint32 x -> a_11 = Mk_addr 0%Z 0%Z ∨ shift a_9 0%Z = a_11 -> 0%Z ≤ x.
Admitted.
