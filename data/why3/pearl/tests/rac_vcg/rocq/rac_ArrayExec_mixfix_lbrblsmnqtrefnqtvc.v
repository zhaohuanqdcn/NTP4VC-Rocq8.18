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
Inductive array (α : Type) :=
  | array'mk : Z -> (Z -> α) -> array α.
Axiom array_inhabited : forall  {α : Type} `{Inhabited α}, Inhabited (array α).
Global Existing Instance array_inhabited.
Arguments array'mk {α}.
Definition length {α : Type} (x : array α) := match x with |  array'mk a _ => a end.
Definition elts {α : Type} (x : array α) := match x with |  array'mk _ a => a end.
Axiom map_update : forall {α : Type} `{Inhabited α}, (Z -> α) -> Z -> α -> Z -> α.
Axiom map_update'def : forall  {α : Type} `{Inhabited α} (f : Z -> α) (i : Z) (x : α) (j : Z), map_update f i x j = (if decide (j = i) then x else f j).
Definition mixfix_lbrb' {α : Type} `{Inhabited α} (a : array α) (i : Z) : α := elts a i.
Definition mixfix_lbrb {α : Type} `{Inhabited α} (a : array α) (i : Z) : α := elts a i.
Axiom mixfix_lblsmnrb : forall {α : Type} `{Inhabited α}, array α -> Z -> α -> array α.
Axiom mixfix_lblsmnrb'spec'0 : forall  {α : Type} `{Inhabited α} (a : array α) (i : Z) (v : α), length (mixfix_lblsmnrb a i v) = length a.
Axiom mixfix_lblsmnrb'spec : forall  {α : Type} `{Inhabited α} (a : array α) (i : Z) (v : α), elts (mixfix_lblsmnrb a i v) = fun_updt (elts a) i v.
Theorem mixfix_lbrblsmn'refn'vc {α : Type} `{Inhabited α} (i : Z) (a : array α) (a1 : array α) (v : α) (fact0 : 0%Z ≤ i) (fact1 : i < length a) (fact2 : length a1 = length a) : elts a1 = fun_updt (elts a) i v ∧ a1 = mixfix_lblsmnrb a i v.
Admitted.
