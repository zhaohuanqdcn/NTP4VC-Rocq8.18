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
Require Import inner_product.Axiomatic1.Axiomatic1.
Require Import inner_product.A_InnerProductAxiomatic.A_InnerProductAxiomatic.
Require Import inner_product.Compound.Compound.
Require Import inner_product.Axiomatic.Axiomatic.
Open Scope Z_scope.
Theorem goal6 (i_2 : Z) (i : Z) (a : addr) (a_1 : addr) (t : Z -> Z) (i_1 : Z) (t_1 : addr -> Z) (fact0 : i_2 ≤ i) (fact1 : 0%Z ≤ i_2) (fact2 : i_2 < i) (fact3 : region (base a) ≤ 0%Z) (fact4 : region (base a_1) ≤ 0%Z) (fact5 : linked t) (fact6 : is_uint32 i) (fact7 : is_uint32 i_2) (fact8 : is_sint32 i_1) (fact9 : p_productbounds t_1 a_1 a i) (fact10 : p_innerproductbounds t_1 a_1 a i i_1) (fact11 : valid_rd t (shift a 0%Z) i) (fact12 : valid_rd t (shift a_1 0%Z) i) (fact13 : is_sint32 (l_innerproduct t_1 a_1 a i_2 i_1)) : valid_rd t (shift a_1 i_2) 1%Z.
Admitted.
