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
Require Import klibc_stdio.Globals.Globals.
Require Import klibc_stdio.Compound.Compound.
Require Import klibc_stdio.Axiomatic3.Axiomatic3.
Open Scope Z_scope.
Theorem goal1 (a_2 : addr) (t_1 : addr -> Z) (t_2 : addr -> addr) (t : Z -> Z) (a : addr) (a_1 : addr) (fact0 : ¬ Mk_addr 1723%Z 0%Z = a_2) (fact1 : t_1 (shift a_2 8%Z) = 0%Z) (fact2 : region 0%Z ≤ 0%Z) (fact3 : framed t_2) (fact4 : linked t) (fact5 : p_valid_io_file_pvt t t_2 t_1 a) (fact6 : p_valid_io_file_pvt t t_2 t_1 a_1) (fact7 : p_valid_io_file_pvt t t_2 t_1 a_2) : p_valid_io_file_pvt t t_2 t_1 (t_2 (shift a_2 4%Z)).
Admitted.
