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
Require Import klibc_string.A_Length.A_Length.
Require Import klibc_string.Axiomatic.Axiomatic.
Open Scope Z_scope.
Definition p_exists_first_occurence_of_char (malloc_0 : Z -> Z) (mchar_0 : addr -> Z) (s : addr) (c : Z) (pos_0 : Z) := let x : Z := to_sint8 c in let x_1 : Z := l_length mchar_0 s in mchar_0 (shift s pos_0) = x ∧ 0%Z ≤ pos_0 ∧ pos_0 ≤ x_1 ∧ - 128%Z ≤ c ∧ c ≤ 127%Z ∧ valid_rw malloc_0 (shift s 0%Z) (1%Z + x_1) ∧ (∀(i : Z), 0%Z ≤ i -> i < pos_0 -> ¬ mchar_0 (shift s i) = x).
Definition p_char_in_str (mchar_0 : addr -> Z) (s : addr) (c : Z) := ∃(i : Z), mchar_0 (shift s i) = c ∧ 0%Z ≤ i ∧ i < l_length mchar_0 s.
