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
Require Import klibc_string.Axiomatic.Axiomatic.
Require Import klibc_string.Compound.Compound.
Require Import klibc_string.A_Length.A_Length.
Open Scope Z_scope.
Theorem goal3 (a : addr) (a_1 : addr) (t_2 : Z -> Z) (t_3 : addr -> Z) (i : Z) (i_1 : Z) (i_3 : Z) (i_2 : Z) (i_4 : Z) (t_1 : Z -> Z) (t : Z -> Z) (fact0 : region (base a) ≤ 0%Z) (fact1 : region (base a_1) ≤ 0%Z) (fact2 : linked t_2) (fact3 : sconst t_3) (fact4 : is_sint32 i) (fact5 : is_sint8 (t_3 a_1)) (fact6 : p_length_of_str_is t_2 t_3 a i_1) (fact7 : p_length_of_str_is t_2 t_3 a i_3) (fact8 : p_length_of_str_is t_2 t_3 a_1 i_2) (fact9 : p_length_of_str_is t_2 t_3 a_1 i_4) (fact10 : separated (shift a 0%Z) (1%Z + l_length t_3 a) (shift a_1 0%Z) (1%Z + l_length t_3 a_1)) (fact11 : i = 0%Z ∨ i = 1%Z) (fact12 : ∀(i_5 : Z), 0%Z ≤ i_5 -> i_5 ≤ 255%Z -> t_1 i_5 = 0%Z) (fact13 : ∀(i_5 : Z), 0%Z ≤ i_5 -> i_5 ≤ 255%Z -> i_5 < 0%Z ∨ 256%Z ≤ i_5 -> t_1 i_5 = t i_5) : addr_le a_1 a_1.
Proof.
Admitted.
