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
Theorem goal39 (a_4 : addr) (i_4 : Z) (i : Z) (i_5 : Z) (i_2 : Z) (i_3 : Z) (t_1 : addr -> Z) (a_1 : addr) (i_1 : Z) (t_2 : addr -> addr) (t_3 : addr -> addr) (a_2 : addr) (a_3 : addr) (t : Z -> Z) : let a_5 : addr := shift a_4 i_4 in let x : Z := i + i_5 in let a_6 : addr := shift___anonstruct__ext_oid_14 (Mk_addr (- 8682%Z) 0%Z) i_2 in let a_7 : addr := shift a_4 (i + i_4) in let a_8 : addr := shift a_4 (3%Z + i + i_4) in let a_9 : addr := shift a_4 (3%Z + i + i_3 + i_4) in let a_10 : addr := shift a_4 (2%Z + i + i_4) in let x_1 : Z := t_1 a_10 in let a_11 : addr := shift a_1 0%Z in let a_12 : addr := shift a_6 2%Z in let x_2 : Z := i + i_4 + i_5 in let x_3 : Z := i_5 - 3%Z in let x_4 : Z := i_5 - 3%Z - i_3 in ¬ i = 0%Z -> ¬ i_1 = 0%Z -> ¬ i_5 = 0%Z -> ¬ i_5 = 3%Z -> ¬ Mk_addr 0%Z 0%Z = a_4 -> ¬ a_5 = Mk_addr 0%Z 0%Z -> ¬ x = 0%Z -> ¬ a_6 = Mk_addr 0%Z 0%Z -> ¬ a_7 = Mk_addr 0%Z 0%Z -> ¬ a_8 = Mk_addr 0%Z 0%Z -> ¬ a_9 = Mk_addr 0%Z 0%Z -> ¬ x_1 = 0%Z -> havoc t_2 t_3 a_11 29%Z a_12 = Mk_addr 8618%Z 0%Z -> 0%Z ≤ i -> 0%Z ≤ i_1 -> i_4 ≤ i_1 -> 0%Z ≤ i_2 -> 0%Z ≤ i_3 -> 0%Z ≤ i_5 -> x ≤ i_1 -> 0%Z ≤ x -> region (base a_1) ≤ 0%Z -> region (base a_2) ≤ 0%Z -> region (base a_3) ≤ 0%Z -> region (base a_4) ≤ 0%Z -> x_2 ≤ i_1 -> 0%Z ≤ x_2 -> - 2147483648%Z ≤ i_5 -> - 2147483645%Z ≤ i_5 -> 2%Z ≤ i_3 -> 2%Z ≤ i_4 -> 3%Z ≤ i -> 3%Z ≤ i_5 -> i_2 ≤ 28%Z -> i_5 ≤ 65535%Z -> i_5 ≤ 65538%Z -> i_5 ≤ 2147483647%Z -> i_5 ≤ 2147483650%Z -> i_1 ≤ 65535%Z + i_4 -> i_1 ≤ 2147483647%Z + i_4 -> i_3 ≤ 2147483645%Z + i_5 -> i_4 ≤ 2147483648%Z + i_1 -> 3%Z + i_3 ≤ i_5 -> 4%Z + i_3 ≤ i_5 -> i_5 ≤ 65538%Z + i_3 -> i_5 ≤ 2147483650%Z + i_3 -> - 2147483648%Z ≤ x_2 -> x_2 ≤ 65535%Z -> x_2 ≤ 2147483647%Z -> framed t_3 -> linked t -> is_uint16 i -> is_uint16 i_1 -> is_uint16 i_3 -> is_uint16 i_4 -> is_uint16 i_5 -> valid_rw t a_1 1%Z -> valid_rw t a_2 1%Z -> valid_rw t a_3 15%Z -> is_uint16 x_3 -> is_uint16 x -> valid_rw t a_11 29%Z -> is_uint16 x_4 -> is_uint8 x_1 -> valid_rd t a_10 1%Z -> valid_rd t a_12 1%Z -> (0%Z < i_1 -> valid_rd t (shift a_4 0%Z) i_1) -> (0%Z < i -> valid_rd t a_5 i) -> (0%Z < x -> valid_rd t a_5 x) -> (0%Z < i_5 -> valid_rd t a_7 i_5) -> (4%Z ≤ i_5 -> valid_rd t a_8 x_3) -> valid_rd t a_9 x_4.
Admitted.
