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
Require Import Why3.hashtbl.Hashtbl.
Open Scope Z_scope.
Axiom k1 : key.
Axiom k2 : key.
Axiom k3 : key.
Axiom kdiff : ¬ k1 = k2 ∧ ¬ k1 = k3 ∧ ¬ k2 = k3.
Theorem test1'vc (h : t bool) (fact0 : ∀(k : key), mixfix_lbrb h k = ([] : list bool)) : let o1 : key := k1 in ∀(h1 : t bool), mixfix_lbrb h1 o1 = cons true (mixfix_lbrb h o1) ∧ (∀(k' : key), ¬ k' = o1 -> mixfix_lbrb h1 k' = mixfix_lbrb h k') -> ¬ mixfix_lbrb h1 k1 = ([] : list bool).
Proof.
Admitted.
