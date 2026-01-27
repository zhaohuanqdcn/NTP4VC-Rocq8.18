From Stdlib Require Import Strings.String.
From Stdlib Require Import String Ascii.
From Stdlib Require Arith.
From stdpp Require Import base.
From stdpp Require Import fin_maps.
From stdpp Require Import gmap.
From stdpp Require Import base gmultiset.
From Stdlib Require Classical.
From Stdlib Require Import ZArith.
From stdpp.bitvector Require Import definitions tactics.
From Stdlib Require Import Sorting.Sorted.
From Stdlib Require Import Reals.Rbasic_fun.
From Stdlib Require Import Reals.Abstract.ConstructiveAbs.
From Stdlib Require Import Reals.Rdefinitions.
From stdpp Require Import list_relations.
From stdpp Require Import list_numbers.
From stdpp Require Import functions.
From Stdlib Require Import ClassicalEpsilon.
From stdpp Require Import base decidable.
From Stdlib Require Import ZArith.Zeuclid.
From Stdlib Require Import ZArith.Znumtheory.
From stdpp Require Import propset.
From Stdlib Require Import Reals.
Require Import Why3.Base.
Require Import Why3.Qed.Qed.
Require Import verker.Axiomatic3.Axiomatic3.
Require Import Why3.Memory.Memory.
Require Import verker.A_CheckBytes8.A_CheckBytes8.
Require Import verker.Compound.Compound.
Require Import Why3.Cint.Cint.
Open Scope Z_scope.
Theorem goal14 (a_1 : addr) (a : addr) (i_3 : Z) (t_3 : addr -> Z) (t_1 : addr -> Z) (i : Z) (t : Z -> Z) (i_1 : Z) (i_2 : Z) (t_2 : addr -> Z) (a_2 : addr) : let x : Z := offset a_1 in let x_1 : Z := offset a in let x_2 : Z := i_3 + x - x_1 in let x_3 : Z := i_3 + x in let x_4 : Z := t_3 a in let a_3 : addr := shift a_1 i_3 in l_check_bytes8 t_1 a i x_2 = l_check_bytes8 t_1 a_1 i i_3 -> x ≤ x_1 -> region (base a_1) ≤ 0%Z -> x_1 ≤ x_3 -> linked t -> is_uint8 i -> is_uint8 i_1 -> is_uint8 i_2 -> is_uint32 i_3 -> addr_le a_1 a -> is_uint8 x_4 -> addr_le a a_3 -> valid_rd t (shift a_1 0%Z) i_3 -> is_uint32 x_2 -> (if decide (x_3 = x_1) then i_1 = i ∧ t_2 = t_1 ∧ Mk_addr 0%Z 0%Z = a_2 ∧ l_check_bytes8 t_2 a_1 i_1 i_3 = a_2 else i_2 = i ∧ t_3 = t_1 ∧ ¬ x_4 = i_2) -> (∀(a_4 : addr), addr_lt a_4 a -> addr_le a_1 a_4 -> t_1 a_4 = i) -> (∀(a_4 : addr), addr_le a_1 a_4 -> addr_lt a_4 a_3 -> t_1 a_4 = i) -> Mk_addr 0%Z 0%Z = a_2.
Admitted.
