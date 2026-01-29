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
Axiom size : Z.
Axiom set : Type.
Axiom set_inhabited : Inhabited set.
Global Existing Instance set_inhabited.
Axiom set_countable : Countable set.
Global Existing Instance set_countable.
Axiom mem : Z -> set -> Prop.
Axiom remove : Z -> set -> set.
Axiom remove'spec : forall  (y : Z) (x : Z) (s : set), mem y (remove x s) = (¬ y = x ∧ mem y s).
Axiom below : Z -> set.
Axiom below'spec : forall  (n : Z) (x : Z) (fact0 : 0%Z ≤ n) (fact1 : n ≤ size), mem x (below n) = (0%Z ≤ x ∧ x < n).
Axiom cardinal : set -> Z.
Axiom cardinal_empty : forall  (s : set), (cardinal s = 0%Z) = (∀(x : Z), ¬ mem x s).
Axiom cardinal_remove : forall  (x : Z) (s : set) (fact0 : mem x s), cardinal s = 1%Z + cardinal (remove x s).
Axiom cardinal_below : forall  (n : Z) (fact0 : 0%Z ≤ n) (fact1 : n ≤ size), cardinal (below n) = (if decide (0%Z ≤ n) then n else 0%Z).
