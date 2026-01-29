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
Require Import verker.A_Strnlen.A_Strnlen.
Open Scope Z_scope.
Theorem goal4 (a_1 : addr) (a : addr) (t : Z -> Z) (t_1 : addr -> Z) (i : Z) : let x : Z := base a_1 in let x_1 : Z := base a in ¬ x = x_1 -> region x_1 ≤ 0%Z -> region x ≤ 0%Z -> linked t -> sconst t_1 -> is_uint64 i -> p_valid_str t t_1 a -> p_valid_strn t t_1 a i -> valid_rw t (shift a_1 0%Z) (1%Z + l_strnlen t_1 a i) -> addr_le a_1 a_1 ∧ addr_le a_1 (shift a_1 i).
Proof.
Admitted.
