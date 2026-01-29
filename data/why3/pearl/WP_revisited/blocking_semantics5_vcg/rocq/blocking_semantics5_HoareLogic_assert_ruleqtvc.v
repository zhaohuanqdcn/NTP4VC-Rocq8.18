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
Require Import WP_revisited.blocking_semantics5.Syntax.
Require Import WP_revisited.blocking_semantics5.SemOp.
Require Import WP_revisited.blocking_semantics5.FreshVariables.
Open Scope Z_scope.
Definition valid_triple (p : fmla) (s : stmt) (q : fmla) := ∀(sigma : mident -> value) (pi : list (ident * value)), eval_fmla sigma pi p -> (∀(sigma' : mident -> value) (pi' : list (ident * value)) (n : Z), many_steps sigma pi s sigma' pi' Sskip n -> eval_fmla sigma' pi' q).
Definition total_valid_triple (p : fmla) (s : stmt) (q : fmla) := ∀(sigma : mident -> value) (pi : list (ident * value)), eval_fmla sigma pi p -> (∃(sigma' : mident -> value) (pi' : list (ident * value)) (n : Z), many_steps sigma pi s sigma' pi' Sskip n ∧ eval_fmla sigma' pi' q).
Theorem assert_rule'vc (p : fmla) (f : fmla) (fact0 : valid_fmla (Fimplies p f)) : valid_triple p (Sassert f) p.
Proof.
Admitted.
