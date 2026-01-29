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
Require Import verker.Compound.Compound.
Require Import verker.A_Strlen.A_Strlen.
Require Import Why3.Cint.Cint.
Require Import verker.A_Strnlen.A_Strnlen.
Open Scope Z_scope.
Theorem goal27 (i : Z) (t_2 : addr -> Z) (a : addr) (a_1 : addr) (t_1 : addr -> Z) (t : Z -> Z) : let x : Z := to_uint64 (i - 1%Z) in let x_1 : Z := l_strlen t_2 a in let a_2 : addr := shift a x_1 in let x_2 : Z := l_strnlen t_2 a_1 i in let a_3 : addr -> Z := havoc t_1 t_2 a_2 (1%Z + x_2) in let a_4 : Z := a_3 a_1 in let a_5 : addr := shift a_1 x_2 in let x_3 : Z := t_2 a_5 in ¬ i = 0%Z -> ¬ x = 0%Z -> t_2 a_2 = 0%Z -> ¬ a_4 = 0%Z -> 0%Z ≤ i -> region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> i + x_1 ≤ 18446744073709551615%Z -> linked t -> sconst t_2 -> is_uint64 i -> addr_le a_1 a_1 -> p_valid_str t t_2 a -> is_uint64 x_1 -> p_valid_strn t t_2 a_1 i -> is_uint64 x_2 -> addr_le a a_2 -> addr_le a_2 a_2 -> addr_le a_1 a_5 -> is_sint8 x_3 -> p_valid_str t t_2 a_2 -> valid_rw t (shift a 0%Z) (1%Z + i + x_1) -> addr_le a_2 (shift a (x_1 + x_2)) -> is_sint8 a_4 -> p_valid_str t a_3 a_1 -> ((∀(i_1 : Z), 0%Z ≤ i_1 -> i_1 ≤ i -> ¬ t_2 (shift a_1 i_1) = 0%Z) -> x_2 = i) -> ((∃(i_1 : Z), t_2 (shift a_1 i_1) = 0%Z ∧ 0%Z ≤ i_1 ∧ i_1 ≤ i) -> x_3 = 0%Z) -> ((∃(i_1 : Z), t_2 (shift a_1 i_1) = 0%Z ∧ 0%Z ≤ i_1 ∧ i_1 ≤ i) -> (∀(i_1 : Z), 0%Z ≤ i_1 -> i_1 < x_2 -> ¬ t_2 (shift a_1 i_1) = 0%Z)) -> (∀(i_1 : Z), 0%Z ≤ i_1 -> i_1 < x_1 -> ¬ t_2 (shift a i_1) = 0%Z) -> x < i.
Proof.
Admitted.
