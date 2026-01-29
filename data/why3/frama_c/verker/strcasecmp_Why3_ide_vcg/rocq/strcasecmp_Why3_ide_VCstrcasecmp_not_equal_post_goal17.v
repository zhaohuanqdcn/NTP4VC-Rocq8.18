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
Require Import verker.A_Ctype.A_Ctype.
Require Import Why3.Cint.Cint.
Require Import verker.A_Strlen.A_Strlen.
Require Import verker.Compound.Compound.
Open Scope Z_scope.
Theorem goal17 (a_1 : addr) (a_3 : addr) (t_1 : addr -> Z) (t_2 : addr -> Z) (a : addr) (t_3 : addr -> Z) (a_2 : addr) (i_1 : Z) (t : Z -> Z) (i : Z) : let x : Z := offset a_1 in let x_1 : Z := offset a_3 in let x_2 : Z := l_strlen t_1 a_3 in let x_3 : Z := t_1 a_1 in let x_4 : Z := t_2 a in let x_5 : Z := l_tolower x_3 in let x_6 : Z := l_tolower x_4 in let x_7 : Z := x - x_1 in let x_8 : Z := l_tolower (t_3 (shift a_3 x_7)) in let x_9 : Z := l_tolower (t_3 (shift a_2 x_7)) in x + offset a_2 = offset a + x_1 -> ¬ l_tolower (t_1 (shift a_3 i_1)) = l_tolower (t_1 (shift a_2 i_1)) -> 0%Z ≤ i_1 -> i_1 ≤ x_2 -> region (base a_2) ≤ 0%Z -> region (base a_3) ≤ 0%Z -> linked t -> sconst t_1 -> is_sint32 i -> addr_le a_2 a -> addr_le a_3 a_1 -> is_sint8 x_3 -> is_sint8 x_4 -> p_valid_str t t_1 a -> p_valid_str t t_1 a_1 -> p_valid_str t t_1 a_2 -> p_valid_str t t_1 a_3 -> is_sint8 x_5 -> is_sint8 x_6 -> is_sint32 x_5 -> is_sint32 x_6 -> addr_le a (shift a_2 (l_strlen t_1 a_2)) -> addr_le a_1 (shift a_3 x_2) -> is_sint32 (x_5 - x_6) -> (if decide (x_6 = x_5) then i = 0%Z ∧ x_6 = 0%Z else i + x_6 = x_5) -> (x_6 = x_5 -> i = 0%Z ∧ x_5 = 0%Z) -> (¬ x_6 = x_5 -> ¬ x_8 = x_9 ∧ i + x_9 = x_8 ∧ x_1 ≤ x ∧ x ≤ x_1 + l_strlen t_3 a_3 ∧ (∀(i_2 : Z), 0%Z ≤ i_2 -> i_2 + x_1 < x -> l_tolower (t_3 (shift a_3 i_2)) = l_tolower (t_3 (shift a_2 i_2)))) -> (∀(i_2 : Z), 0%Z ≤ i_2 -> i_2 + x_1 < x -> l_tolower (t_1 (shift a_3 i_2)) = l_tolower (t_1 (shift a_2 i_2))) -> ¬ x_6 = x_5.
Proof.
Admitted.
