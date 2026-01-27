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
Require Import Why3.Cint.Cint.
Require Import klibc_stdio.Compound.Compound.
Require Import klibc_stdio.Axiomatic3.Axiomatic3.
Open Scope Z_scope.
Theorem goal8 (t_1 : addr -> Z) (a_2 : addr) (a_3 : addr) (a_9 : addr) (a_6 : addr) (a_7 : addr) (a_8 : addr) (t_4 : addr -> addr) (t : Z -> Z) (t_3 : addr -> Z) (i : Z) (i_1 : Z) (i_2 : Z) (t_2 : addr -> Z) (a_4 : addr) (a_5 : addr) (a_10 : addr) (a_1 : addr) (a : addr) : let x : Z := t_1 (shift a_2 10%Z) in let x_1 : Z := t_1 (shift a_3 10%Z) in let x_2 : Z := t_1 (shift a_9 0%Z) in region (base a_6) ≤ 0%Z -> region (base a_7) ≤ 0%Z -> region (base a_8) ≤ 0%Z -> framed t_4 -> linked t -> sconst t_3 -> is_sint32 i -> is_sint32 i_1 -> is_sint32 i_2 -> valid_rw t a_6 3%Z -> valid_rw t a_7 3%Z -> valid_rw t a_8 3%Z -> is_uint32 x -> is_uint32 x_1 -> is_uint32 (t_2 (shift a_4 10%Z)) -> is_uint32 (t_2 (shift a_5 10%Z)) -> is_sint32 x_2 -> is_sint32 (t_2 (shift a_10 0%Z)) -> (Mk_addr 0%Z 0%Z = a_9 -> i_1 = 12%Z) -> (¬ Mk_addr 0%Z 0%Z = a_9 -> shift a_1 0%Z = a_9) -> (¬ Mk_addr 0%Z 0%Z = a_9 -> x_2 = 0%Z) -> (¬ Mk_addr 0%Z 0%Z = a_9 -> p_valid_io_file_pvt t t_4 t_1 a) -> ¬ (¬ Mk_addr 0%Z 0%Z = a_9 -> x = 1%Z ∨ x_1 = 2%Z).
Admitted.
