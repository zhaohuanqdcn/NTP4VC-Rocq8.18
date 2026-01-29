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
Require Import verker.Compound.Compound.
Open Scope Z_scope.
Theorem goal13 (t_1 : addr -> Z) (a_11 : addr) (a_5 : addr) (a_10 : addr) (a_8 : addr) (i : Z) (i_1 : Z) (a_9 : addr) (t : Z -> Z) (a_2 : addr) (a_6 : addr) (a : addr) (a_1 : addr) (a_3 : addr) (a_7 : addr) (a_4 : addr) : let x : Z := t_1 a_11 in let x_1 : Z := offset a_5 in let x_2 : Z := offset a_10 in let x_3 : Z := t_1 a_8 in let x_4 : Z := i + x_2 - x_1 in x = to_uint8 i_1 -> 0%Z ≤ i -> x_1 ≤ x_2 -> region (base a_9) ≤ 0%Z -> linked t -> is_sint32 i_1 -> is_uint64 i -> addr_le a_2 a_11 -> addr_le a_6 a_10 -> is_uint8 x_3 -> is_uint64 x_4 -> valid_rd t (shift a 0%Z) x_4 -> valid_rd t (shift a_1 0%Z) x_4 -> addr_lt a_11 (shift a_3 x_4) -> addr_le a_10 (shift a_7 x_4) -> i = 0%Z ∨ x = t_1 a_10 -> (∀(a_12 : addr), addr_lt a_12 a_10 -> addr_le a_4 a_12 -> ¬ x = t_1 a_12) -> x = x_3.
Proof.
Admitted.
