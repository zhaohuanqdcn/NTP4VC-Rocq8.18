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
Require Import klibc_string.Compound.Compound.
Open Scope Z_scope.
Theorem goal0 (a_4 : addr) (a_5 : addr) (i : Z) (i_1 : Z) (t : Z -> Z) (t_1 : addr -> Z) (a_3 : addr) (a_2 : addr) (a_1 : addr) (a : addr) : let a_6 : addr := shift a_4 0%Z in let a_7 : addr := shift a_5 0%Z in 0%Z ≤ i -> 0%Z ≤ i_1 -> region (base a_4) ≤ 0%Z -> region (base a_5) ≤ 0%Z -> linked t -> is_uint32 i -> is_uint32 i_1 -> valid_rw t a_6 i_1 -> valid_rw t a_7 i -> separated a_7 i a_6 i_1 -> i = 0%Z ∨ i_1 = 0%Z ∨ i < i_1 ∨ ¬ i = 0%Z ∧ ¬ i_1 = 0%Z ∧ i_1 ≤ i ∧ (∀(i_2 : Z), 0%Z ≤ i_2 -> i_2 + i_1 ≤ i -> (∃(i_3 : Z), ¬ t_1 (shift a_3 (i_3 + i_2)) = t_1 (shift a_2 i_3) ∧ 0%Z ≤ i_3 ∧ i_3 < i_1)) ∨ ¬ i = 0%Z ∧ ¬ i_1 = 0%Z ∧ i_1 ≤ i ∧ (∃(i_2 : Z), 0%Z ≤ i_2 ∧ i_2 + i_1 ≤ i ∧ (∀(i_3 : Z), 0%Z ≤ i_3 -> i_3 < i_1 -> t_1 (shift a_1 (i_3 + i_2)) = t_1 (shift a i_3))).
Proof.
Admitted.
