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
Inductive term :=
  | S : term
  | K : term
  | App : term -> term -> term.
Axiom term_inhabited : Inhabited term.
Global Existing Instance term_inhabited.
Axiom term_countable : Countable term.
Global Existing Instance term_countable.
Theorem eq'vc (y : term) (x : term) : (match y with | S => (match x with | S => True | _ => True end) | K => (match x with | K => True | _ => True end) | App x1 x2 => (match x with | App x3 x4 => True | _ => True end) end) ∧ (∀(result : bool), (match y with | S => (match x with | S => result = true | _ => result = false end) | K => (match x with | K => result = true | _ => result = false end) | App x1 x2 => (match x with | App x3 x4 => (if decide (x3 = x1) then result = (if decide (x4 = x2) then true else false) else result = false) | _ => result = false end) end) -> (result = true) = (x = y)).
Admitted.
