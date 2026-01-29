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
Require Import prover.ISet.Types.
Require Import prover.Functions.Config.
Require Import prover.ISet.Logic.
Open Scope Z_scope.
Theorem merge'vc (l1 : list Z) (l2 : list Z) (fact0 : iset_ok l1) (fact1 : iset_ok l2) : (match l1 with | [] => True | cons x q1 => (match l2 with | [] => True | cons y q2 => (if decide (x < y) then (match l1 with | [] => False | cons _ f => f = q1 end) ∧ iset_ok q1 ∧ iset_ok l2 else if decide (y < x) then (match l2 with | [] => False | cons _ f => f = q2 end) ∧ iset_ok l1 ∧ iset_ok q2 else ((match l1 with | [] => False | cons _ f => f = q1 end) ∨ l1 = q1 ∧ (match l2 with | [] => False | cons _ f => f = q2 end)) ∧ iset_ok q1 ∧ iset_ok q2) end) end) ∧ (∀(result : list Z), (match l1 with | [] => result = l2 | cons x q1 => (match l2 with | [] => result = l1 | cons y q2 => (if decide (x < y) then ∃(o1 : list Z), (iset_ok o1 ∧ (∀(y1 : Z), (y1 ∈ o1) = (y1 ∈ q1 ∨ y1 ∈ l2))) ∧ result = cons x o1 else if decide (y < x) then ∃(o1 : list Z), (iset_ok o1 ∧ (∀(y1 : Z), (y1 ∈ o1) = (y1 ∈ l1 ∨ y1 ∈ q2))) ∧ result = cons y o1 else ∃(o1 : list Z), (iset_ok o1 ∧ (∀(y1 : Z), (y1 ∈ o1) = (y1 ∈ q1 ∨ y1 ∈ q2))) ∧ result = cons x o1) end) end) -> iset_ok result ∧ (∀(y : Z), (y ∈ result) = (y ∈ l1 ∨ y ∈ l2))).
Proof.
Admitted.
