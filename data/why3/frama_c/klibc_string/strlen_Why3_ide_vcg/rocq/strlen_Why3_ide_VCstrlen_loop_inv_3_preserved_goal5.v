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
Require Import klibc_string.Axiomatic.Axiomatic.
Require Import klibc_string.Compound.Compound.
Require Import Why3.Cint.Cint.
Require Import klibc_string.A_Length.A_Length.
Open Scope Z_scope.
Theorem goal5 (t_1 : addr -> Z) (a : addr) (a_1 : addr) (i_2 : Z) (t : Z -> Z) (i : Z) (i_1 : Z) : let x : Z := t_1 a in let x_1 : Z := base a_1 in let x_2 : Z := offset a_1 in let x_3 : Z := offset a in ¬ x = 0%Z -> x_1 = base a -> 0%Z ≤ i_2 -> region x_1 ≤ 0%Z -> i_2 + x_2 ≤ x_3 -> linked t -> sconst t_1 -> addr_le a_1 a -> is_sint8 x -> p_length_of_str_is t t_1 a_1 i -> p_length_of_str_is t t_1 a_1 i_1 -> addr_le a (shift a_1 (l_length t_1 a_1)) -> (∀(i_3 : Z), 0%Z ≤ i_3 -> i_3 + x_2 < x_3 -> ¬ t_1 (shift a_1 i_3) = 0%Z) -> ¬ t_1 (shift a_1 i_2) = 0%Z.
Proof.
Admitted.
