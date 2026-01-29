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
Require Import Why3.Memory.Memory.
Require Import x509_parser.Compound.Compound.
Require Import Why3.Cint.Cint.
Open Scope Z_scope.
Theorem goal0 (a_8 : addr) (a : addr) (a_1 : addr) (a_2 : addr) (a_3 : addr) (a_4 : addr) (a_5 : addr) (a_6 : addr) (a_7 : addr) (t_1 : addr -> Z) (i : Z) (i_1 : Z) (i_2 : Z) (i_3 : Z) (i_4 : Z) (i_5 : Z) (i_6 : Z) (t : Z -> Z) : let x : Z := base a_8 in let x_1 : Z := base a in let x_2 : Z := base a_1 in let x_3 : Z := base a_2 in let x_4 : Z := base a_3 in let x_5 : Z := base a_4 in let x_6 : Z := base a_5 in let x_7 : Z := base a_6 in let x_8 : Z := base a_7 in let a_9 : addr := shift a_8 0%Z in let x_9 : Z := fun_updt (fun_updt (fun_updt (fun_updt (fun_updt (fun_updt (fun_updt (fun_updt t_1 a_2 i) a_4 i_1) a_5 i_2) a_7 i_3) a_3 i_4) a i_5) a_6 15%Z) a_1 23%Z a_6 in ¬ a_1 = a -> ¬ a_2 = a -> ¬ a_2 = a_1 -> ¬ a_3 = a -> ¬ a_3 = a_1 -> ¬ a_3 = a_2 -> ¬ a_4 = a -> ¬ a_4 = a_1 -> ¬ a_4 = a_2 -> ¬ a_4 = a_3 -> ¬ i_6 = 0%Z -> ¬ a_5 = a -> ¬ a_5 = a_1 -> ¬ a_5 = a_2 -> ¬ a_5 = a_3 -> ¬ a_5 = a_4 -> ¬ a_6 = a -> ¬ a_6 = a_1 -> ¬ a_6 = a_2 -> ¬ a_6 = a_3 -> ¬ a_6 = a_4 -> ¬ a_6 = a_5 -> ¬ a_7 = a -> ¬ a_7 = a_1 -> ¬ a_7 = a_2 -> ¬ a_7 = a_3 -> ¬ a_7 = a_4 -> ¬ a_7 = a_5 -> ¬ a_7 = a_6 -> ¬ Mk_addr 0%Z 0%Z = a_8 -> ¬ x = x_1 -> ¬ x = x_2 -> ¬ x = x_3 -> ¬ x = x_4 -> ¬ x = x_5 -> ¬ x = x_6 -> ¬ x = x_7 -> ¬ x = x_8 -> t_1 a_9 = 23%Z -> 0%Z ≤ i_6 -> region x_1 ≤ 0%Z -> region x_2 ≤ 0%Z -> region x_3 ≤ 0%Z -> region x_4 ≤ 0%Z -> region x_5 ≤ 0%Z -> region x_6 ≤ 0%Z -> region x_7 ≤ 0%Z -> region x_8 ≤ 0%Z -> region x ≤ 0%Z -> 2%Z ≤ i_6 -> 15%Z ≤ i_6 -> linked t -> is_uint16 i_6 -> valid_rw t a 1%Z -> valid_rw t a_1 1%Z -> valid_rw t a_2 1%Z -> valid_rw t a_3 1%Z -> valid_rw t a_4 1%Z -> valid_rw t a_5 1%Z -> valid_rw t a_6 1%Z -> valid_rw t a_7 1%Z -> valid_rd t a_9 1%Z -> separated a 1%Z a_9 i_6 -> separated a_2 1%Z a_9 i_6 -> separated a_3 1%Z a_9 i_6 -> separated a_4 1%Z a_9 i_6 -> separated a_5 1%Z a_9 i_6 -> separated a_6 1%Z a_9 i_6 -> separated a_7 1%Z a_9 i_6 -> is_uint16 x_9 -> (0%Z < i_6 -> valid_rd t a_9 i_6) -> x_9 ≤ i_6.
Proof.
Admitted.
