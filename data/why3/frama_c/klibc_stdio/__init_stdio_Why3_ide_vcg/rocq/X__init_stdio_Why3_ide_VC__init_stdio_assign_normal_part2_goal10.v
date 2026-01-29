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
Theorem goal10 (t_1 : addr -> Z) (a_2 : addr) (a_3 : addr) (a_7 : addr) (a_4 : addr) (a_5 : addr) (a_6 : addr) (t_3 : addr -> addr) (t : Z -> Z) (t_2 : addr -> Z) (i : Z) (a_1 : addr) (a : addr) : let x : Z := t_1 (shift a_2 10%Z) in let x_1 : Z := t_1 (shift a_3 10%Z) in let x_2 : Z := t_1 (shift a_7 0%Z) in region (base a_4) ≤ 0%Z -> region (base a_5) ≤ 0%Z -> region (base a_6) ≤ 0%Z -> framed t_3 -> linked t -> sconst t_2 -> is_sint32 i -> valid_rw t a_4 3%Z -> valid_rw t a_5 3%Z -> valid_rw t a_6 3%Z -> is_uint32 x -> is_uint32 x_1 -> is_sint32 x_2 -> (Mk_addr 0%Z 0%Z = a_7 -> i = 12%Z) -> (¬ Mk_addr 0%Z 0%Z = a_7 -> shift a_1 0%Z = a_7) -> (¬ Mk_addr 0%Z 0%Z = a_7 -> x_2 = 0%Z) -> (¬ Mk_addr 0%Z 0%Z = a_7 -> p_valid_io_file_pvt t t_3 t_1 a) -> ¬ (¬ Mk_addr 0%Z 0%Z = a_7 -> x = 1%Z ∨ x_1 = 2%Z).
Proof.
Admitted.
