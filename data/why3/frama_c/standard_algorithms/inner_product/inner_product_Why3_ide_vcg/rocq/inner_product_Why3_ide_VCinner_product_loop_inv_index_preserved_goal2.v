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
Require Import Why3.Cint.Cint.
Require Import inner_product.Axiomatic1.Axiomatic1.
Require Import inner_product.A_InnerProductAxiomatic.A_InnerProductAxiomatic.
Require Import inner_product.Compound.Compound.
Require Import inner_product.Axiomatic.Axiomatic.
Open Scope Z_scope.
Theorem goal2 (a : addr) (i_2 : Z) (t_1 : addr -> Z) (a_1 : addr) (i_1 : Z) (i : Z) (t : Z -> Z) : let a_2 : addr := shift a i_2 in let x : Z := t_1 a_2 in let a_3 : addr := shift a_1 i_2 in let x_1 : Z := t_1 a_3 in let x_2 : Z := x * x_1 in let x_3 : Z := l_innerproduct t_1 a_1 a i_2 i_1 in let x_4 : Z := x_3 + to_sint32 x_2 in i_2 ≤ i -> 0%Z ≤ i_2 -> i_2 < i -> region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> i_2 ≤ 4294967294%Z -> - 2147483648%Z ≤ x_2 -> x_2 ≤ 2147483647%Z -> - 2147483648%Z ≤ x_4 -> x_4 ≤ 2147483647%Z -> linked t -> is_uint32 i -> is_uint32 i_2 -> is_sint32 i_1 -> is_uint32 (1%Z + i_2) -> p_productbounds t_1 a_1 a i -> is_sint32 x -> is_sint32 x_1 -> p_innerproductbounds t_1 a_1 a i i_1 -> valid_rd t (shift a 0%Z) i -> valid_rd t a_2 1%Z -> valid_rd t (shift a_1 0%Z) i -> valid_rd t a_3 1%Z -> is_sint32 x_3 -> - 1%Z ≤ i_2.
Proof.
Admitted.
