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
Theorem goal6 (a_1 : addr) (i : Z) (a : addr) (t_1 : addr -> Z) (t : Z -> Z) (a_2 : addr) : let x : Z := offset a_1 in let x_1 : Z := i + x in let x_2 : Z := offset a in let x_3 : Z := t_1 a in let x_4 : Z := i + x - x_2 in ¬ x_1 = x_2 -> l_check_bytes8 t_1 a x_3 x_4 = l_check_bytes8 t_1 a_1 x_3 i -> x ≤ x_2 -> region (base a_1) ≤ 0%Z -> x_2 ≤ x_1 -> linked t -> is_uint32 i -> addr_le a_1 a -> addr_le a_1 a_2 -> is_uint8 x_3 -> addr_lt a_2 (shift a 1%Z) -> addr_le a (shift a_1 i) -> valid_rd t (shift a_1 0%Z) i -> is_uint32 x_4 -> (∀(a_3 : addr), addr_lt a_3 a -> addr_le a_1 a_3 -> x_3 = t_1 a_3) -> t_1 a_2 = x_3.
Proof.
Admitted.
