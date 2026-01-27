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
Theorem goal18 (i : Z) (a_2 : addr) (a : addr) (t_1 : addr -> Z) (a_4 : addr) (a_5 : addr) (t_3 : addr -> addr) (t : Z -> Z) (t_2 : addr -> Z) (a_1 : addr) (a_3 : addr) (fact0 : ¬ i = 0%Z) (fact1 : shift a_2 0%Z = shift a 0%Z) (fact2 : t_1 (shift a_4 10%Z) = 2%Z) (fact3 : 0%Z ≤ i) (fact4 : region (base a_2) ≤ 0%Z) (fact5 : region (base a_5) ≤ 0%Z) (fact6 : framed t_3) (fact7 : linked t) (fact8 : sconst t_2) (fact9 : is_uint32 i) (fact10 : p_valid_io_file_pvt t t_3 t_1 a_1) (fact11 : p_valid_io_file_pvt t t_3 t_1 a_3) (fact12 : valid_rw t (shift a_5 0%Z) i) : p_valid_io_file_pvt t t_3 t_1 a_4.
Admitted.
