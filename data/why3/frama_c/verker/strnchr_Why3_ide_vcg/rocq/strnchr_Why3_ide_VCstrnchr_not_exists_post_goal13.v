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
Require Import verker.A_Strnlen.A_Strnlen.
Require Import verker.Compound.Compound.
Require Import verker.A_Strlen.A_Strlen.
Open Scope Z_scope.
Theorem goal13 (t_1 : addr -> Z) (a_1 : addr) (a_2 : addr) (i : Z) (i_1 : Z) (t : Z -> Z) (a : addr) : let x : Z := t_1 a_1 in let x_1 : Z := offset a_1 in let x_2 : Z := offset a_2 in let x_3 : Z := i + x_2 - x_1 in let x_4 : Z := l_strnlen t_1 a_2 i in let x_5 : Z := i + x_2 in let a_3 : addr := shift a_2 x_4 in let x_6 : Z := to_sint8 i_1 in ¬ x = 0%Z -> x_1 + l_strnlen t_1 a_1 x_3 = x_2 + x_4 -> x_2 ≤ x_1 -> region (base a_2) ≤ 0%Z -> x_1 ≤ x_5 -> linked t -> sconst t_1 -> is_sint32 i_1 -> is_uint64 i -> addr_le a_2 a_1 -> is_sint8 x -> p_valid_strn t t_1 a_2 i -> is_uint64 x_3 -> addr_le a_1 a_3 -> p_valid_strn t t_1 a_1 x_3 -> (if decide (x_5 = x_1) then Mk_addr 0%Z 0%Z = a else a_1 = a ∧ t_1 a = x_6) -> (∀(a_4 : addr), addr_lt a_4 a_1 -> addr_le a_2 a_4 -> ¬ t_1 a_4 = x_6) -> (∀(a_4 : addr), addr_le a_2 a_4 -> addr_lt a_4 a_3 -> ¬ t_1 a_4 = x_6) -> Mk_addr 0%Z 0%Z = a.
Proof.
Admitted.
