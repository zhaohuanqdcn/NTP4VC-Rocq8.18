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
Theorem goal27 (a_2 : addr) (t_1 : addr -> Z) (a_1 : addr) (i_1 : Z) (i_4 : Z) (a : addr) (i_2 : Z) (i_5 : Z) (i : Z) (t_3 : addr -> addr) (t : Z -> Z) (t_2 : addr -> Z) (i_3 : Z) : let x : Z := base a_2 in let x_1 : Z := t_1 (shift a_1 9%Z) in let x_2 : Z := t_1 (shift (shift a_1 0%Z) 0%Z) in ¬ i_1 = - 1%Z -> ¬ i_1 = 0%Z -> ¬ i_4 = 0%Z -> x = base a -> t_1 (shift a_1 7%Z) = 0%Z -> 0%Z ≤ i_2 -> 0%Z ≤ i_4 -> i_1 ≤ i_4 -> i_2 ≤ i_4 -> 0%Z ≤ i_5 -> i_4 ≤ i_5 -> 0%Z < x_1 -> x_1 ≤ i_4 -> region (base a_1) ≤ 0%Z -> region x ≤ 0%Z -> 0%Z ≤ x_2 -> - 1%Z ≤ i -> - 1%Z ≤ i_1 -> framed t_3 -> linked t -> sconst t_2 -> is_uint32 i_2 -> is_uint32 i_4 -> is_uint32 i_5 -> is_sint32 i -> is_sint32 i_1 -> is_sint32 i_3 -> addr_le a_2 a -> is_uint32 x_1 -> p_valid_io_file_pvt t t_3 t_1 a_1 -> addr_le a (shift a_2 i_5) -> valid_rw t (shift a 0%Z) i_4 -> valid_rw t (shift a_2 0%Z) i_5 -> is_sint32 x_2 -> (i = - 1%Z -> i_3 = 4%Z ∨ i_3 = 11%Z) -> i_2 ≤ to_uint32 (i_4 - to_uint32 i_1).
Proof.
Admitted.
