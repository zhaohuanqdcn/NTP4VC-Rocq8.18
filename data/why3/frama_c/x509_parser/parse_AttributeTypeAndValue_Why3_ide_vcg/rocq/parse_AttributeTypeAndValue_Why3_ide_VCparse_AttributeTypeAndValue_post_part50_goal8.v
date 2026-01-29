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
Theorem goal8 (a_2 : addr) (i_4 : Z) (i_1 : Z) (i_3 : Z) (i : Z) (i_2 : Z) (t_1 : addr -> addr) (a_1 : addr) (t : Z -> Z) : let a_3 : addr := shift a_2 i_4 in let x : Z := i_1 + i_4 in let a_4 : addr := shift___anonstruct__name_oid_11 (Mk_addr (- 8604%Z) 0%Z) i_3 in let a_5 : addr := shift a_2 x in let a_6 : addr := shift a_4 2%Z in let x_2 : Z := i - i_4 in let x_3 : Z := i - i_1 - i_4 in ¬ i_1 = 0%Z -> ¬ i_2 = 0%Z -> ¬ i_4 = i -> ¬ Mk_addr 0%Z 0%Z = a_2 -> ¬ a_3 = Mk_addr 0%Z 0%Z -> ¬ x = i -> ¬ a_4 = Mk_addr 0%Z 0%Z -> ¬ a_5 = Mk_addr 0%Z 0%Z -> t_1 a_6 = Mk_addr 8597%Z 0%Z -> 0%Z ≤ i -> i_4 ≤ i -> 0%Z ≤ i_1 -> 0%Z ≤ i_2 -> i ≤ i_2 -> i_4 ≤ i_2 -> 0%Z ≤ i_3 -> x ≤ i -> i ≤ i_2 + i_4 -> region (base a_1) ≤ 0%Z -> region (base a_2) ≤ 0%Z -> - 2147483648%Z ≤ i -> 2%Z ≤ i_4 -> 3%Z ≤ i_1 -> i_3 ≤ 15%Z -> i ≤ 65535%Z -> i ≤ 2147483647%Z -> i_2 ≤ 65535%Z + i_4 -> i_2 ≤ 2147483647%Z + i_4 -> i_4 ≤ 2147483648%Z + i_2 -> x ≤ 2147483648%Z + i -> i ≤ 65535%Z + i_1 + i_4 -> i ≤ 2147483647%Z + i_1 + i_4 -> framed t_1 -> linked t -> is_uint16 i -> is_uint16 i_1 -> is_uint16 i_2 -> is_uint16 i_4 -> valid_rw t a_1 1%Z -> is_uint16 x_2 -> is_uint16 x_3 -> valid_rd t a_6 1%Z -> (0%Z < i_2 -> valid_rd t (shift a_2 0%Z) i_2) -> (0%Z < i_1 -> valid_rd t a_3 i_1) -> (i_4 < i -> valid_rd t a_3 x_2) -> (x < i -> valid_rd t a_5 x_3) -> 2%Z ≤ i.
Proof.
Admitted.
