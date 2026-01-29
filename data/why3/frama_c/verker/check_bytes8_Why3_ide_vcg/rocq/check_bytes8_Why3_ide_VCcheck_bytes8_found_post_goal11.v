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
Require Import verker.A_CheckBytes8.A_CheckBytes8.
Require Import verker.Compound.Compound.
Require Import Why3.Cint.Cint.
Open Scope Z_scope.
Theorem goal11 (a_3 : addr) (a_2 : addr) (i_1 : Z) (t_1 : addr -> Z) (i : Z) (a_4 : addr) (t : Z -> Z) (a : addr) (a_1 : addr) : let x : Z := offset a_3 in let x_1 : Z := offset a_2 in let x_2 : Z := i_1 + x - x_1 in let a_5 : addr := l_check_bytes8 t_1 a_3 i i_1 in let x_3 : Z := i_1 + x in let x_4 : Z := t_1 a_2 in let a_6 : addr := shift a_3 i_1 in ¬ t_1 a_4 = i -> l_check_bytes8 t_1 a_2 i x_2 = a_5 -> x ≤ x_1 -> region (base a_3) ≤ 0%Z -> x_1 ≤ x_3 -> linked t -> is_uint8 i -> is_uint32 i_1 -> addr_le a_3 a_2 -> addr_le a_3 a_4 -> is_uint8 x_4 -> addr_lt a_4 a_6 -> addr_le a_2 a_6 -> valid_rd t (shift a_3 0%Z) i_1 -> is_uint32 x_2 -> (if decide (x_3 = x_1) then a_5 = Mk_addr 0%Z 0%Z else ¬ x_4 = i) -> (∀(a_7 : addr), addr_lt a_7 a_2 -> addr_le a_3 a_7 -> t_1 a_7 = i) -> addr_le a_3 a ∧ addr_lt a_1 a_6.
Proof.
Admitted.
