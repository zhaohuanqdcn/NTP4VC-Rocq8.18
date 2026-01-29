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
Require Import verker.A_Strlen.A_Strlen.
Require Import verker.Compound.Compound.
Open Scope Z_scope.
Theorem goal14 (a_1 : addr) (a : addr) (t_2 : addr -> Z) (i : Z) (t_1 : addr -> Z) (t : Z -> Z) : let x : Z := base a_1 in let x_1 : Z := base a in let x_2 : Z := l_strlen t_2 a in let x_3 : Z := to_uint64 (i - 1%Z) in let a_2 : addr := shift a_1 0%Z in let a_3 : addr -> Z := havoc t_1 t_2 a_2 x_3 in ¬ x = x_1 -> t_2 (shift a x_2) = 0%Z -> 0%Z < i -> i ≤ x_2 -> region x_1 ≤ 0%Z -> region x ≤ 0%Z -> 0%Z < x_3 -> linked t -> sconst t_2 -> is_uint64 i -> p_valid_str t t_2 a -> is_uint64 x_2 -> valid_rw t a_2 i -> valid_rd t (shift a 0%Z) x_3 -> valid_rw t a_2 x_3 -> ¬ invalid t a_2 x_3 -> (∀(i_1 : Z), 0%Z ≤ i_1 -> i_1 < x_2 -> ¬ t_2 (shift a i_1) = 0%Z) -> (∀(i_1 : Z), 0%Z ≤ i_1 -> i_1 < x_3 -> a_3 (shift a_1 i_1) = a_3 (shift a i_1)) -> x_3 ≤ i.
Proof.
Admitted.
