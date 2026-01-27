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
Require Import Why3.Cint.Cint.
Require Import max_element.Compound.Compound.
Open Scope Z_scope.
Theorem goal5 (a : addr) (i_1 : Z) (t_1 : addr -> Z) (i_3 : Z) (i : Z) (i_4 : Z) (t : Z -> Z) (i_2 : Z) : let a_1 : addr := shift a i_1 in let x : Z := t_1 a_1 in let a_2 : addr := shift a i_3 in let x_1 : Z := t_1 a_2 in 0%Z < i -> i_3 ≤ i -> 0%Z ≤ i_1 -> i_1 < i -> 0%Z ≤ i_3 -> i_3 < i -> i_4 ≤ i_3 -> 0%Z ≤ i_4 -> region (base a) ≤ 0%Z -> i_3 ≤ 4294967294%Z -> linked t -> is_uint32 i -> is_uint32 i_1 -> is_uint32 i_2 -> is_uint32 i_3 -> is_uint32 (1%Z + i_3) -> is_sint32 x -> is_sint32 x_1 -> valid_rd t (shift a 0%Z) i -> valid_rd t a_1 1%Z -> valid_rd t a_2 1%Z -> (if decide (x < x_1) then i_3 = i_2 else i_2 = i_1) -> (∀(i_5 : Z), 0%Z ≤ i_5 -> i_5 < i_1 -> t_1 (shift a i_5) < x) -> (∀(i_5 : Z), 0%Z ≤ i_5 -> i_5 < i_3 -> t_1 (shift a i_5) ≤ x) -> t_1 (shift a i_4) ≤ t_1 (shift a i_2).
Admitted.
