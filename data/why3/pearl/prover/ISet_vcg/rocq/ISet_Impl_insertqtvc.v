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
Theorem insert'vc (l : list Z) (x : Z) (fact0 : iset_ok l) : (match l with | [] => True | cons y q => ¬ x < y -> y < x -> (match l with | [] => False | cons _ f => f = q end) ∧ iset_ok q end) ∧ (∀(result : list Z), (match l with | [] => result = cons x ([] : list Z) | cons y q => (if decide (x < y) then result = cons x l else if decide (y < x) then ∃(o1 : list Z), (iset_ok o1 ∧ (∀(y1 : Z), (y1 ∈ o1) = (y1 = x ∨ y1 ∈ q))) ∧ result = cons y o1 else result = l) end) -> iset_ok result ∧ (∀(y : Z), (y ∈ result) = (y = x ∨ y ∈ l))).
Proof.
Admitted.
