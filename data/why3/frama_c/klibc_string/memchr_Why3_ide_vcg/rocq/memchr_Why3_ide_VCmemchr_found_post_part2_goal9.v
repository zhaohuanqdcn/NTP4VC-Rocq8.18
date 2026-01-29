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
Require Import klibc_string.Compound.Compound.
Require Import Why3.Cint.Cint.
Require Import klibc_string.Axiomatic1.Axiomatic1.
Require Import klibc_string.A_Length.A_Length.
Require Import klibc_string.Axiomatic.Axiomatic.
Open Scope Z_scope.
Theorem goal9 (t_1 : addr -> Z) (a : addr) (i_1 : Z) (i : Z) (i_2 : Z) (t : Z -> Z) : let x : Z := t_1 (shift a i_1) in let a_1 : addr := shift a i in x = to_sint8 i_2 -> 0%Z < i -> 0%Z ≤ i_1 -> i_1 < i -> region (base a) ≤ 0%Z -> - 128%Z ≤ i_2 -> i_2 ≤ 127%Z -> linked t -> sconst t_1 -> is_uint32 i -> is_sint32 i_2 -> is_sint8 (t_1 (Mk_addr 0%Z 0%Z)) -> addr_le a a_1 -> addr_le a_1 a_1 -> is_sint8 (t_1 a_1) -> valid_rw t (shift a 0%Z) i -> (∀(i_3 : Z), 0%Z ≤ i_3 -> i_3 < i -> ¬ x = t_1 (shift a i_3)) -> (∃(i_3 : Z), shift a i_3 = Mk_addr 0%Z 0%Z ∧ p_exists_first_occurence_of_char t t_1 a i_2 i_3).
Proof.
Admitted.
