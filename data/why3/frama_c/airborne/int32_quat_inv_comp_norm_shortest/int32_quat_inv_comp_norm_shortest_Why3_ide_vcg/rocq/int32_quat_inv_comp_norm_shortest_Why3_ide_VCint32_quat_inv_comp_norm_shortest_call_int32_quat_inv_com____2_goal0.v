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
Require Import int32_quat_inv_comp_norm_shortest.Compound.Compound.
Require Import int32_quat_inv_comp_norm_shortest.Axiomatic15.Axiomatic15.
Open Scope Z_scope.
Theorem goal0 (a : addr) (a_1 : addr) (t : Z -> Z) (t_1 : addr -> Z) (fact0 : region (base a) ≤ 0%Z) (fact1 : region (base a_1) ≤ 0%Z) (fact2 : linked t) (fact3 : separated a_1 4%Z a 4%Z) (fact4 : is_sint32 (t_1 (shift a 0%Z))) (fact5 : is_sint32 (t_1 (shift a_1 0%Z))) (fact6 : is_sint32 (t_1 (shift a 1%Z))) (fact7 : is_sint32 (t_1 (shift a_1 1%Z))) (fact8 : is_sint32 (t_1 (shift a 2%Z))) (fact9 : is_sint32 (t_1 (shift a_1 2%Z))) (fact10 : is_sint32 (t_1 (shift a 3%Z))) (fact11 : is_sint32 (t_1 (shift a_1 3%Z))) (fact12 : p_rvalid_bound_int32quat t t_1 a 13777%Z) (fact13 : p_rvalid_bound_int32quat t t_1 a_1 13777%Z) : valid_rd t a_1 4%Z.
Admitted.
