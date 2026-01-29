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
Theorem goal5 (t_1 : addr -> Z) (a : addr) (a_1 : addr) (i : Z) (t : Z -> Z) : let x : Z := t_1 a in let x_1 : Z := offset a in let x_2 : Z := offset a_1 in let x_3 : Z := i + x_1 - x_2 in ¬ i = 0%Z -> l_check_bytes8 t_1 a_1 x x_3 = l_check_bytes8 t_1 a x i -> 0%Z ≤ i -> x_2 ≤ x_1 -> region (base a_1) ≤ 0%Z -> linked t -> is_uint32 i -> addr_le a_1 a -> is_uint8 x -> is_uint32 x_3 -> valid_rd t (shift a_1 0%Z) x_3 -> addr_le a (shift a_1 x_3) -> (∀(a_2 : addr), addr_lt a_2 a -> addr_le a_1 a_2 -> x = t_1 a_2) -> 1%Z + to_uint32 (i - 1%Z) = i.
Proof.
Admitted.
