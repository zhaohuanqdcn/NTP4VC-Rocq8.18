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
Require Import register_allocation_vcg.register_allocation.Spec.
Require Import register_allocation_vcg.register_allocation.DWP.
Open Scope Z_scope.
Axiom k : Z.
Axiom k'def : 2%Z ≤ k.
Theorem n'vc (e : expr) : match e with | Evar _ => True | Eneg e1 => (match e with | Evar _ => False | Eneg f => f = e1 | Eadd f f1 => f = e1 ∨ f1 = e1 end) | Eadd e1 e2 => (match e with | Evar _ => False | Eneg f => f = e1 | Eadd f f1 => f = e1 ∨ f1 = e1 end) ∧ (match e with | Evar _ => False | Eneg f => f = e2 | Eadd f f1 => f = e2 ∨ f1 = e2 end) end.
Admitted.
