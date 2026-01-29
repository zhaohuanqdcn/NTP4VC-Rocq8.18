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
Require Import klibc_string.Compound.Compound.
Require Import Why3.Cint.Cint.
Open Scope Z_scope.
Theorem goal5 (t_1 : addr -> Z) (a : addr) (i_1 : Z) (i : Z) (t : Z -> Z) : let x : Z := t_1 (shift a i_1) in 0%Z ≤ i -> 0%Z ≤ i_1 -> i_1 < i -> region (base a) ≤ 0%Z -> - 128%Z ≤ x -> x ≤ 126%Z -> linked t -> sconst t_1 -> is_uint32 i -> is_sint8 (t_1 (shift a (- 1%Z))) -> is_sint32 x -> valid_rw t (shift a 0%Z) i -> (∀(i_2 : Z), 0%Z ≤ i_2 -> i_2 < i -> ¬ x = t_1 (shift a i_2)) -> (∃(i_2 : Z), let x_1 : Z := t_1 (shift a i_2) in 0%Z ≤ i_2 -> i_2 < i -> shift a i_2 = Mk_addr 0%Z 0%Z ∧ x = x_1 ∧ (∀(i_3 : Z), i_3 < i -> i_2 < i_3 -> ¬ x = x_1)).
Proof.
Admitted.
