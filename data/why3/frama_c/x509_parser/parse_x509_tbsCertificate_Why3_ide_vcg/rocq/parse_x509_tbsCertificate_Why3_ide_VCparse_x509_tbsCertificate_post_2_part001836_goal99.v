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
Require Import x509_parser.S22.S22.
Require Import x509_parser.Compound.Compound.
Require Import Why3.Cint.Cint.
Open Scope Z_scope.
Theorem goal99 (s : s22) (a_2 : addr) (a : addr) (a_1 : addr) (i_1 : Z) (i_5 : Z) (i_6 : Z) (t_1 : Z -> addr) (i_10 : Z) (i_4 : Z) (i_3 : Z) (i_7 : Z) (i_8 : Z) (i_2 : Z) (i_9 : Z) (t_2 : addr -> Z) (t_3 : addr -> addr) (t : Z -> Z) (i : Z) : let x : Z := f22_ca_true s in let x_1 : Z := f22_has_ski s in let x_2 : Z := f22_self_signed s in let x_3 : Z := base a_2 in let x_4 : Z := base a in let x_5 : Z := base a_1 in let a_3 : addr := shift a_2 i_1 in let x_6 : Z := i_5 + i_6 in let a_4 : addr := t_1 i_10 in let a_5 : addr := shift a_4 4%Z in let x_7 : Z := 2%Z * i_4 in let x_8 : Z := i_5 + i_6 + x_7 in let x_9 : Z := i_3 + i_7 in let x_10 : Z := i_3 + i_7 + i_8 in let a_6 : addr := shift a_2 (i_1 + i_2 - i_3) in let a_7 : addr := shift a_2 (i_1 + i_2 - i_4) in let a_8 : addr := shift a_2 (i_1 + i_2 + i_5 - i_3) in let a_9 : addr := shift a_2 (i_1 + i_2 + i_7 - i_4) in let a_10 : addr := shift a_2 (i_1 + i_2 + i_5 + i_6 - i_3) in let a_11 : addr := shift a_2 (i_1 + i_2 + i_3 + i_7 - i_5 - i_6 - x_7) in let a_12 : addr := shift a_2 (i_1 + i_2 + i_3 + i_7 + i_8 - i_5 - i_6 - x_7) in let x_16 : Z := i_1 + i_2 in let x_17 : Z := 2147483648%Z + i_3 in let x_18 : Z := 2147483648%Z + i_5 + i_6 + x_7 in let x_19 : Z := i_3 - i_5 in let x_21 : Z := i_4 - i_7 in let x_22 : Z := i_3 - i_5 - i_6 in let x_23 : Z := i_3 - i_4 - i_5 - i_6 in let x_24 : Z := i_5 + i_6 + x_7 - i_3 - i_7 in let x_25 : Z := i_5 + i_6 + x_7 - i_3 - i_7 - i_8 in ¬ i_2 = 0%Z -> ¬ i_3 = 0%Z -> ¬ i_4 = 0%Z -> ¬ i_5 = i_3 -> ¬ i_7 = i_4 -> ¬ i_9 = 0%Z -> ¬ a_1 = a -> ¬ Mk_addr 0%Z 0%Z = a_2 -> f22_crlsign_set s = 0%Z -> ¬ x = 0%Z -> f22_has_crldp s = 0%Z -> f22_has_name_constraints s = 0%Z -> ¬ x_1 = 0%Z -> f22_keycertsign_set s = 0%Z -> f22_pathlenconstraint_set s = 0%Z -> ¬ x_2 = 0%Z -> ¬ x_3 = x_4 -> ¬ x_3 = x_5 -> ¬ a_3 = Mk_addr 0%Z 0%Z -> ¬ x_6 = i_3 -> t_2 a_5 = 1%Z -> ¬ x_8 = x_9 -> ¬ x_8 = x_10 -> ¬ a_6 = Mk_addr 0%Z 0%Z -> ¬ a_7 = Mk_addr 0%Z 0%Z -> ¬ a_8 = Mk_addr 0%Z 0%Z -> ¬ a_9 = Mk_addr 0%Z 0%Z -> ¬ a_10 = Mk_addr 0%Z 0%Z -> ¬ a_11 = Mk_addr 0%Z 0%Z -> ¬ a_12 = Mk_addr 0%Z 0%Z -> 0%Z ≤ i_2 -> 0%Z ≤ i_3 -> i_5 ≤ i_3 -> 0%Z ≤ i_4 -> i_7 ≤ i_4 -> 0%Z ≤ i_9 -> i_1 ≤ i_9 -> i_2 ≤ i_9 -> x_6 ≤ i_3 -> x_16 ≤ i_9 -> 0%Z ≤ x_16 -> region x_4 ≤ 0%Z -> region x_5 ≤ 0%Z -> region x_3 ≤ 0%Z -> x_10 < x_8 -> x_9 ≤ x_8 -> x_10 ≤ x_8 -> - 2147483648%Z ≤ i_3 -> - 2147483648%Z ≤ i_4 -> 2%Z ≤ i_1 -> 2%Z ≤ i_6 -> i_3 ≤ 65535%Z -> i_4 ≤ 65535%Z -> i_3 ≤ 2147483647%Z -> i_4 ≤ 2147483647%Z -> - 2147483648%Z ≤ x_16 -> x_16 ≤ 65535%Z -> x_16 ≤ 2147483647%Z -> i_3 ≤ 65535%Z + i_5 -> i_3 ≤ 2147483647%Z + i_5 -> i_4 ≤ 65535%Z + i_7 -> i_4 ≤ 2147483647%Z + i_7 -> i_5 ≤ x_17 -> i_7 ≤ 2147483648%Z + i_4 -> x_6 ≤ x_17 -> i_3 ≤ 65535%Z + i_5 + i_6 -> i_3 ≤ 2147483647%Z + i_5 + i_6 -> 2%Z + i_4 + i_5 + i_6 ≤ i_3 -> x_8 ≤ 65535%Z + i_3 + i_7 -> x_8 ≤ 2147483647%Z + i_3 + i_7 -> x_8 ≤ 65535%Z + i_3 + i_7 + i_8 -> x_8 ≤ 2147483647%Z + i_3 + i_7 + i_8 -> x_9 ≤ x_18 -> x_10 ≤ x_18 -> framed t_3 -> linked t -> is_uint8 i_10 -> is_uint16 i_1 -> is_uint16 i_2 -> is_uint16 i_3 -> is_uint16 i_4 -> is_uint16 i_5 -> is_uint16 i_6 -> is_uint16 i_7 -> is_uint16 i_8 -> is_uint16 i_9 -> is_sint32 i -> is_sint32 (f22_aki_has_keyidentifier s) -> is_sint32 (f22_bc_critical s) -> is_sint32 x -> is_sint32 (f22_empty_subject s) -> is_sint32 x_1 -> is_sint32 (f22_one_crldp_has_all_reasons s) -> is_sint32 x_2 -> valid_rw t a 1%Z -> valid_rw t a_1 1%Z -> valid_rd t a_4 8%Z -> is_uint16 x_16 -> is_uint16 (i_2 - i_3) -> is_uint16 x_19 -> is_uint16 x_21 -> valid_rd t a_5 1%Z -> is_uint16 x_22 -> is_uint16 x_23 -> is_uint16 x_24 -> is_uint16 x_25 -> valid_rd t a_9 x_23 -> valid_rd t a_10 x_23 -> valid_rd t a_12 x_25 -> (0%Z < i_9 -> valid_rd t (shift a_2 0%Z) i_9) -> (0%Z < i_2 -> valid_rd t a_3 i_2) -> (0%Z < i_3 -> valid_rd t a_6 i_3) -> (0%Z < i_4 -> valid_rd t a_7 i_4) -> (i_5 < i_3 -> valid_rd t a_8 x_19) -> (i_7 < i_4 -> valid_rd t a_9 x_21) -> (x_6 < i_3 -> valid_rd t a_10 x_22) -> (x_9 < x_8 -> valid_rd t a_11 x_24) -> i = 0%Z ∨ i = 1%Z -> 2%Z ≤ x_16.
Admitted.
