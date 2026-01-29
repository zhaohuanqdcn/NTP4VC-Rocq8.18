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
Require Import klibc_string.Compound.Compound.
Open Scope Z_scope.
Theorem goal4 (a : addr) (i_1 : Z) (i : Z) (i_2 : Z) (t : Z -> Z) (t_2 : addr -> Z) (t_1 : addr -> Z) : let a_1 : addr := shift a 0%Z in let x : Z := i_1 - i in ¬ i = 0%Z -> 0%Z ≤ i -> i < i_1 -> 0%Z ≤ i_1 -> region (base a) ≤ 0%Z -> - 128%Z ≤ i_2 -> i_2 ≤ 127%Z -> linked t -> sconst t_2 -> is_uint32 i -> is_uint32 i_1 -> is_sint32 i_2 -> valid_rw t a_1 i_1 -> ¬ invalid t a_1 x -> (∀(i_3 : Z), 0%Z ≤ i_3 -> i_3 + i < i_1 -> havoc t_1 t_2 a_1 x (shift a i_3) = i_2) -> to_uint32 (i - 1%Z) ≤ i.
Proof.
Admitted.
