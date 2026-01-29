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
Theorem goal11 (t_2 : addr -> Z) (a_2 : addr) (a_3 : addr) (a_1 : addr) (a : addr) (t_1 : addr -> Z) (t_3 : addr -> Z) (t : Z -> Z) : let x : Z := t_2 a_2 in let x_1 : Z := base a_3 in let x_2 : Z := base a_1 in let x_3 : Z := offset a_2 in let x_4 : Z := offset a_3 in let x_5 : Z := l_strlen t_2 a_3 in let a_4 : addr := shift a_1 0%Z in ¬ x = 0%Z -> ¬ x_1 = x_2 -> offset a_1 + x_3 = offset a + x_4 -> x_4 + x_5 = x_3 + l_strlen t_2 a_2 -> havoc t_1 t_3 a_4 (1%Z + x_5) = t_2 -> region x_2 ≤ 0%Z -> region x_1 ≤ 0%Z -> linked t -> sconst t_3 -> addr_le a_1 a -> addr_le a_3 a_2 -> is_sint8 x -> ¬ invalid t a 1%Z -> p_valid_str t t_2 a_2 -> p_valid_str t t_3 a_3 -> addr_le a (shift a_1 x_5) -> addr_le a_2 (shift a_3 x_5) -> valid_rw t a_4 (1%Z + l_strlen t_3 a_3) -> (∀(i : Z), 0%Z ≤ i -> i + x_4 < x_3 -> t_2 (shift a_3 i) = t_2 (shift a_1 i)) -> included a 1%Z a_4 (1%Z + l_strlen (fun_updt t_2 a x) a_3).
Proof.
Admitted.
