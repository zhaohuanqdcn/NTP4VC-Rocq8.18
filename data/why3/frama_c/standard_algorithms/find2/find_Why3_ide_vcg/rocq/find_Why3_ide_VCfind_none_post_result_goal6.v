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
Require Import find2.Compound.Compound.
Require Import Why3.Cint.Cint.
Require Import find2.Axiomatic.Axiomatic.
Open Scope Z_scope.
Theorem goal6 (a : addr) (i_1 : Z) (t_1 : addr -> Z) (i : Z) (t : Z -> Z) : let a_1 : addr := shift a i_1 in let x : Z := t_1 a_1 in 0%Z ≤ i_1 -> i_1 < i -> region (base a) ≤ 0%Z -> linked t -> is_uint32 i -> is_uint32 i_1 -> is_sint32 x -> valid_rd t (shift a 0%Z) i -> valid_rd t a_1 1%Z -> ¬ p_hasvalue_1' t_1 a 0%Z i x -> p_hasvalue_1' t_1 a 0%Z i_1 x.
Proof.
Admitted.
