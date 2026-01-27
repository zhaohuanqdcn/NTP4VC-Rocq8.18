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
Require Import Why3.map.Const.
Require Import my_bag_vcg.my_bag.Bag.
Require Import my_bag_vcg.my_bag.ResizableArraySpec.
Open Scope Z_scope.
Axiom fc : forall {α : Type} `{Inhabited α}, rarray α -> α -> Z -> bool.
Axiom fc'def : forall  {α : Type} `{Inhabited α} (r : rarray α) (x : α) (i : Z), (fc r x i = true) = (data r i = x).
Definition numof {α : Type} `{Inhabited α} (r : rarray α) (x : α) (l : Z) (u : Z) : Z := NumOf.numof (fc r x) l u.
Axiom fc1 : forall {α : Type} `{Inhabited α}, α -> Z.
Axiom fc2 : forall {α : Type} `{Inhabited α}, α -> Z.
Axiom fc'def1 : forall  {α : Type} `{Inhabited α} (y0 : α), fc1 y0 = 0%Z.
Axiom fc'def2 : forall  {α : Type} `{Inhabited α} (y0 : α), fc2 y0 = 0%Z.
Theorem t'vc {α : Type} `{Inhabited α} (o2 : α) : 0%Z ≤ 0%Z ∧ (∀(o1 : rarray α), len o1 = 0%Z ∧ data o1 = (const : α -> Z -> α) o2 -> (0%Z ≤ 0%Z ∧ 0%Z = len o1) ∧ (0%Z ≤ 0%Z ∧ 0%Z = len o1 -> (∀(x : α), fc2 x = numof o1 x 0%Z 0%Z))).
Admitted.
