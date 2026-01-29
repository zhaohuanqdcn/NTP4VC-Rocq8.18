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
Require Import Why3.Cbits.Cbits.
Require Import verker.A_Strlen.A_Strlen.
Require Import verker.Compound.Compound.
Open Scope Z_scope.
Theorem goal0 (t_2 : addr -> Z) (a_1 : addr) (t_3 : addr -> Z) (t_4 : addr -> Z) (i_6 : Z) (i_2 : Z) (i_1 : Z) (i : Z) (a : addr) (a_2 : addr) (t : Z -> Z) (t_1 : addr -> Z) (i_3 : Z) (i_4 : Z) (i_5 : Z) (p_2 : bool) (p_1 : bool) (p : bool) : let x : Z := t_2 a_1 in let x_1 : Z := t_3 a_1 in let x_2 : Z := t_4 a_1 in let x_3 : Z := to_uint32 (i_6 - 87%Z) in ¬ x = 0%Z -> Z.quot i_2 2%Z = 0%Z -> ¬ land 17293822569102704640%Z i_1 = 0%Z -> i < 0%Z -> region (base a) ≤ 0%Z -> region (base a_2) ≤ 0%Z -> i_2 ≤ 16%Z -> linked t -> sconst t_1 -> is_sint8 i_3 -> is_sint8 i_4 -> is_sint8 i_5 -> is_sint8 i_6 -> is_uint32 i -> is_uint32 i_2 -> is_uint64 i_1 -> is_sint8 x -> is_sint8 x_1 -> is_sint8 x_2 -> valid_rw t a_2 1%Z -> p_valid_str t t_1 a -> ¬ (if decide (48%Z ≤ x) then (p_2 = true) = (p_1 = true) ∧ t_3 = t_2 ∧ (if decide (x_1 ≤ 57%Z) then t_4 = t_3 ∧ to_uint32 (x_2 - 48%Z) = i else p = false ∧ p_2 = true ∧ x_3 = i ∧ 97%Z ≤ i_4 ∧ i_5 ≤ 102%Z) else p = false ∧ p_1 = false ∧ x_3 = i ∧ 97%Z ≤ i_3 ∧ i_5 ≤ 102%Z).
Proof.
Admitted.
