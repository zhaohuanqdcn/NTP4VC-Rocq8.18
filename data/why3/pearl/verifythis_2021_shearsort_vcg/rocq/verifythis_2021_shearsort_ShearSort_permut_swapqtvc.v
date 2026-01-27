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
Theorem permut_swap'vc {α : Type} `{Inhabited α} (l : Z) (x : Z) (u : Z) (y : Z) (a : Z -> α) (b : Z -> α) (fact0 : l ≤ x) (fact1 : x < u) (fact2 : l ≤ y) (fact3 : y < u) (fact4 : ∀(i : Z), (l ≤ i ∧ i ≤ u) ∧ ¬ i = x ∧ ¬ i = y -> a i = b i) (fact5 : a x = b y) (fact6 : a y = b x) : permut a b l u.
Admitted.
