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
Require Import WP_revisited.blocking_semantics5.Typing.
Require Import WP_revisited.blocking_semantics5.TypingAndSemantics.
Require Import WP_revisited.blocking_semantics5.FreshVariables.
Open Scope Z_scope.
Axiom fresh_from : fmla -> ident.
Axiom fresh_from_fmla : forall  (f : fmla), fresh_in_fmla (fresh_from f) f.
Axiom abstract_effects : stmt -> fmla -> fmla.
Axiom abstract_effects_specialize : forall  (sigma : mident -> value) (pi : list (ident * value)) (s : stmt) (f : fmla) (fact0 : eval_fmla sigma pi (abstract_effects s f)), eval_fmla sigma pi f.
Axiom abstract_effects_distrib_conj : forall  (sigma : mident -> value) (pi : list (ident * value)) (s : stmt) (p : fmla) (q : fmla) (fact0 : eval_fmla sigma pi (abstract_effects s p)) (fact1 : eval_fmla sigma pi (abstract_effects s q)), eval_fmla sigma pi (abstract_effects s (Fand p q)).
Axiom abstract_effects_monotonic : forall  (p : fmla) (q : fmla) (sigma : mident -> value) (pi : list (ident * value)) (s : stmt) (fact0 : valid_fmla (Fimplies p q)) (fact1 : eval_fmla sigma pi (abstract_effects s p)), eval_fmla sigma pi (abstract_effects s q).
Program Fixpoint wp (s : stmt) (q : fmla) : fmla :=
match s with | Sskip => q | Sassert f => Fand f (Fimplies f q) | Sseq s1 s2 => wp s1 (wp s2 q) | Sassign x t => (let id1 : ident := fresh_from q in Flet id1 t (msubst q x id1)) | Sif t s1 s2 => Fand (Fimplies (Fterm t) (wp s1 q)) (Fimplies (Fnot (Fterm t)) (wp s2 q)) | Swhile cond inv body => Fand inv (abstract_effects body (Fand (Fimplies (Fand (Fterm cond) inv) (wp body inv)) (Fimplies (Fand (Fnot (Fterm cond)) inv) q))) end.
Admit Obligations.
Axiom abstract_effects_writes : forall  (body : stmt) (cond : term) (inv : fmla) (q : fmla) (sigma : mident -> value) (pi : list (ident * value)), eval_fmla sigma pi (abstract_effects body (Fand (Fimplies (Fand (Fterm cond) inv) (wp body inv)) (Fimplies (Fand (Fnot (Fterm cond)) inv) q))) -> eval_fmla sigma pi (wp body (abstract_effects body (Fand (Fimplies (Fand (Fterm cond) inv) (wp body inv)) (Fimplies (Fand (Fnot (Fterm cond)) inv) q)))).
Theorem distrib_conj'vc (sigma : mident -> value) (pi : list (ident * value)) (s : stmt) (p : fmla) (q : fmla) (fact0 : eval_fmla sigma pi (wp s p)) (fact1 : eval_fmla sigma pi (wp s q)) : eval_fmla sigma pi (wp s (Fand p q)).
Proof.
Admitted.
