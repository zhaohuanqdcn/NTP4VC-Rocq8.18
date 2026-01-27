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
Open Scope Z_scope.
Definition bijection {β : Type} {α : Type} `{Inhabited β} `{Countable β} `{Inhabited α} `{Countable α} (p : gset α) (q : β -> bool) (f : α -> β) (g : β -> α) := (∀(x : α), x ∈ p -> q (f x) = true ∧ g (f x) = x) ∧ (∀(x : β), q x = true -> g x ∈ p ∧ f (g x) = x).
Axiom cardinal : Type -> Type.
Axiom cardinal_inhabited : forall  {α : Type} `{Inhabited α} `{Countable α}, Inhabited (cardinal α).
Global Existing Instance cardinal_inhabited.
Axiom card : forall {α : Type} `{Inhabited α} `{Countable α}, cardinal α -> Z.
Axiom cset : forall {α : Type} `{Inhabited α} `{Countable α}, cardinal α -> gset α.
Axiom cardinal'invariant : forall  {α : Type} `{Inhabited α} `{Countable α} (self : cardinal α), card self = Z.of_nat (size (cset self)).
Definition cardinal'eq {α : Type} `{Inhabited α} `{Countable α} (a : cardinal α) (b : cardinal α) := card a = card b ∧ cset a = cset b.
Axiom cardinal'inj : forall  {α : Type} `{Inhabited α} `{Countable α} (a : cardinal α) (b : cardinal α) (fact0 : cardinal'eq a b), a = b.
Theorem cmap'vc {β : Type} {α : Type} `{Inhabited β} `{Countable β} `{Inhabited α} `{Countable α} (i : cardinal α) (q : β -> bool) (f : α -> β) (g : β -> α) (fact0 : bijection (cset i) q f g) : let o1 : gset α := cset i in bijection o1 q f g ∧ (∀(o2 : gset β), (∀(x : β), (q x = true) = (x ∈ o2)) ∧ size o1 = size o2 -> (let o3 : Z := card i in o3 = Z.of_nat (size o2) ∧ (∀(result : cardinal β), card result = o3 ∧ cset result = o2 -> (∀(x : β), (x ∈ cset result) = (q x = true)) ∧ card result = card i))).
Admitted.
