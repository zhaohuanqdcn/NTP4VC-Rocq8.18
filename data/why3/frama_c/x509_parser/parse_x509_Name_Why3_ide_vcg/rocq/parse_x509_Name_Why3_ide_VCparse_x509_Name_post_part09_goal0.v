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
Theorem goal0 (a_2 : addr) (a : addr) (a_1 : addr) (i : Z) (i_1 : Z) (t_1 : addr -> Z) (i_2 : Z) (t : Z -> Z) (a_3 : addr) : let x : Z := base a_2 in let x_1 : Z := base a in let x_2 : Z := base a_1 in let x_3 : Z := i + i_1 in let x_4 : Z := fun_updt (fun_updt t_1 a_1 x_3) a (if decide (i_1 = 0%Z) then 1%Z else 0%Z) a_1 in ¬ i_2 = 0%Z -> ¬ a_1 = a -> ¬ Mk_addr 0%Z 0%Z = a_2 -> ¬ x = x_1 -> ¬ x = x_2 -> 0%Z ≤ i_2 -> i ≤ i_2 -> i_1 ≤ i_2 -> x_3 ≤ i_2 -> 0%Z ≤ x_3 -> region x_1 ≤ 0%Z -> region x_2 ≤ 0%Z -> region x ≤ 0%Z -> 2%Z ≤ i -> - 2147483648%Z ≤ x_3 -> x_3 ≤ 65535%Z -> x_3 ≤ 2147483647%Z -> linked t -> is_uint16 i -> is_uint16 i_1 -> is_uint16 i_2 -> valid_rw t a 1%Z -> valid_rw t a_1 1%Z -> valid_rd t (shift a_3 0%Z) 0%Z -> is_uint16 x_4 -> (0%Z < i_2 -> valid_rd t (shift a_2 0%Z) i_2) -> x_4 ≤ i_2.
Proof.
Admitted.
