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
Theorem goal23 (a : addr) (a_1 : addr) (i_1 : Z) (i : Z) (i_2 : Z) (t : Z -> Z) (t_1 : addr -> Z) : let a_2 : addr := shift a 0%Z in let a_3 : addr := shift a_1 0%Z in 0%Z < i_1 -> i < i_1 -> region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> - 128%Z ≤ i_2 -> i_2 ≤ 127%Z -> linked t -> sconst t_1 -> is_uint32 i -> is_uint32 i_1 -> is_sint32 i_2 -> valid_rw t a_2 i_1 -> valid_rw t a_3 i_1 -> ¬ invalid t a_3 (i_1 - i) -> separated a_2 i_1 a_3 i_1 -> (∀(i_3 : Z), 0%Z ≤ i_3 -> i_3 < i_1 -> ¬ t_1 (shift a i_3) = to_sint8 i_2) -> 0%Z ≤ i.
Admitted.
