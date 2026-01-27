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
Theorem goal14 (a_5 : addr) (a_9 : addr) (i : Z) (i_1 : Z) (a_8 : addr) (t : Z -> Z) (a_6 : addr) (a_7 : addr) (a : addr) (a_1 : addr) (a_10 : addr) (t_1 : addr -> Z) (a_4 : addr) (a_2 : addr) (a_3 : addr) : let x : Z := offset a_5 in let x_1 : Z := offset a_9 in let x_2 : Z := i + x in let x_3 : Z := to_uint8 i_1 in x ≤ x_1 -> region (base a_8) ≤ 0%Z -> x_1 ≤ x_2 -> linked t -> is_sint32 i_1 -> is_uint64 i -> addr_le a_6 a_9 -> addr_le a_9 (shift a_7 i) -> valid_rd t (shift a 0%Z) i -> valid_rd t (shift a_1 0%Z) i -> is_uint64 (i + x - x_1) -> (if decide (x_2 = x_1) then Mk_addr 0%Z 0%Z = a_10 else t_1 a_9 = x_3) -> (∀(a_11 : addr), addr_lt a_11 a_9 -> addr_le a_4 a_11 -> ¬ t_1 a_11 = x_3) -> (∀(a_11 : addr), addr_le a_2 a_11 -> addr_lt a_11 (shift a_3 i) -> ¬ t_1 a_11 = x_3) -> Mk_addr 0%Z 0%Z = a_10.
Admitted.
