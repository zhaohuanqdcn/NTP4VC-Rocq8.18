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
Require Import Why3.bintree.Tree.
Require Import Why3.bintree.Height.
Open Scope Z_scope.
Axiom o1 : forall {β : Type} `{Inhabited β}, (Z -> β) -> Z -> Z -> β.
Axiom result : forall {β : Type} `{Inhabited β}, (Z -> β) -> Z -> Z -> β.
Axiom o2 : forall {β : Type} `{Inhabited β} {α : Type} `{Inhabited α}, (Z -> β) -> tree α -> Z -> β.
Axiom result1 : forall {β : Type} `{Inhabited β}, (Z -> β) -> Z -> Z -> β.
Axiom o3 : forall {β : Type} `{Inhabited β} {α : Type} `{Inhabited α}, (Z -> β) -> tree α -> Z -> β.
Axiom result2 : forall {β : Type} `{Inhabited β}, (Z -> β) -> Z -> Z -> β.
Axiom o4 : forall {β : Type} `{Inhabited β} {α : Type} `{Inhabited α}, (Z -> β) -> tree α -> Z -> β.
Axiom o'def : forall  {β : Type} `{Inhabited β} (k : Z -> β) (hl : Z) (hr : Z), o1 k hl hr = k (1%Z + Z.max hl hr).
Axiom result'def : forall  {β : Type} `{Inhabited β} (k : Z -> β) (hl : Z) (hr : Z), result k hl hr = k (1%Z + Z.max hl hr).
Axiom o'def1 : forall  {β : Type} {α : Type} `{Inhabited β} `{Inhabited α} (k : Z -> β) (r : tree α) (hl : Z), o2 k r hl = result k hl (height r).
Axiom result'def1 : forall  {β : Type} `{Inhabited β} (k : Z -> β) (hl : Z) (hr : Z), result1 k hl hr = k (1%Z + Z.max hl hr).
Axiom o'def2 : forall  {β : Type} {α : Type} `{Inhabited β} `{Inhabited α} (k : Z -> β) (r : tree α) (hl : Z), o3 k r hl = result1 k hl (height r).
Axiom result'def2 : forall  {β : Type} `{Inhabited β} (k : Z -> β) (hl : Z) (hr : Z), result2 k hl hr = k (1%Z + Z.max hl hr).
Axiom o'def3 : forall  {β : Type} {α : Type} `{Inhabited β} `{Inhabited α} (k : Z -> β) (r : tree α) (hl : Z), o4 k r hl = result2 k hl (height r).
Theorem height_cps'vc {β : Type} {α : Type} `{Inhabited β} `{Inhabited α} (t : tree α) (k : Z -> β) : (match t with | Empty => True | Node l _ r => (match t with | Empty => False | Node f _ f1 => f = r ∨ f1 = r end) ∧ (match t with | Empty => False | Node f _ f1 => f = l ∨ f1 = l end) end) ∧ (∀(result3 : β), (match t with | Empty => result3 = k 0%Z | Node l _ r => result3 = o4 k r (height l) end) -> result3 = k (height t)).
Admitted.
