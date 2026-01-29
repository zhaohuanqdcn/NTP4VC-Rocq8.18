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
Theorem goal18 (a_4 : addr) (a_3 : addr) (i_5 : Z) (i_6 : Z) (i_2 : Z) (i_4 : Z) (i : Z) (a_1 : addr) (i_3 : Z) (t_1 : addr -> addr) (t_2 : addr -> addr) (i_1 : Z) (a_2 : addr) (t : Z -> Z) : let x : Z := base a_4 in let x_1 : Z := base a_3 in let x_2 : Z := i_5 + i_6 in let x_3 : Z := i_2 + i_5 + i_6 in let a_5 : addr := shift___anonstruct__ext_oid_14 (Mk_addr (- 8682%Z) 0%Z) i_4 in let a_6 : addr := shift a_4 (i - i_6) in let a_7 : addr := shift a_4 (i - i_5 - i_6) in let x_6 : Z := i - i_2 - i_5 - i_6 in let a_8 : addr := shift a_4 x_6 in let a_9 : addr := shift a_1 0%Z in let a_10 : addr := shift a_5 2%Z in let x_7 : Z := i_2 + i_3 + i_5 + i_6 in ¬ i_2 = 0%Z -> ¬ i_3 = 0%Z -> ¬ i_6 = 0%Z -> ¬ Mk_addr 0%Z 0%Z = a_4 -> ¬ x = x_1 -> ¬ x_2 = 0%Z -> ¬ x_3 = 0%Z -> ¬ a_5 = Mk_addr 0%Z 0%Z -> ¬ a_6 = Mk_addr 0%Z 0%Z -> ¬ a_7 = Mk_addr 0%Z 0%Z -> ¬ a_8 = Mk_addr 0%Z 0%Z -> havoc t_1 t_2 a_9 29%Z a_10 = Mk_addr 8619%Z 0%Z -> 0%Z ≤ i -> i_1 < 0%Z -> 0%Z ≤ i_2 -> 0%Z ≤ i_3 -> i ≤ i_3 -> 0%Z ≤ i_4 -> 0%Z ≤ i_5 -> 0%Z ≤ i_6 -> 0%Z ≤ x_2 -> region (base a_1) ≤ 0%Z -> region (base a_2) ≤ 0%Z -> region x_1 ≤ 0%Z -> region x ≤ 0%Z -> x_3 ≤ i_3 -> 0%Z ≤ x_3 -> i ≤ x_7 -> - 2147483648%Z ≤ i -> - 2147483648%Z ≤ i_6 -> 2%Z ≤ i_5 -> 3%Z ≤ i_2 -> i_4 ≤ 28%Z -> i ≤ 65535%Z -> i_6 ≤ 65535%Z -> i ≤ 2147483647%Z -> i_6 ≤ 2147483647%Z -> - 2147483648%Z ≤ x_2 -> x_2 ≤ 65535%Z -> x_2 ≤ 2147483647%Z -> 2%Z + i_2 + i_5 + i_6 ≤ i -> x_7 ≤ 65535%Z + i -> x_7 ≤ 2147483647%Z + i -> i ≤ 2147483648%Z + i_2 + i_3 + i_5 + i_6 -> framed t_2 -> linked t -> is_uint16 i -> is_uint16 i_2 -> is_uint16 i_3 -> is_uint16 i_5 -> is_uint16 i_6 -> is_sint32 i_1 -> valid_rw t a_1 1%Z -> valid_rw t a_2 1%Z -> valid_rw t a_3 15%Z -> is_uint16 x_2 -> is_uint16 x_3 -> valid_rw t a_9 29%Z -> is_uint16 x_6 -> valid_rd t a_10 1%Z -> (0%Z < i_3 -> valid_rd t (shift a_4 0%Z) i_3) -> (0%Z < i_6 -> valid_rd t a_6 i_6) -> (0%Z < x_2 -> valid_rd t a_7 x_2) -> (0%Z < i_2 -> valid_rd t a_8 i_2) -> (0%Z < x_3 -> valid_rd t a_8 x_3) -> 0%Z < i.
Proof.
Admitted.
