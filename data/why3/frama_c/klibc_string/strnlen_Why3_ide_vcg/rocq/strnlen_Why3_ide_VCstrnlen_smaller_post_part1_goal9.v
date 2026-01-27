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
Require Import Why3.Memory.Memory.
Require Import klibc_string.Compound.Compound.
Require Import Why3.Cint.Cint.
Open Scope Z_scope.
Theorem goal9 (i : Z) (i_1 : Z) (a : addr) (t_1 : addr -> Z) (i_2 : Z) (t : Z -> Z) : let x : Z := i - i_1 in let a_1 : addr := shift a x in t_1 (shift a i_2) = 0%Z -> t_1 a_1 = 0%Z -> 0%Z < i_1 -> 0%Z ≤ i -> i_1 ≤ i -> 0%Z ≤ i_1 -> 0%Z ≤ i_2 -> i_2 < i -> region (base a) ≤ 0%Z -> linked t -> sconst t_1 -> is_uint32 i -> is_uint32 i_1 -> valid_rw t (shift a 0%Z) i -> addr_le a a_1 -> addr_le a_1 (shift a i) -> (∀(i_3 : Z), 0%Z ≤ i_3 -> i_3 + i_1 < i -> ¬ t_1 (shift a i_3) = 0%Z) -> to_uint32 x ≤ i.
Admitted.
