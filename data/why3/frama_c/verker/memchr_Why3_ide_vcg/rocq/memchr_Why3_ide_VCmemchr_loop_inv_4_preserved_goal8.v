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
Require Import Why3.Cint.Cint.
Require Import verker.Compound.Compound.
Open Scope Z_scope.
Theorem goal8 (t_1 : addr -> Z) (a_8 : addr) (i_1 : Z) (a_3 : addr) (i : Z) (a_7 : addr) (t : Z -> Z) (a_4 : addr) (a_6 : addr) (a_9 : addr) (a : addr) (a_1 : addr) (a_5 : addr) (a_2 : addr) : let x : Z := t_1 a_8 in let x_1 : Z := to_uint8 i_1 in let x_2 : Z := offset a_3 in let x_3 : Z := offset a_8 in let x_4 : Z := i + x_3 - x_2 in ¬ i = 0%Z -> ¬ x = x_1 -> 0%Z ≤ i -> x_2 ≤ x_3 -> region (base a_7) ≤ 0%Z -> linked t -> is_sint32 i_1 -> is_uint64 i -> addr_le a_4 a_8 -> addr_le a_6 a_9 -> is_uint8 x -> addr_lt a_9 (shift a_8 1%Z) -> is_uint64 x_4 -> valid_rd t (shift a 0%Z) x_4 -> valid_rd t (shift a_1 0%Z) x_4 -> addr_le a_8 (shift a_5 x_4) -> (∀(a_10 : addr), addr_lt a_10 a_8 -> addr_le a_2 a_10 -> ¬ t_1 a_10 = x_1) -> ¬ t_1 a_9 = x_1.
Admitted.
