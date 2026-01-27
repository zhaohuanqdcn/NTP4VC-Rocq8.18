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
Require Import WP_revisited.blocking_semantics5.Syntax.
Require Import WP_revisited.blocking_semantics5.SemOp.
Require Import WP_revisited.blocking_semantics5.FreshVariables.
Open Scope Z_scope.
Definition valid_triple (p : fmla) (s : stmt) (q : fmla) := ∀(sigma : mident -> value) (pi : list (ident * value)), eval_fmla sigma pi p -> (∀(sigma' : mident -> value) (pi' : list (ident * value)) (n : Z), many_steps sigma pi s sigma' pi' Sskip n -> eval_fmla sigma' pi' q).
Definition total_valid_triple (p : fmla) (s : stmt) (q : fmla) := ∀(sigma : mident -> value) (pi : list (ident * value)), eval_fmla sigma pi p -> (∃(sigma' : mident -> value) (pi' : list (ident * value)) (n : Z), many_steps sigma pi s sigma' pi' Sskip n ∧ eval_fmla sigma' pi' q).
Theorem consequence_rule'vc (p' : fmla) (p : fmla) (s : stmt) (q : fmla) (q' : fmla) (fact0 : valid_fmla (Fimplies p' p)) (fact1 : valid_triple p s q) (fact2 : valid_fmla (Fimplies q q')) : valid_triple p' s q'.
Admitted.
