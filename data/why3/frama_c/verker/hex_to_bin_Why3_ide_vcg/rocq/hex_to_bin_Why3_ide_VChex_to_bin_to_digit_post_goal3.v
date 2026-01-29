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
Require Import Why3.Cint.Cint.
Require Import verker.A_Ctype.A_Ctype.
Open Scope Z_scope.
Theorem goal3 (i_3 : Z) (i : Z) (i_1 : Z) (i_2 : Z) : let x : Z := l_tolower i_3 in let x_1 : Z := 87%Z + i in let x_2 : Z := 87%Z + i_1 in is_sint8 i_2 -> is_sint8 i_3 -> is_sint32 i -> is_sint32 i_1 -> p_isxdigit i_3 -> (if decide (48%Z ≤ i_3) then if decide (i_3 ≤ 57%Z) then i_1 = i ∧ 48%Z + i_1 = i_3 else x = i_2 ∧ (if decide (97%Z ≤ i_2) then if decide (i_2 ≤ 102%Z) then x_1 = i_2 ∧ x_2 = i_2 else i = - 1%Z ∧ i_1 = - 1%Z else i = - 1%Z ∧ i_1 = - 1%Z) else x = i_2 ∧ (if decide (97%Z ≤ i_2) then if decide (i_2 ≤ 102%Z) then x_1 = i_2 ∧ x_2 = i_2 else i = - 1%Z ∧ i_1 = - 1%Z else i = - 1%Z ∧ i_1 = - 1%Z)) -> 0%Z ≤ i_1 ∧ i_1 ≤ 15%Z.
Proof.
Admitted.
