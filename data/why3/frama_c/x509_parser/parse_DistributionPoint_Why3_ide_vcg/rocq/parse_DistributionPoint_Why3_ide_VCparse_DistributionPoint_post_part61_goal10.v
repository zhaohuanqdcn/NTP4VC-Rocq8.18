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
Require Import Why3.Cint.Cint.
Require Import Why3.Cbits.Cbits.
Open Scope Z_scope.
Theorem goal10 (a_2 : addr) (a : addr) (a_1 : addr) (i_4 : Z) (i : Z) (t_1 : addr -> Z) (i_3 : Z) (i_1 : Z) (i_2 : Z) (t : Z -> Z) : let x : Z := base a_2 in let x_1 : Z := base a in let x_2 : Z := base a_1 in let a_3 : addr := shift a_2 i_4 in let x_3 : Z := i + i_4 in let a_4 : addr := shift a_1 12%Z in let m : addr -> Z := fun_updt t_1 a x_3 in let x_4 : Z := m a_4 in let x_5 : Z := fun_updt m a_4 (lor 1%Z x_4) a in ¬ i = 0%Z -> ¬ i_3 = 0%Z -> ¬ Mk_addr 0%Z 0%Z = a_2 -> ¬ x = x_1 -> ¬ x = x_2 -> ¬ a_3 = Mk_addr 0%Z 0%Z -> 0%Z ≤ i -> i_1 < 0%Z -> i_2 < 0%Z -> 0%Z ≤ i_3 -> i ≤ i_3 -> i_4 ≤ i_3 -> x_3 ≤ i_3 -> 0%Z ≤ x_3 -> region x_1 ≤ 0%Z -> region x_2 ≤ 0%Z -> region x ≤ 0%Z -> 2%Z ≤ i -> 2%Z ≤ i_4 -> - 2147483648%Z ≤ x_3 -> x_3 ≤ 65535%Z -> x_3 ≤ 2147483647%Z -> linked t -> is_uint16 i -> is_uint16 i_3 -> is_uint16 i_4 -> is_sint32 i_1 -> is_sint32 i_2 -> valid_rw t a 1%Z -> valid_rw t a_1 15%Z -> separated a 1%Z a_1 15%Z -> valid_rd t a_4 1%Z -> valid_rw t a_4 1%Z -> is_sint32 x_4 -> is_uint16 x_5 -> (0%Z < i_3 -> valid_rd t (shift a_2 0%Z) i_3) -> (0%Z < i -> valid_rd t a_3 i) -> 0%Z < x_5.
Proof.
Admitted.
