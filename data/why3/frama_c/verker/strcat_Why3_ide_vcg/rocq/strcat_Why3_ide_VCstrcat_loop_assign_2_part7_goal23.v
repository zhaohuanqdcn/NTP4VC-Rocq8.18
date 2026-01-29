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
Theorem goal23 (t_3 : addr -> Z) (a_1 : addr) (t_2 : addr -> Z) (a : addr) (t_1 : addr -> Z) (t : Z -> Z) : let x : Z := t_3 a_1 in let x_1 : Z := l_strlen t_2 a in let a_2 : addr := shift a x_1 in let x_2 : Z := l_strlen t_3 a_1 in let x_3 : Z := l_strlen t_2 a_1 in ¬ x = 0%Z -> t_2 a_2 = 0%Z -> havoc t_1 t_2 a_2 (1%Z + x_2) = t_3 -> region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> x_1 + x_3 ≤ 18446744073709551615%Z -> linked t -> sconst t_2 -> addr_le a_1 a_1 -> is_sint8 x -> p_valid_str t t_2 a -> p_valid_str t t_2 a_1 -> p_valid_str t t_3 a_1 -> is_uint64 x_1 -> addr_le a a_2 -> addr_le a_1 (shift a_1 x_2) -> addr_le a_2 a_2 -> ¬ invalid t a_2 1%Z -> p_valid_str t t_2 a_2 -> valid_rw t (shift a 0%Z) (1%Z + x_1 + x_3) -> addr_le a_2 (shift a (x_1 + x_2)) -> (∀(i : Z), 0%Z ≤ i -> i < x_1 -> ¬ t_2 (shift a i) = 0%Z) -> (∀(i : Z), 0%Z ≤ i -> i < x_1 -> ¬ t_3 (shift a i) = 0%Z) -> 0%Z ≤ l_strlen (fun_updt t_3 a_2 x) a_1.
Proof.
Admitted.
