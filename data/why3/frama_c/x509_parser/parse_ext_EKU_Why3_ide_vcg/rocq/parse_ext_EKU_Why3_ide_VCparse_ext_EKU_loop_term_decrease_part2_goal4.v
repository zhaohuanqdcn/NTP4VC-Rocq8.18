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
Theorem goal4 (a_2 : addr) (a_1 : addr) (i_3 : Z) (a_3 : addr) (i : Z) (i_1 : Z) (i_2 : Z) (i_4 : Z) (t_1 : addr -> addr) (t : Z -> Z) : let x : Z := base a_2 in let x_1 : Z := base a_1 in let a_4 : addr := shift___anonstruct__kp_oid_13 (Mk_addr (- 8645%Z) 0%Z) i_3 in let a_5 : addr := shift a_4 0%Z in let a_6 : addr := shift a_3 0%Z in ¬ i = 0%Z -> ¬ i_1 = 0%Z -> ¬ i_2 = 0%Z -> ¬ i_4 = i_2 -> ¬ Mk_addr 0%Z 0%Z = a_2 -> ¬ Mk_addr 0%Z 0%Z = a_3 -> ¬ x = x_1 -> ¬ a_4 = Mk_addr 0%Z 0%Z -> ¬ t_1 a_5 = shift (Mk_addr (- 8638%Z) 0%Z) 0%Z -> 0%Z ≤ i -> i_1 ≤ i -> 0%Z ≤ i_1 -> 0%Z ≤ i_2 -> i_4 ≤ i_2 -> 0%Z ≤ i_3 -> 0%Z ≤ i_4 -> region x_1 ≤ 0%Z -> region x ≤ 0%Z -> - 2147483648%Z ≤ i_2 -> 2%Z ≤ i_4 -> 3%Z ≤ i_1 -> i_3 ≤ 6%Z -> i_2 ≤ 2147483647%Z -> i ≤ 65535%Z + i_1 -> i ≤ 2147483647%Z + i_1 -> i_1 ≤ 2147483648%Z + i -> framed t_1 -> linked t -> is_uint16 i -> is_uint16 i_1 -> is_uint16 i_2 -> is_uint16 i_4 -> valid_rw t a_1 15%Z -> is_uint16 (i - i_1) -> is_uint16 (i_2 - i_4) -> valid_rd t a_6 i -> valid_rd t a_5 1%Z -> (0%Z < i_2 -> valid_rd t (shift a_2 0%Z) i_2) -> (0%Z < i_1 -> valid_rd t a_6 i_1) -> 0%Z < i_1.
Proof.
Admitted.
