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
Definition bijection {β : Type} {α : Type} `{Inhabited β} `{Countable β} `{Inhabited α} `{Countable α} (p : gset α) (q : β -> bool) (f : α -> β) (g : β -> α) := (∀(x : α), x ∈ p -> q (f x) = true ∧ g (f x) = x) ∧ (∀(x : β), q x = true -> g x ∈ p ∧ f (g x) = x).
Theorem cardinal'vc {α : Type} `{Inhabited α} `{Countable α} : 0%Z = Z.of_nat (size (∅ : gset α)).
Proof.
Admitted.
