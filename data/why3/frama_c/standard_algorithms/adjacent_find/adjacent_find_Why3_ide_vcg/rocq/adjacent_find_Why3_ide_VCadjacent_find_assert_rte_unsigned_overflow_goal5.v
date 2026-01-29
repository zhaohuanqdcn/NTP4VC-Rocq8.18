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
Require Import adjacent_find.Compound.Compound.
Require Import adjacent_find.Axiomatic.Axiomatic.
Open Scope Z_scope.
Theorem goal5 (i_1 : Z) (i : Z) (a : addr) (t : Z -> Z) (t_1 : addr -> Z) : let x : Z := 1%Z + i_1 in 0%Z ≤ i_1 -> i_1 < i -> region (base a) ≤ 0%Z -> 2%Z ≤ i -> linked t -> is_uint32 i -> is_uint32 i_1 -> is_sint32 (t_1 (shift a i_1)) -> valid_rd t (shift a 0%Z) i -> ¬ p_hasequalneighbors t_1 a x -> is_sint32 (t_1 (shift a x)) -> i_1 ≤ 4294967294%Z.
Proof.
Admitted.
