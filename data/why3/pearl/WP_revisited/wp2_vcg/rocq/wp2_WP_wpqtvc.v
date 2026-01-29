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
Require Import WP_revisited.wp2.Imp.
Require Import WP_revisited.wp2.HoareLogic.
Open Scope Z_scope.
Axiom set : Type.
Axiom set_inhabited : Inhabited set.
Global Existing Instance set_inhabited.
Axiom set_countable : Countable set.
Global Existing Instance set_countable.
Axiom to_fset : set -> gset Z.
Axiom mk : gset Z -> set.
Axiom mk'spec : forall  (s : gset Z), to_fset (mk s) = s.
Axiom choose1 : set -> Z.
Axiom choose'spec : forall  (s : set) (fact0 : ¬ to_fset s = ∅), choose1 s ∈ to_fset s.
Definition assigns (sigma : Z -> value) (a : gset Z) (sigma' : Z -> value) := ∀(i : Z), ¬ i ∈ a -> sigma i = sigma' i.
Program Fixpoint stmt_writes (i : stmt) (w : gset Z) : Prop :=
match i with | Sskip => True | Sassert _ => True | Sassign id1 _ => id1 ∈ w | Sseq s1 s2 => stmt_writes s1 w ∧ stmt_writes s2 w | Sif _ s1 s2 => stmt_writes s1 w ∧ stmt_writes s2 w | Swhile _ _ s => stmt_writes s w end.
Admit Obligations.
Theorem wp'vc (i : stmt) (q : fmla) : (match i with | Sskip => True | Sseq i1 i2 => (match i with | Sskip => False | Sassign _ _ => False | Sseq f f1 => f = i2 ∨ f1 = i2 | Sif _ f f1 => f = i2 ∨ f1 = i2 | Sassert _ => False | Swhile _ _ f => f = i2 end) ∧ (∀(o1 : fmla), valid_triple o1 i2 q -> (match i with | Sskip => False | Sassign _ _ => False | Sseq f f1 => f = i1 ∨ f1 = i1 | Sif _ f f1 => f = i1 ∨ f1 = i1 | Sassert _ => False | Swhile _ _ f => f = i1 end)) | Sassign x e => True | Sif e i1 i2 => (match i with | Sskip => False | Sassign _ _ => False | Sseq f f1 => f = i2 ∨ f1 = i2 | Sif _ f f1 => f = i2 ∨ f1 = i2 | Sassert _ => False | Swhile _ _ f => f = i2 end) ∧ (∀(o1 : fmla), valid_triple o1 i2 q -> (match i with | Sskip => False | Sassign _ _ => False | Sseq f f1 => f = i1 ∨ f1 = i1 | Sif _ f f1 => f = i1 ∨ f1 = i1 | Sassert _ => False | Swhile _ _ f => f = i1 end)) | Sassert f => True | Swhile e inv i1 => (match i with | Sskip => False | Sassign _ _ => False | Sseq f f1 => f = i1 ∨ f1 = i1 | Sif _ f f1 => f = i1 ∨ f1 = i1 | Sassert _ => False | Swhile _ _ f => f = i1 end) end) ∧ (∀(result : fmla), (match i with | Sskip => result = q | Sseq i1 i2 => (∃(o1 : fmla), valid_triple o1 i2 q ∧ valid_triple result i1 o1) | Sassign x e => (∃(id1 : Z), fresh_in_fmla id1 q ∧ result = Flet id1 e (subst q x id1)) | Sif e i1 i2 => (∃(o1 : fmla), valid_triple o1 i2 q ∧ (∃(o2 : fmla), valid_triple o2 i1 q ∧ result = Fand (Fimplies (Fterm e) o2) (Fimplies (Fnot (Fterm e)) o1))) | Sassert f => result = Fimplies f q | Swhile e inv i1 => (∃(o1 : fmla), valid_triple o1 i1 inv ∧ (∃(o2 : fmla), (∀(sigma : Z -> value) (pi : Z -> value), eval_fmla sigma pi o2 -> eval_fmla sigma pi (Fand (Fimplies (Fand (Fterm e) inv) o1) (Fimplies (Fand (Fnot (Fterm e)) inv) q)) ∧ (∀(sigma' : Z -> value) (pi' : Z -> value) (n : Z), many_steps sigma pi i1 sigma' pi' Sskip n -> eval_fmla sigma' pi' o2)) ∧ result = Fand inv o2)) end) -> valid_triple result i q).
Proof.
Admitted.
