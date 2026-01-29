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
Require Import x509_parser.Globals.Globals.
Require Import Why3.Cint.Cint.
Open Scope Z_scope.
Theorem goal0 : let a : addr := Mk_addr 7106%Z 0%Z in ∀(i_4 : Z) (i_3 : Z) (i_2 : Z) (i_1 : Z) (i : Z) (t : Z -> Z) (t_1 : Z -> addr) (t_3 : addr -> Z) (t_2 : addr -> Z) (t_5 : addr -> addr) (t_4 : addr -> addr) (a_4 : addr) (a_3 : addr), let x : Z := base a_4 in let x_1 : Z := base a_3 in let a_5 : addr := shift a_4 i_3 in let a_6 : addr := t_1 i_2 in let a_7 : addr := shift a_6 6%Z in let a_8 : addr := havoc t_4 (fun_updt (fun_updt t_5 (shift a 0%Z) (Mk_addr 0%Z 0%Z)) (shift a 1%Z) (Mk_addr 0%Z 0%Z)) a 4%Z a_7 in let a_9 : addr := shift a_6 4%Z in let m : Z -> Z := fun_updt t 7106%Z 4%Z in let a_10 : addr := shift a_4 0%Z in ¬ i_1 = 0%Z -> ¬ i_4 = 0%Z -> ¬ Mk_addr 0%Z 0%Z = a_4 -> ¬ x = x_1 -> ¬ a_5 = Mk_addr 0%Z 0%Z -> ¬ a_8 = Mk_addr 0%Z 0%Z -> havoc t_2 (fun_updt (fun_updt t_3 (shift a 2%Z) 0%Z) (shift a 3%Z) 0%Z) a 4%Z a_9 = 2%Z -> 0%Z ≤ i_1 -> i_3 ≤ i_1 -> i_4 ≤ i_1 -> 0%Z ≤ i_4 -> i ≤ i_4 -> i_3 + i_4 ≤ i_1 -> region x_1 ≤ 0%Z -> region x ≤ 0%Z -> 2%Z ≤ i -> 2%Z ≤ i_3 -> i ≤ 2147483648%Z + i_4 -> i_4 ≤ 65535%Z + i -> i_4 ≤ 2147483647%Z + i -> framed t_5 -> linked t -> is_uint8 i_2 -> is_uint16 i -> is_uint16 i_1 -> is_uint16 i_3 -> is_uint16 i_4 -> valid_rw t a_3 1%Z -> valid_rd m a_6 8%Z -> valid_rd m a_9 1%Z -> valid_rd m a_7 1%Z -> separated a_5 1%Z a 4%Z -> (0%Z < i_1 -> valid_rd t a_10 i_1) -> (0%Z < i_1 -> valid_rd m a_10 i_1) -> (0%Z < i_4 -> valid_rd m a_5 i_4) -> a_8 = Mk_addr 8421%Z 0%Z ∨ a_8 = Mk_addr 8422%Z 0%Z.
Proof.
Admitted.
