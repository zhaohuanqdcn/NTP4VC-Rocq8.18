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
Require Import rotate.Compound.Compound.
Require Import rotate.Axiomatic.Axiomatic.
Open Scope Z_scope.
Theorem goal4 (a : addr) (t_1 : addr -> Z) (t_3 : addr -> Z) (i_2 : Z) (i_1 : Z) (t : Z -> Z) (i : Z) (t_2 : addr -> Z) : let a_1 : addr := shift a 0%Z in let a_2 : addr -> Z := havoc t_1 t_3 a_1 i_2 in let a_3 : addr := shift a i_2 in let x : Z := i_1 - i_2 in 0%Z < i_2 -> i_2 ≤ i_1 -> i_2 < i_1 -> region (base a) ≤ 0%Z -> i_1 ≤ 4294967295%Z + i_2 -> linked t -> is_uint32 i_1 -> is_uint32 i_2 -> is_sint32 i -> valid_rw t a_1 i_1 -> valid_rw t a_1 i_2 -> p_reverse_5' a_2 t_3 a 0%Z i_2 -> valid_rw t a_3 x ∧ ¬ invalid t a_3 x ∨ valid_rw t a_3 x ∧ ¬ invalid t a_3 x ∧ p_reverse_5' (havoc t_2 a_2 a_3 x) a_2 a_3 0%Z x -> included a_3 x a_1 i_1.
Proof.
Admitted.
