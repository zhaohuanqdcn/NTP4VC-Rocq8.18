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
Require Import Why3.hashtbl.Hashtbl.
Open Scope Z_scope.
Axiom k1 : key.
Axiom k2 : key.
Axiom k3 : key.
Axiom kdiff : ¬ k1 = k2 ∧ ¬ k1 = k3 ∧ ¬ k2 = k3.
Theorem test1'vc (h : t bool) (fact0 : ∀(k : key), mixfix_lbrb h k = ([] : list bool)) : let o1 : key := k1 in ∀(h1 : t bool), mixfix_lbrb h1 o1 = cons true (mixfix_lbrb h o1) ∧ (∀(k' : key), ¬ k' = o1 -> mixfix_lbrb h1 k' = mixfix_lbrb h k') -> ¬ mixfix_lbrb h1 k1 = ([] : list bool).
Admitted.
