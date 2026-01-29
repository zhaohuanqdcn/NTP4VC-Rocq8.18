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
Axiom elt : Type.
Axiom elt_inhabited : Inhabited elt.
Global Existing Instance elt_inhabited.
Axiom elt_countable : Countable elt.
Global Existing Instance elt_countable.
Axiom lt : elt -> elt -> Prop.
Axiom Trans : forall  (x : elt) (y : elt) (z : elt) (fact0 : lt x y) (fact1 : lt y z), lt x z.
Axiom Asymm : forall  (x : elt) (y : elt) (fact0 : lt x y), ¬ lt y x.
Axiom Trichotomy : forall  (x : elt) (y : elt), lt x y ∨ lt y x ∨ x = y.
Inductive tree :=
  | E : tree
  | N : Z -> tree -> elt -> tree -> tree.
Axiom tree_inhabited : Inhabited tree.
Global Existing Instance tree_inhabited.
Axiom tree_countable : Countable tree.
Global Existing Instance tree_countable.
Definition ht (t : tree) : Z := match t with | E => 0%Z | N h _ _ _ => h end.
Definition node (l : tree) (x : elt) (r : tree) : tree := N (1%Z + Z.max (ht l) (ht r)) l x r.
Theorem height'vc (t : tree) : (match t with | E => True | N _ l _ r => True end) ∧ (∀(result : Z), (match t with | E => result = 0%Z | N _ l _ r => (∃(o1 : Z), 0%Z ≤ o1 ∧ (∃(o2 : Z), 0%Z ≤ o2 ∧ result = 1%Z + Z.max o2 o1)) end) -> 0%Z ≤ result).
Proof.
Admitted.
