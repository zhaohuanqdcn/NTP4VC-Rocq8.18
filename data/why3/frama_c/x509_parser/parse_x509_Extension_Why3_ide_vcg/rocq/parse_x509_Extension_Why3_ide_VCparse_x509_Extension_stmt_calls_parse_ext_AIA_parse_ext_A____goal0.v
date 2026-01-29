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
Theorem goal0 (a_4 : addr) (i_4 : Z) (i_3 : Z) (i_5 : Z) (i : Z) (i_2 : Z) (t_1 : addr -> Z) (a_1 : addr) (t_2 : addr -> addr) (t_3 : addr -> addr) (i_1 : Z) (a_2 : addr) (a_3 : addr) (t : Z -> Z) : let a_5 : addr := shift a_4 i_4 in let x : Z := i_3 + i_5 in let x_1 : Z := i + i_3 + i_5 in let a_6 : addr := shift___anonstruct__ext_oid_14 (Mk_addr (- 8682%Z) 0%Z) i_2 in let a_7 : addr := shift a_4 (i + i_4) in let a_8 : addr := shift a_4 (3%Z + i + i_4) in let a_9 : addr := shift a_4 (2%Z + i + i_4) in let x_2 : Z := t_1 a_9 in let x_3 : Z := i + i_3 + i_4 + i_5 in let x_4 : Z := 3%Z + i + i_3 + i_5 in let x_5 : Z := 3%Z + i_3 + i_5 in let a_10 : addr := shift a_1 0%Z in let a_11 : addr := shift a_6 2%Z in let a_12 : addr := havoc t_2 t_3 a_10 29%Z a_11 in ¬ i = 0%Z -> ¬ i_1 = 0%Z -> ¬ Mk_addr 0%Z 0%Z = a_4 -> ¬ a_5 = Mk_addr 0%Z 0%Z -> ¬ x = - 3%Z -> ¬ x = 0%Z -> ¬ x_1 = - 3%Z -> ¬ a_6 = Mk_addr 0%Z 0%Z -> ¬ a_7 = Mk_addr 0%Z 0%Z -> ¬ a_8 = Mk_addr 0%Z 0%Z -> ¬ x_2 = 0%Z -> 0%Z ≤ i -> 0%Z ≤ i_1 -> i_4 ≤ i_1 -> 0%Z ≤ i_2 -> 0%Z ≤ i_3 -> 0%Z ≤ i_5 -> 0%Z ≤ x -> region (base a_1) ≤ 0%Z -> region (base a_2) ≤ 0%Z -> region (base a_3) ≤ 0%Z -> region (base a_4) ≤ 0%Z -> - 2147483648%Z ≤ i_5 -> 2%Z ≤ i_3 -> 2%Z ≤ i_4 -> 3%Z ≤ i -> i_2 ≤ 28%Z -> i_5 ≤ 65535%Z -> i_5 ≤ 2147483647%Z -> - 2147483651%Z ≤ x -> - 2147483648%Z ≤ x -> - 3%Z ≤ x -> x ≤ 65532%Z -> x ≤ 65535%Z -> x ≤ 2147483644%Z -> x ≤ 2147483647%Z -> i_1 ≤ 65535%Z + i_4 -> i_1 ≤ 2147483647%Z + i_4 -> i_4 ≤ 2147483648%Z + i_1 -> - 3%Z ≤ x_1 -> - 2147483651%Z ≤ x_3 -> - 3%Z ≤ x_3 -> x_3 ≤ 65532%Z -> x_3 ≤ 2147483644%Z -> x_4 ≤ i_1 -> 3%Z + i + i_3 + i_4 + i_5 ≤ i_1 -> framed t_3 -> linked t -> is_uint16 i -> is_uint16 i_1 -> is_uint16 i_3 -> is_uint16 i_4 -> is_uint16 i_5 -> valid_rw t a_1 1%Z -> valid_rw t a_2 1%Z -> valid_rw t a_3 15%Z -> is_uint16 x -> is_uint16 x_5 -> valid_rw t a_10 29%Z -> is_uint16 x_4 -> is_uint8 x_2 -> valid_rd t a_9 1%Z -> valid_rd t a_11 1%Z -> (0%Z < i_1 -> valid_rd t (shift a_4 0%Z) i_1) -> (0%Z < i -> valid_rd t a_5 i) -> (- 2%Z ≤ x_1 -> valid_rd t a_5 x_4) -> (- 2%Z ≤ x -> valid_rd t a_7 x_5) -> (0%Z < x -> valid_rd t a_8 x) -> a_12 = Mk_addr 8618%Z 0%Z ∨ a_12 = Mk_addr 8619%Z 0%Z ∨ a_12 = Mk_addr 8650%Z 0%Z ∨ a_12 = Mk_addr 8647%Z 0%Z ∨ a_12 = Mk_addr 8632%Z 0%Z ∨ a_12 = Mk_addr 8631%Z 0%Z ∨ a_12 = Mk_addr 8620%Z 0%Z ∨ a_12 = Mk_addr 8668%Z 0%Z ∨ a_12 = Mk_addr 8634%Z 0%Z ∨ a_12 = Mk_addr 8629%Z 0%Z ∨ a_12 = Mk_addr 8651%Z 0%Z ∨ a_12 = Mk_addr 8622%Z 0%Z ∨ a_12 = Mk_addr 8636%Z 0%Z ∨ a_12 = Mk_addr 8637%Z 0%Z ∨ a_12 = Mk_addr 8630%Z 0%Z ∨ a_12 = Mk_addr 8633%Z 0%Z.
Proof.
Admitted.
