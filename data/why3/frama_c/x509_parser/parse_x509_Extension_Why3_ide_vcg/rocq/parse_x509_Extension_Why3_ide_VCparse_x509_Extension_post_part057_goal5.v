From Stdlib Require Import Strings.String.
From Stdlib Require Import String Ascii.
From Stdlib Require Arith.
From stdpp Require Import base.
From stdpp Require Import fin_maps.
From stdpp Require Import gmap.
From stdpp Require Import base gmultiset.
From Stdlib Require Classical.
From Stdlib Require Import ZArith.
From stdpp.bitvector Require Import definitions tactics.
From Stdlib Require Import Sorting.Sorted.
From Stdlib Require Import Reals.Rbasic_fun.
From Stdlib Require Import Reals.Abstract.ConstructiveAbs.
From Stdlib Require Import Reals.Rdefinitions.
From stdpp Require Import list_relations.
From stdpp Require Import list_numbers.
From stdpp Require Import functions.
From Stdlib Require Import ClassicalEpsilon.
From stdpp Require Import base decidable.
From Stdlib Require Import ZArith.Zeuclid.
From Stdlib Require Import ZArith.Znumtheory.
From stdpp Require Import propset.
From Stdlib Require Import Reals.
Require Import Why3.Base.
Require Import Why3.Qed.Qed.
Require Import Why3.Memory.Memory.
Require Import x509_parser.Compound.Compound.
Require Import x509_parser.Globals.Globals.
Require Import Why3.Cint.Cint.
Open Scope Z_scope.
Theorem goal5 (a_4 : addr) (a_3 : addr) (i_4 : Z) (i_5 : Z) (i_1 : Z) (i_3 : Z) (i : Z) (a_1 : addr) (t_1 : addr -> Z) (i_2 : Z) (t_2 : addr -> addr) (t_3 : addr -> addr) (a_2 : addr) (t : Z -> Z) : let x : Z := base a_4 in let x_1 : Z := base a_3 in let x_2 : Z := i_4 + i_5 in let x_3 : Z := i_1 + i_4 + i_5 in let a_5 : addr := shift___anonstruct__ext_oid_14 (Mk_addr (- 8682%Z) 0%Z) i_3 in let a_6 : addr := shift a_4 (i - i_5) in let a_7 : addr := shift a_4 (i - i_4 - i_5) in let a_8 : addr := shift a_4 (i - 3%Z - i_4 - i_5) in let a_9 : addr := shift a_1 0%Z in let a_10 : addr := shift a_5 2%Z in let x_6 : Z := i - 3%Z - i_1 - i_4 - i_5 in let a_11 : addr := shift a_4 x_6 in let a_12 : addr := shift a_4 (i - 1%Z - i_4 - i_5) in let x_7 : Z := t_1 a_12 in let x_8 : Z := 3%Z + i_1 + i_4 + i_5 in let x_9 : Z := i_1 + i_2 + i_4 + i_5 in let x_10 : Z := 3%Z + i_4 + i_5 in ¬ i_1 = 0%Z -> ¬ i_2 = 0%Z -> ¬ i_5 = 0%Z -> ¬ Mk_addr 0%Z 0%Z = a_4 -> ¬ x = x_1 -> ¬ x_2 = - 3%Z -> ¬ x_2 = 0%Z -> ¬ x_3 = - 3%Z -> ¬ a_5 = Mk_addr 0%Z 0%Z -> ¬ a_6 = Mk_addr 0%Z 0%Z -> ¬ a_7 = Mk_addr 0%Z 0%Z -> ¬ a_8 = Mk_addr 0%Z 0%Z -> havoc t_2 t_3 a_9 29%Z a_10 = Mk_addr 8629%Z 0%Z -> ¬ a_11 = Mk_addr 0%Z 0%Z -> ¬ x_7 = 0%Z -> 0%Z ≤ i -> 0%Z ≤ i_1 -> 0%Z ≤ i_2 -> i ≤ i_2 -> 0%Z ≤ i_3 -> 0%Z ≤ i_4 -> 0%Z ≤ i_5 -> 0%Z ≤ x_2 -> region (base a_1) ≤ 0%Z -> region (base a_2) ≤ 0%Z -> region x_1 ≤ 0%Z -> region x ≤ 0%Z -> - 2147483648%Z ≤ i -> - 2147483648%Z ≤ i_5 -> 2%Z ≤ i_4 -> 3%Z ≤ i_1 -> i_3 ≤ 28%Z -> i ≤ 65535%Z -> i_5 ≤ 65535%Z -> i ≤ 2147483647%Z -> i_5 ≤ 2147483647%Z -> - 2147483651%Z ≤ x_2 -> - 2147483648%Z ≤ x_2 -> - 3%Z ≤ x_2 -> x_2 ≤ 65532%Z -> x_2 ≤ 65535%Z -> x_2 ≤ 2147483644%Z -> x_2 ≤ 2147483647%Z -> - 3%Z ≤ x_3 -> 5%Z + i_1 + i_4 + i_5 ≤ i -> x_8 ≤ i_2 -> x_9 ≤ 65532%Z + i -> x_9 ≤ 2147483644%Z + i -> i ≤ 3%Z + i_1 + i_2 + i_4 + i_5 -> i ≤ 2147483651%Z + i_1 + i_2 + i_4 + i_5 -> framed t_3 -> linked t -> is_uint16 i -> is_uint16 i_1 -> is_uint16 i_2 -> is_uint16 i_4 -> is_uint16 i_5 -> valid_rw t a_1 1%Z -> valid_rw t a_2 1%Z -> valid_rw t a_3 15%Z -> is_uint16 x_2 -> is_uint16 x_10 -> valid_rw t a_9 29%Z -> is_uint16 x_8 -> is_uint16 x_6 -> valid_rd t a_10 1%Z -> is_uint8 x_7 -> valid_rd t a_12 1%Z -> (0%Z < i_2 -> valid_rd t (shift a_4 0%Z) i_2) -> (0%Z < i_5 -> valid_rd t a_6 i_5) -> (0%Z < x_2 -> valid_rd t a_7 x_2) -> (- 2%Z ≤ x_2 -> valid_rd t a_8 x_10) -> (0%Z < i_1 -> valid_rd t a_11 i_1) -> (- 2%Z ≤ x_3 -> valid_rd t a_11 x_8) -> 0%Z < i.
Admitted.
