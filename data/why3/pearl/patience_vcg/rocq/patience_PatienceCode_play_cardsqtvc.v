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
Theorem play_cards'vc (stacks1 : list (list Z)) (input : list Z) (fact0 : wf_stacks stacks1) : (match input with | [] => True | cons c rem => (wf_stacks stacks1 ∧ wf_stacks ([] : list (list Z))) ∧ (∀(stacks' : list (list Z)), wf_stacks stacks' -> (match input with | [] => False | cons _ f => f = rem end) ∧ wf_stacks stacks') end) ∧ (∀(result : list (list Z)), (match input with | [] => result = stacks1 | cons c rem => (∃(stacks' : list (list Z)), wf_stacks stacks' ∧ wf_stacks result) end) -> wf_stacks result).
Proof.
Admitted.
