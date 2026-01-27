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
Open Scope Z_scope.
Axiom value : Type.
Axiom value_inhabited : Inhabited value.
Global Existing Instance value_inhabited.
Axiom value_countable : Countable value.
Global Existing Instance value_countable.
Axiom dummy : value.
Axiom foo : value -> Prop.
Axiom add : value -> value -> value.
Inductive term :=
  | Val : Z -> term
  | Add : term -> term -> term.
Axiom term_inhabited : Inhabited term.
Global Existing Instance term_inhabited.
Axiom term_countable : Countable term.
Global Existing Instance term_countable.
Inductive fmla :=
  | Forall : fmla -> fmla
  | Foo : term -> fmla.
Axiom fmla_inhabited : Inhabited fmla.
Global Existing Instance fmla_inhabited.
Axiom fmla_countable : Countable fmla.
Global Existing Instance fmla_countable.
Program Fixpoint interp_term (t : term) (b : Z -> value) : value :=
match t with | Val n => b n | Add t1 t2 => add (interp_term t1 b) (interp_term t2 b) end.
Admit Obligations.
Program Fixpoint interp_fmla (f : fmla) (l : Z) (b : Z -> value) : bool :=
if decide (match f with | Foo t => foo (interp_term t b) | Forall f1 => (∀(v : value), interp_fmla f1 (l - 1%Z) (fun_updt b l v) = true) end) then true else false.
Admit Obligations.
Theorem f'vc : True.
Admitted.
