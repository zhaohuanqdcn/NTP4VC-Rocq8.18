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
Require Import lower_bound.Axiomatic.Axiomatic.
Require Import lower_bound.Compound.Compound.
Open Scope Z_scope.
Theorem goal0 (i_3 : Z) (i_1 : Z) (i_2 : Z) (a : addr) (t : Z -> Z) (i : Z) (t_1 : addr -> Z) (fact0 : i_3 ≤ i_1) (fact1 : i_1 ≤ i_2) (fact2 : 0%Z ≤ i_3) (fact3 : i_1 ≤ i_3) (fact4 : region (base a) ≤ 0%Z) (fact5 : linked t) (fact6 : is_uint32 i_1) (fact7 : is_uint32 i_2) (fact8 : is_uint32 i_3) (fact9 : is_sint32 i) (fact10 : p_sorted_1' t_1 a 0%Z i_2) (fact11 : p_lowerbound_1' t_1 a i_1 i_2 i) (fact12 : p_strictupperbound_1' t_1 a 0%Z i_3 i) (fact13 : valid_rd t (shift a 0%Z) i_2) : i_3 ≤ i_2.
Admitted.
