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
Require Import klibc_string.Axiomatic1.Axiomatic1.
Require Import klibc_string.Compound.Compound.
Require Import klibc_string.A_Length.A_Length.
Require Import klibc_string.Axiomatic.Axiomatic.
Open Scope Z_scope.
Axiom l_posofchar : (addr -> Z) -> addr -> Z -> Z.
Axiom Q_pos_of_char : forall  (c : Z) (malloc_0 : Z -> Z) (mchar_0 : addr -> Z) (s : addr) (pos_0 : Z) (fact0 : is_sint32 c) (fact1 : p_exists_first_occurence_of_char malloc_0 mchar_0 s c pos_0), l_posofchar mchar_0 s c = pos_0.
