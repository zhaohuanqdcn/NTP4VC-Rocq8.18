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
Axiom o1 : forall {β : Type} `{Inhabited β} `{Countable β} {α : Type} `{Inhabited α} `{Countable α}, (β -> bool) -> (α -> β) -> α -> β -> bool.
Axiom o2 : forall {β : Type} `{Inhabited β} `{Countable β} {α : Type} `{Inhabited α} `{Countable α}, (β -> bool) -> (α -> β) -> α -> β -> bool.
Axiom o3 : forall {β : Type} `{Inhabited β} `{Countable β} {α : Type} `{Inhabited α} `{Countable α}, (β -> bool) -> (α -> β) -> α -> β -> bool.
Axiom o4 : forall {β : Type} `{Inhabited β} `{Countable β} {α : Type} `{Inhabited α} `{Countable α}, (β -> bool) -> (α -> β) -> α -> β -> bool.
Axiom o'def : forall  {β : Type} {α : Type} `{Inhabited β} `{Countable β} `{Inhabited α} `{Countable α} (q : β -> bool) (f : α -> β) (x : α) (y : β), (o1 q f x y = true) = (q y = true ∧ ¬ y = f x).
Axiom o'def1 : forall  {β : Type} {α : Type} `{Inhabited β} `{Countable β} `{Inhabited α} `{Countable α} (q : β -> bool) (f : α -> β) (x : α) (y : β), (o2 q f x y = true) = (q y = true ∧ ¬ y = f x).
Axiom o'def2 : forall  {β : Type} {α : Type} `{Inhabited β} `{Countable β} `{Inhabited α} `{Countable α} (q : β -> bool) (f : α -> β) (x : α) (y : β), (o3 q f x y = true) = (q y = true ∧ ¬ y = f x).
Axiom o'def3 : forall  {β : Type} {α : Type} `{Inhabited β} `{Countable β} `{Inhabited α} `{Countable α} (q : β -> bool) (f : α -> β) (x : α) (y : β), (o4 q f x y = true) = (q y = true ∧ ¬ y = f x).
Theorem bij_preserve'vc {β : Type} {α : Type} `{Inhabited β} `{Countable β} `{Inhabited α} `{Countable α} (p : gset α) (q : β -> bool) (f : α -> β) (g : β -> α) (fact0 : bijection p q f g) : let o5 : Z := Z.of_nat (size p) in (¬ o5 = 0%Z -> (let x : α := gset_pick_em p in let o6 : gset α := remove_set x p in (0%Z ≤ Z.of_nat (size p) ∧ Z.of_nat (size o6) < Z.of_nat (size p)) ∧ bijection o6 (o2 q f x) f g)) ∧ (∀(result : gset β), (if decide (o5 = 0%Z) then result = (∅ : gset β) else let x : α := gset_pick_em p in ∃(o6 : gset β), ((∀(x1 : β), (o4 q f x x1 = true) = (x1 ∈ o6)) ∧ size (remove_set x p) = size o6) ∧ result = insert_set (f x) o6) -> (∀(x : β), (q x = true) = (x ∈ result)) ∧ size p = size result).
Proof.
Admitted.
