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
Require Import klibc_stdio.Globals.Globals.
Require Import klibc_stdio.Compound.Compound.
Require Import Why3.Cint.Cint.
Require Import klibc_stdio.Axiomatic3.Axiomatic3.
Open Scope Z_scope.
Theorem goal6 (t_1 : addr -> Z) (a_2 : addr) (i : Z) (t_2 : addr -> addr) (t : Z -> Z) (a : addr) (a_1 : addr) : let x : Z := t_1 (shift a_2 8%Z) in ¬ Mk_addr 1723%Z 0%Z = a_2 -> ¬ x = 0%Z -> region 0%Z ≤ 0%Z -> - 1%Z ≤ i -> framed t_2 -> linked t -> is_sint32 i -> is_uint32 x -> p_valid_io_file_pvt t t_2 t_1 a -> p_valid_io_file_pvt t t_2 t_1 a_1 -> ¬ p_valid_io_file_pvt t t_2 t_1 a_2.
Proof.
Admitted.
