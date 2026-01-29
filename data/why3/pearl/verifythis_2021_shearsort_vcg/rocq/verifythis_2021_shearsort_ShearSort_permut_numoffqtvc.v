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
Require Import Why3.int.NumOf.
Require Import Why3.int.Sum.
Require Import Why3.map.MapExt.
Require Import Why3.map.MapPermut.
Require Import Why3.matrix.Matrix.
Open Scope Z_scope.
Axiom column : forall {α : Type} `{Inhabited α}, matrix α -> Z -> Z -> α.
Axiom column'def : forall  {α : Type} `{Inhabited α} (m : matrix α) (j : Z) (i : Z), column m j i = elts m i j.
Axiom moccf : forall {α : Type} `{Inhabited α}, α -> (Z -> Z -> α) -> Z -> Z -> Z.
Axiom moccf'def : forall  {α : Type} `{Inhabited α} (x : α) (e : Z -> Z -> α) (c : Z) (i : Z), moccf x e c i = Z.of_nat (map_occ_list x (e i) 0%Z c).
Definition mocc {α : Type} `{Inhabited α} (x : α) (e : Z -> Z -> α) (r : Z) (c : Z) : Z := sum (moccf x e c) 0%Z r.
Axiom compose : forall {β : Type} `{Inhabited β} {γ : Type} `{Inhabited γ} {α : Type} `{Inhabited α}, (β -> γ) -> (α -> β) -> α -> γ.
Axiom compose'def : forall  {β : Type} {γ : Type} {α : Type} `{Inhabited β} `{Inhabited γ} `{Inhabited α} (g : β -> γ) (f : α -> β) (x : α), compose g f x = g (f x).
Theorem permut_numoff'vc {α : Type} `{Inhabited α} (l : Z) (u : Z) (a : Z -> α) (b : Z -> α) (p : α -> bool) (fact0 : l ≤ u) (fact1 : permut a b l u) : numof (compose p a) l u = numof (compose p b) l u.
Proof.
Admitted.
