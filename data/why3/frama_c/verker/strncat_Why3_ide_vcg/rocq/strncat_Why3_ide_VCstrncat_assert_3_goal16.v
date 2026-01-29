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
Theorem goal16 (t_2 : addr -> Z) (a : addr) (a_1 : addr) (i_2 : Z) (t_1 : addr -> Z) (i_3 : Z) (i_1 : Z) (i : Z) (t : Z -> Z) (t_3 : addr -> Z) (a_2 : addr) (p : bool) : let x : Z := l_strlen t_2 a in let a_3 : addr := shift a x in let x_1 : Z := l_strnlen t_2 a_1 i_2 in let a_4 : addr := shift a_1 x_1 in let x_2 : Z := t_2 a_4 in let a_5 : addr -> Z := havoc t_1 t_2 a_3 (1%Z + x_1) in let a_6 : Z := a_5 a_1 in let a_7 : addr -> Z := havoc t_1 t_2 a_3 (1%Z + l_strnlen t_2 a_1 i_3) in let a_8 : addr := shift a i_1 in let a_9 : addr := shift a i in ¬ i_2 = 0%Z -> t_2 a_3 = 0%Z -> 0%Z ≤ i_2 -> region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> i_2 + x ≤ 18446744073709551615%Z -> linked t -> sconst t_2 -> is_uint64 i_2 -> is_uint64 i_3 -> addr_le a_1 a_1 -> is_sint8 (t_3 a_2) -> p_valid_str t t_2 a -> is_uint64 x -> p_valid_strn t t_2 a_1 i_2 -> is_sint8 (t_3 (shift a_2 (- 1%Z))) -> is_uint64 x_1 -> addr_le a a_3 -> addr_le a_3 a_3 -> addr_le a_1 a_4 -> is_sint8 x_2 -> p_valid_str t t_2 a_3 -> valid_rw t (shift a 0%Z) (1%Z + i_2 + x) -> addr_le a_3 (shift a (x + x_1)) -> is_sint8 a_6 -> p_valid_str t a_5 a_1 -> (if decide (a_6 = 0%Z) then p = false ∧ fun_updt a_5 a_3 0%Z = t_3 ∧ 0%Z ≤ i ∧ i < x else p = true ∧ i_3 = i_2 ∧ to_uint64 (i_3 - 1%Z) = 0%Z ∧ shift a (1%Z + x) = a_2 ∧ fun_updt (fun_updt a_7 a_3 (a_7 a_1)) a_2 0%Z = t_3 ∧ 0%Z ≤ i_1 ∧ i_1 < x) -> ((∀(i_4 : Z), 0%Z ≤ i_4 -> i_4 ≤ i_2 -> ¬ t_2 (shift a_1 i_4) = 0%Z) -> x_1 = i_2) -> ((∃(i_4 : Z), t_2 (shift a_1 i_4) = 0%Z ∧ 0%Z ≤ i_4 ∧ i_4 ≤ i_2) -> x_2 = 0%Z) -> ((∃(i_4 : Z), t_2 (shift a_1 i_4) = 0%Z ∧ 0%Z ≤ i_4 ∧ i_4 ≤ i_2) -> (∀(i_4 : Z), 0%Z ≤ i_4 -> i_4 < x_1 -> ¬ t_2 (shift a_1 i_4) = 0%Z)) -> (∀(i_4 : Z), 0%Z ≤ i_4 -> i_4 < x -> ¬ t_2 (shift a i_4) = 0%Z) -> (if decide (p = true) then t_3 a_8 = t_2 a_8 else t_3 a_9 = t_2 a_9).
Proof.
Admitted.
