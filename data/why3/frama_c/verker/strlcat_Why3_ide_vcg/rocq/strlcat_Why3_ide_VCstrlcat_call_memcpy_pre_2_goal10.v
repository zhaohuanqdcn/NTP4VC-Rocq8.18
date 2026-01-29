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
Require Import verker.Compound.Compound.
Require Import verker.A_Strlen.A_Strlen.
Require Import Why3.Cint.Cint.
Open Scope Z_scope.
Theorem goal10 (t_1 : addr -> Z) (a : addr) (a_1 : addr) (i_1 : Z) (i : Z) (t : Z -> Z) : let x : Z := l_strlen t_1 a in let x_1 : Z := l_strlen t_1 a_1 in let a_2 : addr := shift a_1 x_1 in let x_2 : Z := to_uint64 (i_1 - x_1) in t_1 (shift a x) = 0%Z -> t_1 a_2 = 0%Z -> x_1 < i_1 -> region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> i < x_2 -> x + x_1 ≤ 18446744073709551615%Z -> linked t -> sconst t_1 -> is_uint64 i -> is_uint64 i_1 -> p_valid_str t t_1 a -> p_valid_str t t_1 a_1 -> is_uint64 x -> is_uint64 x_1 -> valid_rw t (shift a_1 0%Z) (1%Z + i_1) -> p_valid_str t t_1 a_2 -> (if decide (x_2 ≤ x) then to_uint64 (x_2 - 1%Z) = i else x = i) -> (∀(i_2 : Z), 0%Z ≤ i_2 -> i_2 < x -> ¬ t_1 (shift a i_2) = 0%Z) -> ¬ (∀(i_2 : Z), 0%Z ≤ i_2 -> i_2 < x_1 -> ¬ t_1 (shift a_1 i_2) = 0%Z).
Proof.
Admitted.
