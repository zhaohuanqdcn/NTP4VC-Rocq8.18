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
Theorem goal1 (a_1 : addr) (a : addr) (t_1 : addr -> Z) (t : Z -> Z) (i : Z) : let x : Z := base a_1 in let x_1 : Z := base a in let x_2 : Z := l_strlen t_1 a in ¬ x = x_1 -> region x_1 ≤ 0%Z -> region x ≤ 0%Z -> linked t -> sconst t_1 -> is_uint64 i -> p_valid_str t t_1 a -> valid_rw t (shift a_1 0%Z) i -> (¬ i = 0%Z ∨ i ≤ x_2) ∧ (¬ i = 0%Z ∨ i ≤ 0%Z ∨ x_2 < i).
Proof.
Admitted.
