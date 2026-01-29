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
Theorem goal2 (i : Z) (t_1 : addr -> Z) (a : addr) (i_2 : Z) (i_1 : Z) (t : Z -> Z) : let x : Z := i - 1%Z in let x_1 : Z := t_1 (shift a x) in let x_2 : Z := t_1 (shift a i_2) in ¬ i = 0%Z -> ¬ x_1 = to_sint8 x_2 -> 0%Z ≤ i -> 0%Z ≤ i_1 -> i ≤ i_1 -> i_2 < i_1 -> region (base a) ≤ 0%Z -> to_uint32 x ≤ i_2 -> - 128%Z ≤ x_2 -> x_2 ≤ 126%Z -> linked t -> sconst t_1 -> is_uint32 i -> is_uint32 i_1 -> is_sint32 x_2 -> valid_rw t (shift a 0%Z) i_1 -> is_sint8 x_1 -> ¬ (∀(i_3 : Z), i ≤ i_3 -> i_3 < i_1 -> ¬ x_2 = t_1 (shift a i_3)).
Proof.
Admitted.
