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
Require Import Why3.why3.Ref.Ref.
Open Scope Z_scope.
Axiom loc : Type.
Axiom loc_inhabited : Inhabited loc.
Global Existing Instance loc_inhabited.
Axiom loc_countable : Countable loc.
Global Existing Instance loc_countable.
Axiom eq_loc : loc -> loc -> bool.
Axiom eq_loc'spec : forall  (l1 : loc) (l2 : loc), (eq_loc l1 l2 = true) = (l1 = l2).
Axiom null : loc.
Definition disjoint (l1 : list loc) (l2 : list loc) := ∀(x : loc), ¬ (x ∈ l1 ∧ x ∈ l2).
Program Fixpoint no_repet (l : list loc) : Prop :=
match l with | [] => True | cons x r => ¬ x ∈ r ∧ no_repet r end.
Admit Obligations.
Inductive list_seg : loc -> (loc -> loc) -> list loc -> loc -> Prop :=
 | list_seg_nil (p : loc) (next : loc -> loc) : list_seg p next ([] : list loc) p
 | list_seg_cons (p : loc) (next : loc -> loc) (l : list loc) (q : loc) : ¬ p = null -> list_seg (next p) next l q -> list_seg p next (cons p l) q.
Theorem list_seg_append'vc (p : loc) (next : loc -> loc) (pM : list loc) (q : loc) (qM : list loc) (r : loc) (fact0 : list_seg p next pM q) (fact1 : list_seg q next qM r) : list_seg p next (pM ++ qM) r.
Admitted.
