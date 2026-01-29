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
Open Scope Z_scope.
Axiom matrix : Type -> Type.
Axiom matrix_inhabited : forall  {α : Type} `{Inhabited α}, Inhabited (matrix α).
Global Existing Instance matrix_inhabited.
Axiom elts : forall {α : Type} `{Inhabited α}, matrix α -> Z -> Z -> α.
Axiom rows : forall {α : Type} `{Inhabited α}, matrix α -> Z.
Axiom columns : forall {α : Type} `{Inhabited α}, matrix α -> Z.
Axiom matrix'invariant : forall  {α : Type} `{Inhabited α} (self : matrix α), 0%Z ≤ rows self ∧ 0%Z ≤ columns self.
Definition valid_index {α : Type} `{Inhabited α} (a : matrix α) (r : Z) (c : Z) := (0%Z ≤ r ∧ r < rows a) ∧ 0%Z ≤ c ∧ c < columns a.
Definition get {α : Type} `{Inhabited α} (a : matrix α) (r : Z) (c : Z) : α := elts a r c.
Axiom update : forall {α : Type} `{Inhabited α}, matrix α -> Z -> Z -> α -> matrix α.
Axiom update'spec'1 : forall  {α : Type} `{Inhabited α} (a : matrix α) (r : Z) (c : Z) (v : α), rows (update a r c v) = rows a.
Axiom update'spec'0 : forall  {α : Type} `{Inhabited α} (a : matrix α) (r : Z) (c : Z) (v : α), columns (update a r c v) = columns a.
Axiom update'spec : forall  {α : Type} `{Inhabited α} (a : matrix α) (r : Z) (c : Z) (v : α), elts (update a r c v) = fun_updt (elts a) r (fun_updt (elts a r) c v).
