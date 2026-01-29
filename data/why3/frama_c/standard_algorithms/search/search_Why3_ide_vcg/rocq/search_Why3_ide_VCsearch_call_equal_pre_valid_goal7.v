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
Require Import search.Compound.Compound.
Require Import search.Axiomatic.Axiomatic.
Open Scope Z_scope.
Theorem goal7 (i : Z) (i_2 : Z) (i_1 : Z) (a : addr) (a_1 : addr) (t : Z -> Z) (t_1 : addr -> Z) : let x : Z := i + i_2 in i ≤ i_1 -> x ≤ i_1 -> region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> i_1 ≤ 4294967295%Z + i -> x ≤ 1%Z + i_1 -> linked t -> is_uint32 i -> is_uint32 i_1 -> is_uint32 i_2 -> valid_rd t (shift a 0%Z) i -> valid_rd t (shift a_1 0%Z) i_1 -> ¬ p_hassubrange_1' t_1 a_1 0%Z (i + i_2 - 1%Z) a i -> valid_rd t (shift a_1 i_2) i.
Proof.
Admitted.
