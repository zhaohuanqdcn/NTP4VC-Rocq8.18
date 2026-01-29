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
Require Import Why3.int.NumOf.
Require Import Why3.map.Const.
Open Scope Z_scope.
Axiom key : Type.
Axiom key_inhabited : Inhabited key.
Global Existing Instance key_inhabited.
Axiom key_countable : Countable key.
Global Existing Instance key_countable.
Axiom keym : Type.
Axiom keym_inhabited : Inhabited keym.
Global Existing Instance keym_inhabited.
Axiom keym_countable : Countable keym.
Global Existing Instance keym_countable.
Axiom keym1 : key -> keym.
Axiom eq : key -> key -> Prop.
Axiom eq'spec : forall  (x : key) (y : key), eq x y = (keym1 x = keym1 y).
Definition neq (x : key) (y : key) := ¬ eq x y.
Axiom neq'spec : forall  (x : key) (y : key), neq x y = (¬ keym1 x = keym1 y).
Axiom hash : key -> Z.
Axiom hash_nonneg : forall  (k : key), 0%Z ≤ hash k.
Axiom hash_eq : forall  (x : key) (y : key) (fact0 : eq x y), hash x = hash y.
Axiom dummy : key.
Axiom bucket : key -> Z -> Z.
Axiom bucket'def : forall  (n : Z) (k : key) (fact0 : 0%Z < n), bucket k n = Z.quot (hash k) n.
Axiom bucket'spec : forall  (n : Z) (k : key) (fact0 : 0%Z < n), 0%Z ≤ bucket k n ∧ bucket k n < n.
Definition between (l : Z) (j : Z) (r : Z) := l ≤ j ∧ j < r ∨ r < l ∧ l ≤ j ∨ j < r ∧ r < l.
Axiom fc : list key -> Z -> bool.
Axiom fc'def : forall  (a : list key) (i : Z), (fc a i = true) = eq (nth (Z.to_nat i) a inhabitant) dummy.
Definition numof (a : list key) (l : Z) (u : Z) : Z := NumOf.numof (fc a) l u.
Theorem numof_eq'vc (l : Z) (u : Z) (a1 : list key) (a2 : list key) (fact0 : 0%Z ≤ l) (fact1 : l ≤ u) (fact2 : u ≤ Z.of_nat (length a1)) (fact3 : length a1 = length a2) (fact4 : ∀(i : Z), l ≤ i ∧ i < u -> eq (nth (Z.to_nat i) a2 inhabitant) (nth (Z.to_nat i) a1 inhabitant)) : numof a2 l u = numof a1 l u.
Proof.
Admitted.
