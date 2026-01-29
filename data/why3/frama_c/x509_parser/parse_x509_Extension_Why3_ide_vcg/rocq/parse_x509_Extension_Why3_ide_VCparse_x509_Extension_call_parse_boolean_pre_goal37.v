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
Theorem goal37 (a_3 : addr) (i_3 : Z) (i : Z) (i_4 : Z) (i_1 : Z) (i_2 : Z) (a : addr) (a_1 : addr) (a_2 : addr) (t_1 : addr -> addr) (t : Z -> Z) : let a_4 : addr := shift a_3 i_3 in let a_5 : addr := shift a_3 (i + i_3) in let x : Z := i_3 + i_4 in let x_1 : Z := i_4 - i in ¬ i = 0%Z -> ¬ i_1 = 0%Z -> ¬ i_4 = 0%Z -> ¬ Mk_addr 0%Z 0%Z = a_3 -> ¬ a_4 = Mk_addr 0%Z 0%Z -> ¬ shift___anonstruct__ext_oid_14 (Mk_addr (- 8682%Z) 0%Z) i_2 = Mk_addr 0%Z 0%Z -> ¬ a_5 = Mk_addr 0%Z 0%Z -> 0%Z ≤ i -> i < i_4 -> 0%Z ≤ i_1 -> i_3 ≤ i_1 -> i_4 ≤ i_1 -> 0%Z ≤ i_2 -> 0%Z ≤ i_4 -> x ≤ i_1 -> 0%Z ≤ x -> region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> region (base a_2) ≤ 0%Z -> region (base a_3) ≤ 0%Z -> 2%Z ≤ i_3 -> 3%Z ≤ i -> i_2 ≤ 28%Z -> - 2147483648%Z ≤ x -> x ≤ 65535%Z -> x ≤ 2147483647%Z -> i ≤ 2147483648%Z + i_4 -> i_1 ≤ 65535%Z + i_3 -> i_1 ≤ 2147483647%Z + i_3 -> i_3 ≤ 2147483648%Z + i_1 -> i_4 ≤ 65535%Z + i -> i_4 ≤ 2147483647%Z + i -> framed t_1 -> linked t -> is_uint16 i -> is_uint16 i_1 -> is_uint16 i_3 -> is_uint16 i_4 -> valid_rw t a 1%Z -> valid_rw t a_1 1%Z -> valid_rw t a_2 15%Z -> is_uint16 x_1 -> valid_rw t (shift a 0%Z) 29%Z -> (0%Z < i_1 -> valid_rd t (shift a_3 0%Z) i_1) -> (0%Z < i -> valid_rd t a_4 i) -> (0%Z < i_4 -> valid_rd t a_4 i_4) -> valid_rd t a_5 x_1.
Proof.
Admitted.
