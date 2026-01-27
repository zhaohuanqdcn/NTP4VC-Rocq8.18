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
Require Import klibc_stdio.Compound.Compound.
Require Import Why3.Cint.Cint.
Require Import klibc_stdio.Axiomatic3.Axiomatic3.
Open Scope Z_scope.
Theorem goal19 (a_10 : addr) (a_2 : addr) (a : addr) (t_1 : addr -> Z) (a_4 : addr) (i : Z) (t_3 : addr -> addr) (t : Z -> Z) (t_2 : addr -> Z) (a_1 : addr) (a_3 : addr) (a_5 : addr) (a_6 : addr) (a_8 : addr) (a_9 : addr) (a_7 : addr) : let a_11 : addr := shift a_10 7%Z in shift a_2 0%Z = shift a 0%Z -> t_1 (shift a_4 8%Z) = 0%Z -> t_1 (shift a_10 8%Z) = 0%Z -> region (base a_2) ≤ 0%Z -> - 128%Z ≤ i -> i ≤ 127%Z -> framed t_3 -> linked t -> sconst t_2 -> is_sint32 i -> p_valid_io_file_pvt t t_3 t_1 a_1 -> p_valid_io_file_pvt t t_3 t_1 a_3 -> ¬ invalid t a_11 1%Z -> ¬ addr_le (t_3 (shift a_5 6%Z)) (t_3 (shift a_6 5%Z)) -> ¬ addr_le (t_3 (shift a_10 6%Z)) (t_3 (shift a_10 5%Z)) -> a_11 = shift a_8 6%Z ∨ a_11 = shift a_9 7%Z ∨ shift (t_3 (shift a_7 6%Z)) (- 1%Z) = a_11.
Admitted.
