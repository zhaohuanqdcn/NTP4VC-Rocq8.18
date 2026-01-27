From Stdlib Require Import Strings.String.
From Stdlib Require Import String Ascii.
From Stdlib Require Arith.
From stdpp Require Import base.
From stdpp Require Import fin_maps.
From stdpp Require Import gmap.
From stdpp Require Import base gmultiset.
From Stdlib Require Classical.
From Stdlib Require Import ZArith.
From stdpp.bitvector Require Import definitions tactics.
From Stdlib Require Import Sorting.Sorted.
From Stdlib Require Import Reals.Rbasic_fun.
From Stdlib Require Import Reals.Abstract.ConstructiveAbs.
From Stdlib Require Import Reals.Rdefinitions.
From stdpp Require Import list_relations.
From stdpp Require Import list_numbers.
From stdpp Require Import functions.
From Stdlib Require Import ClassicalEpsilon.
From stdpp Require Import base decidable.
From Stdlib Require Import ZArith.Zeuclid.
From Stdlib Require Import ZArith.Znumtheory.
From stdpp Require Import propset.
From Stdlib Require Import Reals.
Require Import Why3.Base.
Require Import Why3.why3.Ref.Ref.
Require Import add_list_vcg.add_list.SumList.
Open Scope Z_scope.
Theorem sum'vc (l : list or_integer_float) : 0%Z + add_int l = add_int l ∧ Rplus 0%R (add_real l) = add_real l ∧ (∀(ll : list or_integer_float) (sf : R) (si : Z), si + add_int ll = add_int l ∧ Rplus sf (add_real ll) = add_real l -> (match ll with | [] => si = add_int l ∧ sf = add_real l | cons (Integer n) t => (match ll with | [] => False | cons _ f => f = t end) ∧ si + n + add_int t = add_int l ∧ Rplus sf (add_real t) = add_real l | cons (Real x) t => (match ll with | [] => False | cons _ f => f = t end) ∧ si + add_int t = add_int l ∧ Rplus (Rplus sf x) (add_real t) = add_real l end)).
Admitted.
