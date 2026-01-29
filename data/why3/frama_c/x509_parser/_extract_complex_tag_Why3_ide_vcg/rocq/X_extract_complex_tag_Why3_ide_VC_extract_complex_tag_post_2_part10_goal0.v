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
Require Import Why3.Cint.Cint.
Require Import Why3.Cbits.Cbits.
Require Import x509_parser.Compound.Compound.
Open Scope Z_scope.
Theorem goal0 (a_2 : addr) (a : addr) (a_1 : addr) (i_1 : Z) (t_1 : addr -> Z) (i : Z) (i_2 : Z) (t : Z -> Z) : let x : Z := base a_2 in let x_1 : Z := base a in let x_2 : Z := base a_1 in let a_3 : addr := shift a_2 i_1 in let x_3 : Z := t_1 a_3 in let x_4 : Z := land 127%Z x_3 in let x_5 : Z := lsl i 7%Z in let x_6 : Z := x_5 + x_4 in ¬ i_1 = 4%Z -> ¬ i_2 = 0%Z -> ¬ a_1 = a -> ¬ Mk_addr 0%Z 0%Z = a_2 -> ¬ x = x_1 -> ¬ x = x_2 -> 0%Z ≤ i_1 -> 0%Z ≤ i_2 -> region x_1 ≤ 0%Z -> region x_2 ≤ 0%Z -> region x ≤ 0%Z -> i < lsl 1%Z (to_uint32 (7%Z * i_1)) -> 0%Z ≤ x_6 -> - 1%Z ≤ i_1 -> i_1 ≤ 3%Z -> i_1 ≤ 4%Z -> 5%Z ≤ i_2 -> i_1 ≤ 65534%Z -> i_1 ≤ 2147483646%Z -> x_5 ≤ 4294967295%Z -> 31%Z ≤ x_6 -> x_6 ≤ 4294967295%Z -> linked t -> is_uint16 i_1 -> is_uint16 i_2 -> is_uint32 i -> valid_rw t a 1%Z -> valid_rw t a_1 1%Z -> is_uint16 (1%Z + i_1) -> is_uint32 x_5 -> is_uint8 x_3 -> ¬ bit_test x_3 7%Z -> valid_rd t a_3 1%Z -> is_uint32 x_4 -> is_uint32 x_6 -> (0%Z < i_2 -> valid_rd t (shift a_2 0%Z) i_2) -> (∀(i_3 : Z), 0%Z ≤ i_3 -> i_3 < i_1 -> bit_test (t_1 (shift a_2 i_3)) 7%Z) -> i_1 < i_2.
Proof.
Admitted.
