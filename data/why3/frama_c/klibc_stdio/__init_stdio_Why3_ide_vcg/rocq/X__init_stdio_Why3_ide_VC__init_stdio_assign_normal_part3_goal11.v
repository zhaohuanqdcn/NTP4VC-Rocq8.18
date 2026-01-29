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
Require Import klibc_stdio.Compound.Compound.
Require Import klibc_stdio.Axiomatic3.Axiomatic3.
Open Scope Z_scope.
Theorem goal11 (t_1 : addr -> Z) (a_2 : addr) (a_3 : addr) (a_6 : addr) (a_7 : addr) (a_11 : addr) (a_12 : addr) (a_8 : addr) (a_9 : addr) (a_10 : addr) (t_3 : addr -> addr) (t : Z -> Z) (t_2 : addr -> Z) (i : Z) (i_1 : Z) (a_1 : addr) (a_5 : addr) (a : addr) (a_4 : addr) : let x : Z := t_1 (shift a_2 10%Z) in let x_1 : Z := t_1 (shift a_3 10%Z) in let x_2 : Z := t_1 (shift a_6 10%Z) in let x_3 : Z := t_1 (shift a_7 10%Z) in let x_4 : Z := t_1 (shift a_11 0%Z) in let x_5 : Z := t_1 (shift a_12 0%Z) in region (base a_8) ≤ 0%Z -> region (base a_9) ≤ 0%Z -> region (base a_10) ≤ 0%Z -> framed t_3 -> linked t -> sconst t_2 -> is_sint32 i -> is_sint32 i_1 -> valid_rw t a_8 3%Z -> valid_rw t a_9 3%Z -> valid_rw t a_10 3%Z -> is_uint32 x -> is_uint32 x_1 -> is_uint32 x_2 -> is_uint32 x_3 -> is_sint32 x_4 -> is_sint32 x_5 -> (Mk_addr 0%Z 0%Z = a_11 -> i = 12%Z) -> (Mk_addr 0%Z 0%Z = a_12 -> i_1 = 12%Z) -> (¬ Mk_addr 0%Z 0%Z = a_11 -> shift a_1 0%Z = a_11) -> (¬ Mk_addr 0%Z 0%Z = a_12 -> shift a_5 0%Z = a_12) -> (¬ Mk_addr 0%Z 0%Z = a_11 -> x_4 = 0%Z) -> (¬ Mk_addr 0%Z 0%Z = a_12 -> x_5 = 1%Z) -> (¬ Mk_addr 0%Z 0%Z = a_11 -> p_valid_io_file_pvt t t_3 t_1 a) -> (¬ Mk_addr 0%Z 0%Z = a_12 -> p_valid_io_file_pvt t t_3 t_1 a_4) -> (¬ Mk_addr 0%Z 0%Z = a_11 -> x = 1%Z ∨ x_1 = 2%Z) -> ¬ (¬ Mk_addr 0%Z 0%Z = a_12 -> x_2 = 1%Z ∨ x_3 = 2%Z).
Proof.
Admitted.
