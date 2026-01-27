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
Require Import klibc_stdio.Axiomatic.Axiomatic.
Require Import klibc_stdio.Compound.Compound.
Require Import Why3.Cint.Cint.
Require Import klibc_stdio.A_Length.A_Length.
Open Scope Z_scope.
Theorem goal1 (a_1 : addr) (a_2 : addr) (t_2 : addr -> addr) (t : Z -> Z) (t_1 : addr -> Z) (i : Z) (a : addr) (fact0 : region (base a_1) ≤ 0%Z) (fact1 : region (base a_2) ≤ 0%Z) (fact2 : framed t_2) (fact3 : linked t) (fact4 : sconst t_1) (fact5 : is_sint32 (l_length t_1 a_1)) (fact6 : p_length_of_str_is t t_1 a_1 i) : shift a 0%Z = a_2.
Admitted.
