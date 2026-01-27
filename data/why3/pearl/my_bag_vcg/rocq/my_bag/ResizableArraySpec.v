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
Require Import Why3.map.Const.
Open Scope Z_scope.
Axiom rarray : Type -> Type.
Axiom rarray_inhabited : forall  {α : Type} `{Inhabited α}, Inhabited (rarray α).
Global Existing Instance rarray_inhabited.
Axiom len : forall {α : Type} `{Inhabited α}, rarray α -> Z.
Axiom data : forall {α : Type} `{Inhabited α}, rarray α -> Z -> α.
Axiom rarray'invariant : forall  {α : Type} `{Inhabited α} (self : rarray α), 0%Z ≤ len self.
Definition mixfix_lbrb {α : Type} `{Inhabited α} (r : rarray α) (i : Z) : α := data r i.
Axiom mixfix_lblsmnrb : forall {α : Type} `{Inhabited α}, rarray α -> Z -> α -> rarray α.
Axiom mixfix_lblsmnrb'spec'0 : forall  {α : Type} `{Inhabited α} (r : rarray α) (i : Z) (v : α), len (mixfix_lblsmnrb r i v) = len r.
Axiom mixfix_lblsmnrb'spec : forall  {α : Type} `{Inhabited α} (r : rarray α) (i : Z) (v : α), data (mixfix_lblsmnrb r i v) = fun_updt (data r) i v.
