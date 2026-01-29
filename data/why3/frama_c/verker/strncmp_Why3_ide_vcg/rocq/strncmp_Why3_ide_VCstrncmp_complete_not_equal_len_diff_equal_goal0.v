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
Require Import verker.Axiomatic3.Axiomatic3.
Require Import Why3.Memory.Memory.
Require Import Why3.Cint.Cint.
Require Import verker.A_Strnlen.A_Strnlen.
Require Import verker.Compound.Compound.
Require Import verker.A_Strlen.A_Strlen.
Open Scope Z_scope.
Theorem goal0 (t_1 : addr -> Z) (a_1 : addr) (i : Z) (a : addr) (t : Z -> Z) : let x : Z := l_strnlen t_1 a_1 i in let x_1 : Z := l_strnlen t_1 a i in region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> linked t -> sconst t_1 -> is_uint64 i -> p_valid_strn t t_1 a i -> p_valid_strn t t_1 a_1 i -> i = 0%Z ∨ x = x_1 ∧ 0%Z < i ∧ (∀(i_1 : Z), 0%Z ≤ i_1 -> i_1 < x -> t_1 (shift a_1 i_1) = t_1 (shift a i_1)) ∨ ¬ x = x_1 ∧ 0%Z < i ∧ (∀(i_1 : Z), 0%Z ≤ i_1 -> i_1 < x -> t_1 (shift a_1 i_1) = t_1 (shift a i_1)) ∨ 0%Z < i ∧ (∃(i_1 : Z), ¬ t_1 (shift a_1 i_1) = t_1 (shift a i_1) ∧ 0%Z ≤ i_1 ∧ i_1 < x).
Proof.
Admitted.
