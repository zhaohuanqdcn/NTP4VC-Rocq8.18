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
Axiom card : Type.
Axiom card_inhabited : Inhabited card.
Global Existing Instance card_inhabited.
Axiom card_countable : Countable card.
Global Existing Instance card_countable.
Program Fixpoint wf_stacks (stacks1 : list (list Z)) : Prop :=
match stacks1 with | [] => True | cons [] _ => False | cons (cons _ _) rem => wf_stacks rem end.
Admit Obligations.
Theorem push_card'vc (stacks1 : list (list Z)) (acc : list (list Z)) (c : Z) (fact0 : wf_stacks stacks1) (fact1 : wf_stacks acc) : (match stacks1 with | [] => True | cons stack remaining_stacks => (match stack with | [] => False | cons c' _ => ¬ c ≤ c' -> (match stacks1 with | [] => False | cons _ f => f = remaining_stacks end) ∧ wf_stacks remaining_stacks ∧ wf_stacks (cons stack acc) end) end) ∧ (∀(result : list (list Z)), (match stacks1 with | [] => result = rev_append (cons (cons c ([] : list Z)) acc) ([] : list (list Z)) | cons stack remaining_stacks => (match stack with | [] => False | cons c' _ => (if decide (c ≤ c') then result = rev_append (cons (cons c stack) acc) remaining_stacks else wf_stacks result) end) end) -> wf_stacks result).
Proof.
Admitted.
