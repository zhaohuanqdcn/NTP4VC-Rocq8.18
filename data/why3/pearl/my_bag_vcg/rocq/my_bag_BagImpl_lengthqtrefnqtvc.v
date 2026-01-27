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
Axiom t : Type -> Type.
Axiom t_inhabited : forall  {α : Type} `{Inhabited α}, Inhabited (t α).
Global Existing Instance t_inhabited.
Axiom size : forall {α : Type} `{Inhabited α}, t α -> Z.
Axiom data : forall {α : Type} `{Inhabited α}, t α -> rarray α.
Axiom contents : forall {α : Type} `{Inhabited α}, t α -> α -> Z.
Axiom t'invariant : forall  {α : Type} `{Inhabited α} (self : t α), 0%Z ≤ size self ∧ size self = len (data self) ∧ (∀(x : α), contents self x = numof (data self) x 0%Z (size self)).
Definition t'eq {α : Type} `{Inhabited α} (a : t α) (b : t α) := size a = size b ∧ data a = data b ∧ contents a = contents b.
Axiom t'inj : forall  {α : Type} `{Inhabited α} (a : t α) (b : t α) (fact0 : t'eq a b), a = b.
Theorem length'refn'vc : True.
Admitted.
