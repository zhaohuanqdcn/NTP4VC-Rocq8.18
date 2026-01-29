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
Axiom fc1 : forall {α : Type} `{Inhabited α}, α -> Z.
Axiom fc2 : forall {α : Type} `{Inhabited α}, α -> Z.
Axiom fc'def1 : forall  {α : Type} `{Inhabited α} (y0 : α), fc1 y0 = 0%Z.
Axiom fc'def2 : forall  {α : Type} `{Inhabited α} (y0 : α), fc2 y0 = 0%Z.
Theorem clear'vc {α : Type} `{Inhabited α} (t1 : t α) : let o1 : rarray α := data t1 in 0%Z ≤ 0%Z ∧ (∀(t_data : rarray α), len t_data = 0%Z ∧ (∀(i : Z), 0%Z ≤ i ∧ i < len o1 -> i < 0%Z -> mixfix_lbrb t_data i = mixfix_lbrb o1 i) -> (∀(t2 : t α) (t_contents : α -> Z), (∀(y0 : α), t_contents y0 = 0%Z) -> ((0%Z ≤ 0%Z ∧ 0%Z = len t_data) ∧ (∀(x : α), t_contents x = numof t_data x 0%Z 0%Z)) ∧ (t_contents = contents t2 ∧ t_data = data t2 ∧ 0%Z = size t2 -> size t2 = 0%Z ∧ infix_eqeq (contents t2) fc2))).
Proof.
Admitted.
