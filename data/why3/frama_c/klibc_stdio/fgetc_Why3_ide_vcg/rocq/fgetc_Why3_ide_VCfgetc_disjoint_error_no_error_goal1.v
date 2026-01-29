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
Theorem goal1 (a_2 : addr) (t_1 : addr -> Z) (a_4 : addr) (a_5 : addr) (a : addr) (t_3 : addr -> addr) (t : Z -> Z) (t_2 : addr -> Z) (a_1 : addr) (a_3 : addr) : let a_6 : addr := shift a_2 0%Z in let x : Z := t_1 (shift a_4 7%Z) in let x_1 : Z := t_1 (shift a_5 7%Z) in ¬ a_6 = Mk_addr 0%Z 0%Z -> a_6 = shift a 0%Z -> region (base a_2) ≤ 0%Z -> framed t_3 -> linked t -> sconst t_2 -> is_uint32 x -> is_uint32 x_1 -> p_valid_io_file_pvt t t_3 t_1 a_1 -> p_valid_io_file_pvt t t_3 t_1 a_3 -> ¬ x = 0%Z ∨ x_1 ≤ 0%Z.
Proof.
Admitted.
