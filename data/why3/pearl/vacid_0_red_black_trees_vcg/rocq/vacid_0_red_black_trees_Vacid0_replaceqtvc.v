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
Require Import Why3.why3.Ref.Ref.
Require Import vacid_0_red_black_trees_vcg.vacid_0_red_black_trees.RedBlackTree.
Open Scope Z_scope.
Axiom rbt : Type.
Axiom rbt_inhabited : Inhabited rbt.
Global Existing Instance rbt_inhabited.
Axiom rbt_countable : Countable rbt.
Global Existing Instance rbt_countable.
Definition inv (r : Z * tree) := match r with | (_, t) => bst t ∧ (∃(n : Z), rbtree n t) end.
Definition default (r : Z * tree) : Z := match r with | (d, _) => d end.
Definition mem (r : Z * tree) (k : Z) (v : Z) := match r with | (d, t) => memt t k v ∨ v = d ∧ (∀(v' : Z), ¬ memt t k v') end.
Theorem replace'vc (m : Z) (m1 : tree) (k : Z) (v : Z) (fact0 : inv (m, m1)) : bst m1 ∧ (∃(n : Z), rbtree n m1) ∧ (∀(o1 : tree), bst o1 ∧ (∃(n : Z), rbtree n o1) ∧ memt o1 k v ∧ (∀(k' : Z) (v' : Z), memt o1 k' v' = (if decide (k' = k) then v' = v else memt m1 k' v')) -> inv (m, o1) ∧ (∀(k' : Z) (v' : Z), mem (m, o1) k' v' = (if decide (k' = k) then v' = v else mem (m, m1) k' v'))).
Proof.
Admitted.
