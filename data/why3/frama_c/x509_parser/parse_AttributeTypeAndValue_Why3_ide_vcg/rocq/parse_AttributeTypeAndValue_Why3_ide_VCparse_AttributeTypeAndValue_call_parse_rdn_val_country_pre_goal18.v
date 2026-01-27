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
Theorem goal18 (a_2 : addr) (i_3 : Z) (i : Z) (i_4 : Z) (i_2 : Z) (i_1 : Z) (t_1 : addr -> addr) (a_1 : addr) (t : Z -> Z) : let a_3 : addr := shift a_2 i_3 in let x : Z := i + i_4 in let a_4 : addr := shift___anonstruct__name_oid_11 (Mk_addr (- 8604%Z) 0%Z) i_2 in let a_5 : addr := shift a_2 (i + i_3) in let a_6 : addr := shift a_4 2%Z in let x_1 : Z := i + i_3 + i_4 in ¬ i = 0%Z -> ¬ i_1 = 0%Z -> ¬ Mk_addr 0%Z 0%Z = a_2 -> ¬ a_3 = Mk_addr 0%Z 0%Z -> ¬ x = 0%Z -> ¬ a_4 = Mk_addr 0%Z 0%Z -> ¬ a_5 = Mk_addr 0%Z 0%Z -> t_1 a_6 = Mk_addr 8593%Z 0%Z -> 0%Z < i_4 -> 0%Z ≤ i -> 0%Z ≤ i_1 -> i_3 ≤ i_1 -> 0%Z ≤ i_2 -> x ≤ i_1 -> 0%Z ≤ x -> region (base a_1) ≤ 0%Z -> region (base a_2) ≤ 0%Z -> x_1 ≤ i_1 -> 0%Z ≤ x_1 -> - 2147483648%Z ≤ i_4 -> 2%Z ≤ i_3 -> 3%Z ≤ i -> i_2 ≤ 15%Z -> i_4 ≤ 65535%Z -> i_4 ≤ 2147483647%Z -> i_1 ≤ 65535%Z + i_3 -> i_1 ≤ 2147483647%Z + i_3 -> i_3 ≤ 2147483648%Z + i_1 -> - 2147483648%Z ≤ x_1 -> x_1 ≤ 65535%Z -> x_1 ≤ 2147483647%Z -> framed t_1 -> linked t -> is_uint16 i -> is_uint16 i_1 -> is_uint16 i_3 -> is_uint16 i_4 -> valid_rw t a_1 1%Z -> is_uint16 x -> valid_rd t a_6 1%Z -> (0%Z < i_1 -> valid_rd t (shift a_2 0%Z) i_1) -> (0%Z < i -> valid_rd t a_3 i) -> (0%Z < x -> valid_rd t a_3 x) -> valid_rd t a_5 i_4.
Admitted.
