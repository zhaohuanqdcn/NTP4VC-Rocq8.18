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
Require Import prover.ISet.Types.
Require Import prover.Functions.Config.
Require Import prover.ISet.Logic.
Open Scope Z_scope.
Theorem remove'vc (l : list Z) (x : Z) (fact0 : iset_ok l) : (match l with | [] => True | cons y q => (match l with | [] => False | cons _ f => f = q end) ∧ iset_ok q end) ∧ (∀(result : list Z), (match l with | [] => result = ([] : list Z) | cons y q => (if decide (y = x) then iset_ok result ∧ (∀(y1 : Z), (y1 ∈ result) = (y1 ∈ q ∧ ¬ y1 = x)) else ∃(o1 : list Z), (iset_ok o1 ∧ (∀(y1 : Z), (y1 ∈ o1) = (y1 ∈ q ∧ ¬ y1 = x))) ∧ result = cons y o1) end) -> iset_ok result ∧ (∀(y : Z), (y ∈ result) = (y ∈ l ∧ ¬ y = x))).
Admitted.
