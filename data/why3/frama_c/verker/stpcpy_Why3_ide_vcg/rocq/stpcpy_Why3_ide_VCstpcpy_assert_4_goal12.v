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
Theorem goal12 (a_2 : addr) (a_1 : addr) (t_2 : addr -> Z) (a_3 : addr) (a : addr) (t_1 : addr -> Z) (t_3 : addr -> Z) (t : Z -> Z) : let x : Z := base a_2 in let x_1 : Z := base a_1 in let m : addr -> Z := fun_updt t_2 a_3 0%Z in let x_2 : Z := offset a_1 in let x_3 : Z := offset a_3 in let x_4 : Z := offset a in let x_5 : Z := offset a_2 in let x_6 : Z := l_strlen t_2 a_1 in let a_4 : addr := shift a_2 0%Z in t_2 a = 0%Z -> ¬ x = x_1 -> m (shift a 0%Z) = 0%Z -> x_2 + x_3 = x_4 + x_5 -> x_2 + x_6 = x_4 + l_strlen t_2 a -> havoc t_1 t_3 a_4 (1%Z + x_6) = t_2 -> region x_1 ≤ 0%Z -> region x ≤ 0%Z -> linked t -> sconst t_3 -> addr_le a_1 a -> addr_le a_2 a_3 -> p_valid_str t t_2 a -> p_valid_str t t_3 a_1 -> p_valid_str t m a_2 -> addr_le a (shift a_1 x_6) -> addr_le a_3 (shift a_2 x_6) -> valid_rw t a_4 (1%Z + l_strlen t_3 a_1) -> (∀(i : Z), 0%Z ≤ i -> i + x_2 < x_4 -> t_2 (shift a_2 i) = t_2 (shift a_1 i)) -> x_5 + l_strlen m a_1 = x_3.
Proof.
Admitted.
