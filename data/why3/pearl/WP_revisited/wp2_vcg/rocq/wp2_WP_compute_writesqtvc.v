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
Theorem compute_writes'vc (s : stmt) : (match s with | Sskip => True | Sassign i _ => True | Sseq s1 s2 => (match s with | Sskip => False | Sassign _ _ => False | Sseq f f1 => f = s2 ∨ f1 = s2 | Sif _ f f1 => f = s2 ∨ f1 = s2 | Sassert _ => False | Swhile _ _ f => f = s2 end) ∧ (∀(o1 : set), (∀(sigma : Z -> value) (pi : Z -> value) (sigma' : Z -> value) (pi' : Z -> value) (n : Z), many_steps sigma pi s2 sigma' pi' Sskip n -> assigns sigma (to_fset o1) sigma') -> (match s with | Sskip => False | Sassign _ _ => False | Sseq f f1 => f = s1 ∨ f1 = s1 | Sif _ f f1 => f = s1 ∨ f1 = s1 | Sassert _ => False | Swhile _ _ f => f = s1 end)) | Sif _ s1 s2 => (match s with | Sskip => False | Sassign _ _ => False | Sseq f f1 => f = s2 ∨ f1 = s2 | Sif _ f f1 => f = s2 ∨ f1 = s2 | Sassert _ => False | Swhile _ _ f => f = s2 end) ∧ (∀(o1 : set), (∀(sigma : Z -> value) (pi : Z -> value) (sigma' : Z -> value) (pi' : Z -> value) (n : Z), many_steps sigma pi s2 sigma' pi' Sskip n -> assigns sigma (to_fset o1) sigma') -> (match s with | Sskip => False | Sassign _ _ => False | Sseq f f1 => f = s1 ∨ f1 = s1 | Sif _ f f1 => f = s1 ∨ f1 = s1 | Sassert _ => False | Swhile _ _ f => f = s1 end)) | Swhile _ _ s1 => (match s with | Sskip => False | Sassign _ _ => False | Sseq f f1 => f = s1 ∨ f1 = s1 | Sif _ f f1 => f = s1 ∨ f1 = s1 | Sassert _ => False | Swhile _ _ f => f = s1 end) | Sassert _ => True end) ∧ (∀(result : set), (match s with | Sskip => to_fset result = (∅ : gset Z) ∧ Z.of_nat (size (to_fset result)) = 0%Z | Sassign i _ => to_fset result = ({[i]} : gset _) ∧ Z.of_nat (size (to_fset result)) = 1%Z | Sseq s1 s2 => (∃(o1 : set), (∀(sigma : Z -> value) (pi : Z -> value) (sigma' : Z -> value) (pi' : Z -> value) (n : Z), many_steps sigma pi s2 sigma' pi' Sskip n -> assigns sigma (to_fset o1) sigma') ∧ (∃(o2 : set), (∀(sigma : Z -> value) (pi : Z -> value) (sigma' : Z -> value) (pi' : Z -> value) (n : Z), many_steps sigma pi s1 sigma' pi' Sskip n -> assigns sigma (to_fset o2) sigma') ∧ to_fset result = to_fset o2 ∪ to_fset o1)) | Sif _ s1 s2 => (∃(o1 : set), (∀(sigma : Z -> value) (pi : Z -> value) (sigma' : Z -> value) (pi' : Z -> value) (n : Z), many_steps sigma pi s2 sigma' pi' Sskip n -> assigns sigma (to_fset o1) sigma') ∧ (∃(o2 : set), (∀(sigma : Z -> value) (pi : Z -> value) (sigma' : Z -> value) (pi' : Z -> value) (n : Z), many_steps sigma pi s1 sigma' pi' Sskip n -> assigns sigma (to_fset o2) sigma') ∧ to_fset result = to_fset o2 ∪ to_fset o1)) | Swhile _ _ s1 => (∀(sigma : Z -> value) (pi : Z -> value) (sigma' : Z -> value) (pi' : Z -> value) (n : Z), many_steps sigma pi s1 sigma' pi' Sskip n -> assigns sigma (to_fset result) sigma') | Sassert _ => to_fset result = (∅ : gset Z) ∧ Z.of_nat (size (to_fset result)) = 0%Z end) -> (∀(sigma : Z -> value) (pi : Z -> value) (sigma' : Z -> value) (pi' : Z -> value) (n : Z), many_steps sigma pi s sigma' pi' Sskip n -> assigns sigma (to_fset result) sigma')).
Proof.
Admitted.
