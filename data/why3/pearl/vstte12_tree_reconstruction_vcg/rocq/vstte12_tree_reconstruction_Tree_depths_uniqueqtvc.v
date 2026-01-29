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
Inductive tree :=
  | Leaf : tree
  | Node : tree -> tree -> tree.
Axiom tree_inhabited : Inhabited tree.
Global Existing Instance tree_inhabited.
Axiom tree_countable : Countable tree.
Global Existing Instance tree_countable.
Program Fixpoint depths (d : Z) (t : tree) : list Z :=
match t with | Leaf => cons d ([] : list Z) | Node l r => depths (d + 1%Z) l ++ depths (d + 1%Z) r end.
Admit Obligations.
Theorem depths_unique'vc (d : Z) (t1 : tree) (s1 : list Z) (t2 : tree) (s2 : list Z) (fact0 : depths d t1 ++ s1 = depths d t2 ++ s2) : t1 = t2 ∧ s1 = s2.
Proof.
Admitted.
