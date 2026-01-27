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
Require Import prover.Functions.Config.
Require Import prover.Functions.Func.
Open Scope Z_scope.
Definition predExtensionalEqual {α : Type} `{Inhabited α} (p : α -> bool) (q : α -> bool) := ∀(x : α), (p x = true) = (q x = true).
Axiom predicateExtensionality : forall  {α : Type} `{Inhabited α} (p : α -> bool) (q : α -> bool) (fact0 : predExtensionalEqual p q), p = q.
Definition evalp {α : Type} `{Inhabited α} (p : α -> bool) (x : α) := p x = true.
Axiom pupdate : forall {α : Type} `{Inhabited α}, (α -> bool) -> α -> bool -> α -> bool.
Axiom pupdate_def : forall  {α : Type} `{Inhabited α} (p : α -> bool) (x : α) (y : bool) (z : α), (pupdate p x y z = true) = (if decide (x = z) then y = true else p z = true).
Theorem pupdate_neq'vc {α : Type} `{Inhabited α} (x : α) (z : α) (p : α -> bool) (y : bool) (fact0 : ¬ x = z) : (pupdate p x y z = true) = (p z = true).
Admitted.
