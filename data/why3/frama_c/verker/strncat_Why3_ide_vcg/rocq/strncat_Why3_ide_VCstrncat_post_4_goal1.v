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
Theorem goal1 (t_4 : addr -> Z) (a_3 : addr) (t_5 : addr -> Z) (a_2 : addr) (i : Z) (i_2 : Z) (a : addr) (t_3 : addr -> Z) (a_1 : addr) (i_1 : Z) (i_4 : Z) (t : Z -> Z) (i_3 : Z) (p : bool) (p_1 : bool) (p_2 : bool) (p_3 : bool) (p_4 : bool) (t_1 : Z -> Z) (t_2 : addr -> Z) : let x : Z := l_strlen t_4 a_3 in let x_1 : Z := t_5 a_2 in let a_4 : addr := shift a_3 0%Z in let x_2 : Z := i + i_2 in let x_3 : Z := to_uint64 x_2 in let a_5 : addr := shift a i in let x_4 : Z := t_3 a in let m : addr -> Z := fun_updt t_3 a_1 0%Z in let m_1 : addr -> Z := fun_updt (fun_updt t_3 a_1 x_4) a_2 0%Z in x ≤ i_1 -> region (base a) ≤ 0%Z -> region (base a_3) ≤ 0%Z -> i_1 < x + l_strnlen t_5 a i_4 -> i_4 + x ≤ 18446744073709551615%Z -> linked t -> sconst t_4 -> is_uint64 i -> is_uint64 i_2 -> is_uint64 i_3 -> is_uint64 i_4 -> is_sint8 x_1 -> p_valid_str t t_4 a_3 -> p_valid_strn t t_4 a i_4 -> is_sint8 (t_5 (shift a_2 (- 1%Z))) -> valid_rw t a_4 (1%Z + i_4 + x) -> (if decide (i_4 = 0%Z) then t_5 = t_4 else p = false ∧ p_1 = false ∧ p_2 = false ∧ p_3 = false ∧ p_4 = false ∧ t_1 = t ∧ t_4 a_1 = 0%Z ∧ shift a_3 i_2 = a_1 ∧ x = i_2 ∧ l_strnlen t_4 a i_4 = i ∧ shift a_3 (1%Z + i_2) = a_2 ∧ havoc t_2 t_4 a_1 (1%Z + i) = t_3 ∧ t_5 (shift a_3 x_3) = 0%Z ∧ 0%Z ≤ i_4 ∧ addr_le a a ∧ addr_le a_1 a_1 ∧ addr_le a_3 a_1 ∧ p_valid_str t_1 t_3 a ∧ p_valid_str t_1 t_4 a_1 ∧ p_valid_str t_1 t_4 a_3 ∧ p_valid_str t_1 t_5 a_3 ∧ p_valid_strn t_1 t_4 a i_4 ∧ addr_le a a_5 ∧ addr_le a_1 (shift a_3 x_2) ∧ valid_rw t_1 a_4 (1%Z + x_3) ∧ (if decide (x_4 = 0%Z) then i_4 = i_3 ∧ m = t_5 ∧ (∀(i_5 : Z), let a_6 : addr := shift a_3 i_5 in 0%Z ≤ i_5 -> i_5 < i_2 -> m a_6 = t_4 a_6) else i_3 = 0%Z ∧ m_1 = t_5 ∧ to_uint64 (i_4 - 1%Z) = 0%Z ∧ (∀(i_5 : Z), let a_6 : addr := shift a_3 i_5 in 0%Z ≤ i_5 -> i_5 < i_2 -> m_1 a_6 = t_4 a_6)) ∧ (i_3 = 0%Z -> i_4 = i ∧ x_1 = 0%Z) ∧ (0%Z < i_3 -> i = 0%Z ∧ t_5 a_1 = 0%Z ∧ t_5 (shift a 0%Z) = 0%Z) ∧ ((∀(i_5 : Z), 0%Z ≤ i_5 -> i_5 ≤ i_4 -> ¬ t_4 (shift a i_5) = 0%Z) -> i_4 = i) ∧ ((∃(i_5 : Z), t_4 (shift a i_5) = 0%Z ∧ 0%Z ≤ i_5 ∧ i_5 ≤ i_4) -> t_4 a_5 = 0%Z) ∧ ((∃(i_5 : Z), t_4 (shift a i_5) = 0%Z ∧ 0%Z ≤ i_5 ∧ i_5 ≤ i_4) -> (∀(i_5 : Z), 0%Z ≤ i_5 -> i_5 < i -> ¬ t_4 (shift a i_5) = 0%Z)) ∧ (∀(i_5 : Z), 0%Z ≤ i_5 -> i_5 < i_2 -> ¬ t_4 (shift a_3 i_5) = 0%Z)) -> t_5 (shift a (i_1 - x)) = t_5 (shift a_3 i_1).
Proof.
Admitted.
