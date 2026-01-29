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
Theorem goal8 (a : addr) (t_5 : addr -> Z) (a_1 : addr) (t_7 : addr -> Z) (t_8 : addr -> Z) (t_1 : addr -> Z) (t : Z -> Z) (i : Z) (i_1 : Z) (t_12 : addr -> Z) (p : bool) (p_2 : bool) (t_9 : addr -> Z) (t_3 : addr -> Z) (t_4 : addr -> Z) (t_2 : addr -> Z) (p_1 : bool) (p_3 : bool) (t_6 : addr -> Z) (t_10 : addr -> Z) (t_11 : addr -> Z) : let a_2 : addr := shift a 0%Z in let x : Z := t_5 a_1 in let x_1 : Z := t_7 a_1 in let a_3 : addr := shift a 1%Z in let x_2 : Z := t_8 a_3 in let x_3 : Z := l_tolower x_2 in t_1 a_1 = 0%Z -> t_8 a_2 = 48%Z -> region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> linked t -> sconst t_8 -> is_uint8 i -> is_sint8 i_1 -> is_uint32 x -> is_uint32 x_1 -> p_is_dec t_12 a -> valid_rw t a_1 1%Z -> is_sint8 x_2 -> valid_rd t a_2 3%Z -> is_sint8 x_3 -> (if decide (x_3 = 120%Z) then p = true ∧ p_2 = true ∧ p_isxdigit (t_9 (shift a 2%Z)) = (¬ i = 0%Z) ∧ (if decide (i = 0%Z) then fun_updt t_3 a_1 8%Z = t_5 else fun_updt t_4 a_1 16%Z = t_5) else p = true ∧ p_2 = true ∧ fun_updt t_2 a_1 8%Z = t_5) -> (if decide (x = 16%Z) then (p_1 = true) = (p = true) ∧ (p_3 = true) = (p_2 = true) ∧ t_6 = t_5 ∧ (if decide (t_10 a_2 = 48%Z) then p_1 = true ∧ p_3 = true ∧ t_11 = t_10 ∧ l_tolower (t_11 a_3) = i_1 else p_1 = true ∧ p_3 = true ∧ t_7 = t_6 ∧ t_12 = t_10) else p = true ∧ p_2 = true ∧ t_7 = t_5) -> x_1 = 10%Z.
Proof.
Admitted.
