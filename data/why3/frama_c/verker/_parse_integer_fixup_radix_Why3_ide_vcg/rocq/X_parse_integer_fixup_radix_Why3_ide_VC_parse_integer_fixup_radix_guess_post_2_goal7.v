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
Require Import Why3.Cint.Cint.
Require Import verker.A_Ctype.A_Ctype.
Require Import verker.A_IntBase.A_IntBase.
Open Scope Z_scope.
Theorem goal7 (t_6 : addr -> Z) (a_1 : addr) (t_8 : addr -> Z) (a : addr) (t_9 : addr -> Z) (t_1 : addr -> Z) (t : Z -> Z) (i : Z) (i_1 : Z) (i_2 : Z) (t_15 : addr -> Z) (t_10 : addr -> Z) (p : bool) (p_2 : bool) (t_11 : addr -> Z) (t_4 : addr -> Z) (t_5 : addr -> Z) (t_3 : addr -> Z) (t_2 : addr -> Z) (t_12 : addr -> Z) (p_1 : bool) (p_3 : bool) (t_7 : addr -> Z) (t_13 : addr -> Z) (t_14 : addr -> Z) : let x : Z := t_6 a_1 in let x_1 : Z := t_8 a_1 in let a_2 : addr := shift a 0%Z in let x_2 : Z := t_9 a_2 in let a_3 : addr := shift a 1%Z in t_1 a_1 = 0%Z -> region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> linked t -> sconst t_9 -> is_uint8 i -> is_sint8 i_1 -> is_sint8 i_2 -> is_uint32 x -> is_uint32 x_1 -> p_is_oct t_15 a -> valid_rw t a_1 1%Z -> is_sint8 x_2 -> valid_rd t a_2 3%Z -> (if decide (x_2 = 48%Z) then t_10 = t_9 ∧ l_tolower (t_10 a_3) = i_1 ∧ (if decide (i_1 = 120%Z) then p = true ∧ p_2 = true ∧ p_isxdigit (t_11 (shift a 2%Z)) = (¬ i = 0%Z) ∧ (if decide (i = 0%Z) then fun_updt t_4 a_1 8%Z = t_6 else fun_updt t_5 a_1 16%Z = t_6) else p = true ∧ p_2 = true ∧ fun_updt t_3 a_1 8%Z = t_6) else p = true ∧ p_2 = true ∧ t_2 = t_1 ∧ t_12 = t_9 ∧ fun_updt t_2 a_1 10%Z = t_6) -> (if decide (x = 16%Z) then (p_1 = true) = (p = true) ∧ (p_3 = true) = (p_2 = true) ∧ t_7 = t_6 ∧ t_13 = t_12 ∧ (if decide (t_13 a_2 = 48%Z) then p_1 = true ∧ p_3 = true ∧ t_14 = t_13 ∧ l_tolower (t_14 a_3) = i_2 else p_1 = true ∧ p_3 = true ∧ t_8 = t_7 ∧ t_15 = t_13) else p = true ∧ p_2 = true ∧ t_8 = t_6 ∧ t_15 = t_12) -> x_1 = 8%Z.
Proof.
Admitted.
