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
Require Import Why3.Cint.Cint.
Require Import klibc_string.Axiomatic2.Axiomatic2.
Open Scope Z_scope.
Axiom l_toupper : Z -> Z.
Axiom Q_TL_ToUpper : forall  (c : Z) (fact0 : is_uint8 c), is_sint8 (l_toupper c).
Axiom Q_to_upper_char : forall  (c : Z) (fact0 : is_uint8 c) (fact1 : p_is_lower c), 32%Z + l_toupper c = c ∧ (∀(i : Z), is_uint8 i -> p_is_upper i -> l_toupper i = i ∧ (∀(i_1 : Z), is_uint8 i_1 -> ¬ p_is_lower i_1 -> ¬ p_is_upper i_1 -> l_toupper i_1 = i_1)).
