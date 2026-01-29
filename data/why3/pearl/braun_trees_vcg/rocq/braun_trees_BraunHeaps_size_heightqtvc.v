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
Require Import Why3.bintree.Tree.
Require Import Why3.bintree.Size.
Require Import Why3.bintree.Occ.
Require Import Why3.bintree.Height.
Open Scope Z_scope.
Axiom elt : Type.
Axiom elt_inhabited : Inhabited elt.
Global Existing Instance elt_inhabited.
Axiom elt_countable : Countable elt.
Global Existing Instance elt_countable.
Axiom le : elt -> elt -> Prop.
Axiom Refl : forall  (x : elt), le x x.
Axiom Trans : forall  (x : elt) (y : elt) (z : elt) (fact0 : le x y) (fact1 : le y z), le x z.
Axiom Total : forall  (x : elt) (y : elt), le x y ∨ le y x.
Definition le_root (e : elt) (t : tree elt) := match t with | Empty => True | Node _ x _ => le e x end.
Program Fixpoint heap (t : tree elt) : Prop :=
match t with | Empty => True | Node l x r => le_root x l ∧ heap l ∧ le_root x r ∧ heap r end.
Admit Obligations.
Axiom minimum : tree elt -> elt.
Axiom minimum_def : forall  (l : tree elt) (x : elt) (r : tree elt), minimum (Node l x r) = x.
Definition is_minimum (x : elt) (t : tree elt) := mem x t ∧ (∀(e : elt), mem e t -> le x e).
Program Fixpoint inv (t : tree elt) : Prop :=
match t with | Empty => True | Node l _ r => (Size.size l = Size.size r ∨ Size.size l = Size.size r + 1%Z) ∧ inv l ∧ inv r end.
Admit Obligations.
Axiom empty : tree elt.
Axiom empty'def : heap empty ∧ inv empty ∧ Size.size empty = 0%Z ∧ (∀(e : elt), ¬ mem e empty).
Theorem size_height'vc (t1 : tree elt) (t2 : tree elt) (fact0 : inv t1) (fact1 : inv t2) (fact2 : Size.size t2 ≤ Size.size t1) : height t2 ≤ height t1.
Proof.
Admitted.
