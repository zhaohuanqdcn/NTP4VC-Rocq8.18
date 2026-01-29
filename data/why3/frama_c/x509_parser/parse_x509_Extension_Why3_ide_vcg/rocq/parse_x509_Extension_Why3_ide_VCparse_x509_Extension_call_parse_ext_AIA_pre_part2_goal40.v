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
Theorem goal40 (a_4 : addr) (i_5 : Z) (i_1 : Z) (i_6 : Z) (i_3 : Z) (i_4 : Z) (a_1 : addr) (i_2 : Z) (t_1 : addr -> addr) (t_2 : addr -> addr) (i : Z) (a_2 : addr) (a_3 : addr) (t : Z -> Z) : let a_5 : addr := shift a_4 i_5 in let x : Z := i_1 + i_6 in let a_6 : addr := shift___anonstruct__ext_oid_14 (Mk_addr (- 8682%Z) 0%Z) i_3 in let a_7 : addr := shift a_4 (i_1 + i_5) in let a_8 : addr := shift a_4 (i_1 + i_4 + i_5) in let a_9 : addr := shift a_1 0%Z in let a_10 : addr := shift a_6 2%Z in let x_1 : Z := i_1 + i_5 + i_6 in let x_2 : Z := i_6 - i_4 in ¬ i_1 = 0%Z -> ¬ i_2 = 0%Z -> ¬ i_6 = 0%Z -> ¬ Mk_addr 0%Z 0%Z = a_4 -> ¬ a_5 = Mk_addr 0%Z 0%Z -> ¬ x = 0%Z -> ¬ a_6 = Mk_addr 0%Z 0%Z -> ¬ a_7 = Mk_addr 0%Z 0%Z -> ¬ a_8 = Mk_addr 0%Z 0%Z -> havoc t_1 t_2 a_9 29%Z a_10 = Mk_addr 8618%Z 0%Z -> i < 0%Z -> 0%Z ≤ i_1 -> 0%Z ≤ i_2 -> i_5 ≤ i_2 -> 0%Z ≤ i_3 -> 0%Z ≤ i_4 -> i_4 < i_6 -> 0%Z ≤ i_6 -> x ≤ i_2 -> 0%Z ≤ x -> region (base a_1) ≤ 0%Z -> region (base a_2) ≤ 0%Z -> region (base a_3) ≤ 0%Z -> region (base a_4) ≤ 0%Z -> x_1 ≤ i_2 -> 0%Z ≤ x_1 -> - 2147483648%Z ≤ i_6 -> 2%Z ≤ i_4 -> 2%Z ≤ i_5 -> 3%Z ≤ i_1 -> i_3 ≤ 28%Z -> i_6 ≤ 65535%Z -> i_6 ≤ 2147483647%Z -> i_2 ≤ 65535%Z + i_5 -> i_2 ≤ 2147483647%Z + i_5 -> i_4 ≤ 2147483648%Z + i_6 -> i_5 ≤ 2147483648%Z + i_2 -> i_6 ≤ 65535%Z + i_4 -> i_6 ≤ 2147483647%Z + i_4 -> - 2147483648%Z ≤ x_1 -> x_1 ≤ 65535%Z -> x_1 ≤ 2147483647%Z -> framed t_2 -> linked t -> is_uint16 i_1 -> is_uint16 i_2 -> is_uint16 i_4 -> is_uint16 i_5 -> is_uint16 i_6 -> is_sint32 i -> valid_rw t a_1 1%Z -> valid_rw t a_2 1%Z -> valid_rw t a_3 15%Z -> is_uint16 x -> is_uint16 x_2 -> valid_rw t a_9 29%Z -> valid_rd t a_10 1%Z -> (0%Z < i_2 -> valid_rd t (shift a_4 0%Z) i_2) -> (0%Z < i_1 -> valid_rd t a_5 i_1) -> (0%Z < x -> valid_rd t a_5 x) -> (0%Z < i_6 -> valid_rd t a_7 i_6) -> valid_rd t a_8 x_2.
Proof.
Admitted.
