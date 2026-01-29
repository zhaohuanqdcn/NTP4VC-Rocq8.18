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
Require Import klibc_string.Axiomatic.Axiomatic.
Require Import klibc_string.Compound.Compound.
Require Import klibc_string.A_Length.A_Length.
Open Scope Z_scope.
Theorem goal3 (a : addr) (i_2 : Z) (t : Z -> Z) (t_1 : addr -> Z) (i : Z) (i_1 : Z) (fact0 : region (base a) ≤ 0%Z) (fact1 : - 128%Z ≤ i_2) (fact2 : i_2 ≤ 127%Z) (fact3 : linked t) (fact4 : sconst t_1) (fact5 : is_sint32 i_2) (fact6 : p_length_of_str_is t t_1 a i) (fact7 : p_length_of_str_is t t_1 a i_1) : addr_le a (shift a (l_length t_1 a)).
Proof.
Admitted.
