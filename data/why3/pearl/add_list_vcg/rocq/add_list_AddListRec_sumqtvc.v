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
Require Import add_list_vcg.add_list.SumList.
Open Scope Z_scope.
Theorem sum'vc (l : list or_integer_float) : (match l with | [] => True | cons h t => (match l with | [] => False | cons _ f => f = t end) ∧ (match h with | Integer n => True | Real x => True end) end) ∧ (∀(si : Z) (sf : R), (match l with | [] => si = 0%Z ∧ sf = 0%R | cons h t => (match h with | Integer n => si = n + add_int t ∧ sf = add_real t | Real x => si = add_int t ∧ sf = Rplus x (add_real t) end) end) -> si = add_int l ∧ sf = add_real l).
Admitted.
