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
Theorem add'vc {α : Type} `{Inhabited α} (t1 : t α) (x : α) : let n : Z := size t1 in let o1 : Z := n + 1%Z in 0%Z ≤ o1 ∧ (∀(t_data : rarray α), len t_data = o1 ∧ (∀(i : Z), 0%Z ≤ i ∧ i < len (data t1) -> i < o1 -> mixfix_lbrb t_data i = mixfix_lbrb (data t1) i) -> (0%Z ≤ n ∧ n < len t_data) ∧ (len (mixfix_lblsmnrb t_data n x) = len t_data -> len (mixfix_lblsmnrb t_data n x) = len t_data -> (∀(t2 : t α), ((0%Z ≤ n + 1%Z ∧ n + 1%Z = len (mixfix_lblsmnrb t_data n x)) ∧ (∀(x1 : α), add x (contents t1) x1 = numof (mixfix_lblsmnrb t_data n x) x1 0%Z (n + 1%Z))) ∧ (add x (contents t1) = contents t2 ∧ mixfix_lblsmnrb t_data n x = data t2 ∧ n + 1%Z = size t2 -> size t2 = size t1 + 1%Z ∧ infix_eqeq (contents t2) (add x (contents t1)))))).
Proof.
Admitted.
