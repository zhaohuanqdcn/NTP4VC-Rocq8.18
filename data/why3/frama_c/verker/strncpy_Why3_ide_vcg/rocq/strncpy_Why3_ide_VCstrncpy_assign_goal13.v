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
Theorem goal13 (a_1 : addr) (a : addr) (t_2 : addr -> Z) (i_1 : Z) (t_3 : addr -> Z) (i : Z) (t_1 : addr -> Z) (t : Z -> Z) : let x : Z := base a_1 in let x_1 : Z := base a in let a_2 : addr := shift a_1 0%Z in let x_2 : Z := l_strnlen t_2 a i_1 in let x_3 : Z := 1%Z + x_2 in let x_4 : Z := l_strnlen t_3 a i in ¬ x = x_1 -> havoc t_1 t_3 a_2 x_3 = t_2 -> region x_1 ≤ 0%Z -> region x ≤ 0%Z -> 0%Z ≤ x_2 -> linked t -> sconst t_3 -> is_uint64 i -> is_uint64 i_1 -> p_valid_str t t_3 a -> p_valid_strn t t_3 a i -> valid_rw t a_2 (1%Z + x_4) -> ¬ invalid t a_2 x_3 -> x_2 ≤ x_4.
Proof.
Admitted.
