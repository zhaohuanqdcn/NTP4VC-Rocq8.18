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
Require Import x509_parser.S22.S22.
Require Import x509_parser.Compound.Compound.
Require Import Why3.Cint.Cint.
Open Scope Z_scope.
Theorem goal125 (s : s22) (a_2 : addr) (a : addr) (a_1 : addr) (i_1 : Z) (i_5 : Z) (i_6 : Z) (i_8 : Z) (i_9 : Z) (t_1 : Z -> addr) (i_11 : Z) (i_2 : Z) (i_3 : Z) (i_4 : Z) (i_7 : Z) (i_10 : Z) (t_2 : addr -> Z) (t_3 : addr -> addr) (t : Z -> Z) (i : Z) : let x : Z := f22_aki_has_keyidentifier s in let x_1 : Z := f22_bc_critical s in let x_2 : Z := f22_ca_true s in let x_3 : Z := f22_has_crldp s in let x_4 : Z := f22_has_ski s in let x_5 : Z := f22_keycertsign_set s in let x_6 : Z := f22_one_crldp_has_all_reasons s in let x_7 : Z := f22_pathlenconstraint_set s in let x_8 : Z := base a_2 in let x_9 : Z := base a in let x_10 : Z := base a_1 in let a_3 : addr := shift a_2 i_1 in let x_11 : Z := i_5 + i_6 in let x_12 : Z := i_8 + i_9 in let a_4 : addr := t_1 i_11 in let a_5 : addr := shift a_4 4%Z in let a_6 : addr := shift a_2 (i_1 + i_2 - i_3) in let a_7 : addr := shift a_2 (i_1 + i_2 - i_4) in let a_8 : addr := shift a_2 (i_1 + i_2 - i_9) in let a_9 : addr := shift a_2 (i_1 + i_2 + i_5 - i_3) in let a_10 : addr := shift a_2 (i_1 + i_2 + i_7 - i_4) in let a_11 : addr := shift a_2 (i_1 + i_2 - i_8 - i_9) in let a_12 : addr := shift a_2 (i_1 + i_2 + i_5 + i_6 - i_3) in let x_17 : Z := i_1 + i_2 in let x_18 : Z := 2147483648%Z + i_3 in let x_20 : Z := i_3 - i_5 in let x_22 : Z := i_4 - i_7 in let x_24 : Z := i_3 - i_5 - i_6 in ¬ i_2 = 0%Z -> ¬ i_3 = 0%Z -> ¬ i_4 = 0%Z -> ¬ i_5 = i_3 -> ¬ i_7 = i_4 -> ¬ i_9 = 0%Z -> ¬ i_10 = 0%Z -> ¬ a_1 = a -> ¬ Mk_addr 0%Z 0%Z = a_2 -> ¬ x = 0%Z -> ¬ x_1 = 0%Z -> f22_crlsign_set s = 0%Z -> ¬ x_2 = 0%Z -> ¬ x_3 = 0%Z -> f22_has_name_constraints s = 0%Z -> ¬ x_4 = 0%Z -> ¬ x_5 = 0%Z -> ¬ x_6 = 0%Z -> ¬ x_7 = 0%Z -> f22_self_signed s = 0%Z -> ¬ x_8 = x_9 -> ¬ x_8 = x_10 -> ¬ a_3 = Mk_addr 0%Z 0%Z -> ¬ x_11 = i_3 -> ¬ x_12 = 0%Z -> t_2 a_5 = 1%Z -> ¬ i_5 + i_6 + 2%Z * i_4 = i_3 + i_7 + i_8 + i_9 -> ¬ a_6 = Mk_addr 0%Z 0%Z -> ¬ a_7 = Mk_addr 0%Z 0%Z -> ¬ a_8 = Mk_addr 0%Z 0%Z -> ¬ a_9 = Mk_addr 0%Z 0%Z -> ¬ a_10 = Mk_addr 0%Z 0%Z -> ¬ a_11 = Mk_addr 0%Z 0%Z -> ¬ a_12 = Mk_addr 0%Z 0%Z -> 0%Z < i_9 -> 0%Z ≤ i_2 -> 0%Z ≤ i_3 -> i_5 ≤ i_3 -> 0%Z ≤ i_4 -> i_7 ≤ i_4 -> 0%Z ≤ i_9 -> 0%Z ≤ i_10 -> i_1 ≤ i_10 -> i_2 ≤ i_10 -> x_11 ≤ i_3 -> x_17 ≤ i_10 -> 0%Z ≤ x_17 -> 0%Z ≤ x_12 -> region x_9 ≤ 0%Z -> region x_10 ≤ 0%Z -> region x_8 ≤ 0%Z -> - 2147483648%Z ≤ i_3 -> - 2147483648%Z ≤ i_4 -> - 2147483648%Z ≤ i_9 -> 2%Z ≤ i_1 -> 2%Z ≤ i_6 -> i_3 ≤ 65535%Z -> i_4 ≤ 65535%Z -> i_9 ≤ 65535%Z -> i_3 ≤ 2147483647%Z -> i_4 ≤ 2147483647%Z -> i_9 ≤ 2147483647%Z -> - 2147483648%Z ≤ x_17 -> - 2147483648%Z ≤ x_12 -> x_17 ≤ 65535%Z -> x_12 ≤ 65535%Z -> x_17 ≤ 2147483647%Z -> x_12 ≤ 2147483647%Z -> i_3 ≤ 65535%Z + i_5 -> i_3 ≤ 2147483647%Z + i_5 -> i_4 ≤ 65535%Z + i_7 -> i_4 ≤ 2147483647%Z + i_7 -> i_5 ≤ x_18 -> i_7 ≤ 2147483648%Z + i_4 -> x_11 ≤ x_18 -> i_3 ≤ 65535%Z + i_5 + i_6 -> i_3 ≤ 2147483647%Z + i_5 + i_6 -> 2%Z + i_4 + i_5 + i_6 ≤ i_3 -> 2%Z + i_7 + i_8 + i_9 ≤ i_4 -> framed t_3 -> linked t -> is_uint8 i_11 -> is_uint16 i_1 -> is_uint16 i_2 -> is_uint16 i_3 -> is_uint16 i_4 -> is_uint16 i_5 -> is_uint16 i_6 -> is_uint16 i_7 -> is_uint16 i_8 -> is_uint16 i_9 -> is_uint16 i_10 -> is_sint32 i -> is_sint32 x -> is_sint32 x_1 -> is_sint32 x_2 -> is_sint32 (f22_empty_subject s) -> is_sint32 x_3 -> is_sint32 x_4 -> is_sint32 x_5 -> is_sint32 x_6 -> is_sint32 x_7 -> valid_rw t a 1%Z -> valid_rw t a_1 1%Z -> valid_rd t a_4 8%Z -> is_uint16 x_17 -> is_uint16 x_12 -> is_uint16 (i_2 - i_3) -> is_uint16 x_20 -> is_uint16 x_22 -> valid_rd t a_5 1%Z -> is_uint16 x_24 -> is_uint16 (i_3 - i_4 - i_5 - i_6) -> is_uint16 (i_4 - i_7 - i_8 - i_9) -> valid_rd t a_8 i_9 -> (0%Z < i_10 -> valid_rd t (shift a_2 0%Z) i_10) -> (0%Z < i_2 -> valid_rd t a_3 i_2) -> (0%Z < i_3 -> valid_rd t a_6 i_3) -> (0%Z < i_4 -> valid_rd t a_7 i_4) -> (i_5 < i_3 -> valid_rd t a_9 x_20) -> (i_7 < i_4 -> valid_rd t a_10 x_22) -> (0%Z < x_12 -> valid_rd t a_11 x_12) -> (x_11 < i_3 -> valid_rd t a_12 x_24) -> i = 0%Z ∨ i = 1%Z -> 2%Z ≤ x_17.
Proof.
Admitted.
