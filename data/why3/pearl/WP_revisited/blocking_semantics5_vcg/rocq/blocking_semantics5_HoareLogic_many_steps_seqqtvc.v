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
Theorem many_steps_seq'vc (sigma1 : mident -> value) (pi1 : list (ident * value)) (s1 : stmt) (s2 : stmt) (sigma3 : mident -> value) (pi3 : list (ident * value)) (n : Z) (fact0 : many_steps sigma1 pi1 (Sseq s1 s2) sigma3 pi3 Sskip n) : ∃(sigma2 : mident -> value) (pi2 : list (ident * value)) (n1 : Z) (n2 : Z), many_steps sigma1 pi1 s1 sigma2 pi2 Sskip n1 ∧ many_steps sigma2 pi2 s2 sigma3 pi3 Sskip n2 ∧ n = 1%Z + n1 + n2.
Admitted.
