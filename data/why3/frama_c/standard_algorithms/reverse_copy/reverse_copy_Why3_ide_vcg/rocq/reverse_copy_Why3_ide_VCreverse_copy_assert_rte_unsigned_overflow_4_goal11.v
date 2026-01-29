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
Require Import reverse_copy.Compound.Compound.
Require Import reverse_copy.Axiomatic.Axiomatic.
Open Scope Z_scope.
Theorem goal11 (i : Z) (a_1 : addr) (a : addr) (i_1 : Z) (t : Z -> Z) (t_2 : addr -> Z) (t_1 : addr -> Z) : let x : Z := to_uint32 (i - 1%Z) in let a_2 : addr := shift a_1 0%Z in let a_3 : addr := shift a 0%Z in 0%Z < i -> i_1 ≤ i -> 0%Z ≤ i_1 -> i_1 < i -> region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> i_1 ≤ x -> x ≤ 4294967295%Z + i_1 -> linked t -> is_uint32 i -> is_uint32 i_1 -> valid_rd t a_2 i -> valid_rw t a_3 i -> valid_rw t (shift a i_1) 1%Z -> separated a_2 i a_3 i -> p_reverse_2' t_2 (havoc t_1 t_2 a_3 i) a 0%Z i_1 a_1 (i - i_1) -> valid_rd t (shift a_1 (to_uint32 (x - i_1))) 1%Z -> i_1 ≤ 4294967294%Z.
Proof.
Admitted.
