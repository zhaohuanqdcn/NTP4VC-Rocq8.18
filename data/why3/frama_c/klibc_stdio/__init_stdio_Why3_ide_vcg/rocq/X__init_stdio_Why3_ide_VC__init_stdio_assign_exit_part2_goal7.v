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
Open Scope Z_scope.
Theorem goal7 (a_2 : addr) (a_3 : addr) (a_4 : addr) (t_3 : addr -> addr) (t : Z -> Z) (t_2 : addr -> Z) (i : Z) (i_1 : Z) (t_1 : addr -> Z) (a : addr) (a_1 : addr) (a_5 : addr) (fact0 : region (base a_2) ≤ 0%Z) (fact1 : region (base a_3) ≤ 0%Z) (fact2 : region (base a_4) ≤ 0%Z) (fact3 : framed t_3) (fact4 : linked t) (fact5 : sconst t_2) (fact6 : is_sint32 i) (fact7 : is_sint32 i_1) (fact8 : valid_rw t a_2 3%Z) (fact9 : valid_rw t a_3 3%Z) (fact10 : valid_rw t a_4 3%Z) (fact11 : is_uint32 (t_1 (shift a 10%Z))) (fact12 : is_uint32 (t_1 (shift a_1 10%Z))) : ¬ is_sint32 (t_1 (shift a_5 0%Z)).
Admitted.
