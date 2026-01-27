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
Axiom matrix : Type -> Type.
Axiom matrix_inhabited : forall  {α : Type} `{Inhabited α}, Inhabited (matrix α).
Global Existing Instance matrix_inhabited.
Axiom elts : forall {α : Type} `{Inhabited α}, matrix α -> Z -> Z -> α.
Axiom rows : forall {α : Type} `{Inhabited α}, matrix α -> bv 63%N.
Axiom columns : forall {α : Type} `{Inhabited α}, matrix α -> bv 63%N.
Axiom matrix'invariant : forall  {α : Type} `{Inhabited α} (self : matrix α), 0%Z ≤ bv_signed (rows self) ∧ 0%Z ≤ bv_signed (columns self).
Axiom get_unsafe : forall {α : Type} `{Inhabited α}, matrix α -> Z -> Z -> α.
Axiom get_unsafe'spec : forall  {α : Type} `{Inhabited α} (a : matrix α) (r : Z) (c : Z), get_unsafe a r c = elts a r c.
Axiom set_unsafe : forall {α : Type} `{Inhabited α}, matrix α -> Z -> Z -> α -> matrix α.
Axiom set_unsafe'spec : forall  {α : Type} `{Inhabited α} (a : matrix α) (r : Z) (c : Z) (v : α), rows (set_unsafe a r c v) = rows a ∧ columns (set_unsafe a r c v) = columns a ∧ elts (set_unsafe a r c v) = fun_updt (elts a) r (fun_updt (elts a r) c v).
Definition valid_index {α : Type} `{Inhabited α} (a : matrix α) (r : bv 63%N) (c : bv 63%N) := (0%Z ≤ bv_signed r ∧ bv_signed r < bv_signed (rows a)) ∧ 0%Z ≤ bv_signed c ∧ bv_signed c < bv_signed (columns a).
