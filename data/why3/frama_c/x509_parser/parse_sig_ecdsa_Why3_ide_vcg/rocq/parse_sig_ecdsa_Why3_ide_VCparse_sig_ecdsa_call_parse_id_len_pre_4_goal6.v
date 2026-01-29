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
Require Import x509_parser.Compound.Compound.
Open Scope Z_scope.
Theorem goal6 (a_1 : addr) (a : addr) (i_6 : Z) (i_2 : Z) (i_3 : Z) (i_5 : Z) (i : Z) (i_1 : Z) (t_1 : addr -> Z) (i_4 : Z) (t : Z -> Z) : let x : Z := base a_1 in let x_1 : Z := base a in let a_2 : addr := shift a_1 i_6 in let a_3 : addr := shift a_1 (1%Z + i_6) in let a_4 : addr := shift a_1 (1%Z + i_2 + i_6) in let a_5 : addr := shift a_1 (1%Z + i_2 + i_3 + i_5 + i_6) in let x_2 : Z := i + i_6 in let x_3 : Z := i_3 + i_5 in let x_4 : Z := to_sint32 x_3 in let x_5 : Z := i_2 + x_4 in let x_6 : Z := 2147483648%Z + i in let x_8 : Z := i - i_2 in let x_9 : Z := i - i_2 - i_3 - i_5 in ¬ i = - 1%Z -> ¬ i = 0%Z -> ¬ i_1 = 0%Z -> ¬ i_2 = i -> ¬ Mk_addr 0%Z 0%Z = a_1 -> ¬ x = x_1 -> t_1 a_2 = 0%Z -> ¬ a_3 = Mk_addr 0%Z 0%Z -> ¬ a_4 = Mk_addr 0%Z 0%Z -> ¬ a_5 = Mk_addr 0%Z 0%Z -> 0%Z ≤ i -> i < i_1 -> i_2 ≤ i -> i_4 ≤ i -> 0%Z ≤ i_1 -> i_6 ≤ i_1 -> i_2 + i_3 ≤ i -> i_2 + i_4 ≤ i -> i_2 + i_5 ≤ i -> x_2 < i_1 -> region x_1 ≤ 0%Z -> region x ≤ 0%Z -> i_2 + i_3 + i_5 < i -> x_5 ≤ i -> - 2147483648%Z ≤ i -> 2%Z ≤ i_2 -> 2%Z ≤ i_3 -> 2%Z ≤ i_6 -> i ≤ 65535%Z -> - 2147483649%Z ≤ x_2 -> - 2147483648%Z ≤ x_3 -> - 1%Z ≤ x_2 -> x_2 ≤ 65534%Z -> x_2 ≤ 2147483646%Z -> x_3 ≤ 2147483647%Z -> i ≤ 65535%Z + i_2 -> i ≤ 2147483647%Z + i_2 -> i_2 ≤ x_6 -> x_5 ≤ x_6 -> i ≤ 65535%Z + i_2 + x_4 -> i ≤ 2147483647%Z + i_2 + x_4 -> linked t -> is_uint16 i -> is_uint16 i_1 -> is_uint16 i_2 -> is_uint16 i_3 -> is_uint16 i_4 -> is_uint16 i_5 -> is_uint16 i_6 -> valid_rw t a 1%Z -> is_uint16 (1%Z + i) -> is_uint16 x_8 -> valid_rd t a_2 1%Z -> is_uint16 x_9 -> (0%Z < i_1 -> valid_rd t (shift a_1 0%Z) i_1) -> (0%Z < i -> valid_rd t a_3 i) -> (i_2 < i -> valid_rd t a_4 x_8) -> valid_rd t a_5 x_9.
Proof.
Admitted.
