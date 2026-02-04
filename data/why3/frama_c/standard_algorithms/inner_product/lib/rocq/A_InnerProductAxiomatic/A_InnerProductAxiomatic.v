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
Require Import inner_product.Compound.Compound.
Require Import inner_product.Axiomatic.Axiomatic.
Open Scope Z_scope.
Axiom l_innerproduct : (addr -> Z) -> addr -> addr -> Z -> Z -> Z.
Axiom Q_InnerProductEmpty : forall  (n : Z) (init_0 : Z) (mint_0 : addr -> Z) (a : addr) (b : addr) (fact0 : n ≤ 0%Z) (fact1 : is_sint32 init_0), l_innerproduct mint_0 a b n init_0 = init_0.
Axiom Q_InnerProductNext : forall  (n : Z) (init_0 : Z) (mint_0 : addr -> Z) (a : addr) (b : addr), 0%Z < n -> is_sint32 init_0 -> l_innerproduct mint_0 a b (n - 1%Z) init_0 + mint_0 (shift a (n - 1%Z)) * mint_0 (shift b (n - 1%Z)) = l_innerproduct mint_0 a b n init_0.
Axiom Q_InnerProductRead : forall  (init_0 : Z) (mint_0 : addr -> Z) (mint_1 : addr -> Z) (a : addr) (n : Z) (b : addr) (fact0 : is_sint32 init_0) (fact1 : p_unchanged_1' mint_0 mint_1 a 0%Z n) (fact2 : p_unchanged_1' mint_0 mint_1 b 0%Z n), l_innerproduct mint_1 a b n init_0 = l_innerproduct mint_0 a b n init_0.
