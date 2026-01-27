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
Require Import klibc_stdio.Globals.Globals.
Require Import Why3.Cint.Cint.
Require Import klibc_stdio.Axiomatic.Axiomatic.
Open Scope Z_scope.
Theorem goal2 (i_5 : Z) (a : addr) (a_1 : addr) (t_2 : addr -> addr) (t : Z -> Z) (t_1 : addr -> Z) (i : Z) (i_3 : Z) (i_4 : Z) (i_1 : Z) (i_2 : Z) (fact0 : 0%Z ≤ i_5) (fact1 : region (base a) ≤ 0%Z) (fact2 : region (base a_1) ≤ 0%Z) (fact3 : framed t_2) (fact4 : linked t) (fact5 : sconst t_1) (fact6 : is_sint32 i_5) (fact7 : p_length_of_str_is t t_1 a i) (fact8 : p_length_of_str_is t t_1 a i_3) (fact9 : p_length_of_str_is t t_1 a i_4) (fact10 : p_length_of_str_is t t_1 a_1 i_1) (fact11 : p_length_of_str_is t t_1 a_1 i_2) : Mk_addr 0%Z 0%Z = a ∨ (∃(i_6 : Z), p_length_of_str_is (fun_updt t 38235%Z 1%Z) t_1 a i_6).
Admitted.
