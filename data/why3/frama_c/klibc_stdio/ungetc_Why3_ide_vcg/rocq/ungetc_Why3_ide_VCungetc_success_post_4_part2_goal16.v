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
Theorem goal16 (a_2 : addr) (a : addr) (t_1 : addr -> Z) (a_4 : addr) (a_7 : addr) (i : Z) (t_3 : addr -> addr) (t : Z -> Z) (t_2 : addr -> Z) (a_1 : addr) (a_3 : addr) (a_5 : addr) (a_6 : addr) (fact0 : shift a_2 0%Z = shift a 0%Z) (fact1 : t_1 (shift a_4 8%Z) = 0%Z) (fact2 : t_1 (shift a_7 8%Z) = 0%Z) (fact3 : region (base a_2) ≤ 0%Z) (fact4 : - 128%Z ≤ i) (fact5 : i ≤ 127%Z) (fact6 : framed t_3) (fact7 : linked t) (fact8 : sconst t_2) (fact9 : is_sint32 i) (fact10 : p_valid_io_file_pvt t t_3 t_1 a_1) (fact11 : p_valid_io_file_pvt t t_3 t_1 a_3) (fact12 : ¬ addr_le (t_3 (shift a_5 6%Z)) (t_3 (shift a_6 5%Z))) (fact13 : addr_le (t_3 (shift a_7 6%Z)) (t_3 (shift a_7 5%Z))) : i = - 1%Z.
Proof.
Admitted.
