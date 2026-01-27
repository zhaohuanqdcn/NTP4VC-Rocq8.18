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
Theorem goal13 (t_1 : addr -> Z) (a_7 : addr) (a_6 : addr) (i : Z) (i_1 : Z) (a_5 : addr) (a_8 : addr) (t : Z -> Z) (a_3 : addr) (a : addr) (a_1 : addr) (a_4 : addr) (a_2 : addr) : let x : Z := t_1 a_7 in let x_1 : Z := offset a_6 in let x_2 : Z := offset a_7 in let x_3 : Z := i + x_2 - x_1 in ¬ i = 0%Z -> ¬ x = i_1 -> base a_7 = base a_5 -> 0%Z ≤ i -> x_1 ≤ x_2 -> region (base a_8) ≤ 0%Z -> linked t -> is_sint32 i_1 -> is_uint64 i -> addr_le a_3 a_7 -> is_uint8 x -> is_uint64 x_3 -> valid_rd t (shift a 0%Z) x_3 -> valid_rd t (shift a_1 0%Z) x_3 -> addr_le a_7 (shift a_4 x_3) -> (∀(i_2 : Z), 0%Z ≤ i_2 -> i_2 + x_1 < x_2 -> ¬ t_1 (shift a_2 i_2) = i_1) -> to_uint64 (i - 1%Z) < i.
Admitted.
