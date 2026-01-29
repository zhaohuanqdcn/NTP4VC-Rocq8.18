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
Axiom uf_pure : Type.
Axiom uf_pure_inhabited : Inhabited uf_pure.
Global Existing Instance uf_pure_inhabited.
Axiom uf_pure_countable : Countable uf_pure.
Global Existing Instance uf_pure_countable.
Axiom repr : uf_pure -> Z -> Z -> Prop.
Axiom size : uf_pure -> Z.
Axiom num : uf_pure -> Z.
Axiom Repr_function_1 : forall  (x : Z) (u : uf_pure) (fact0 : 0%Z ≤ x) (fact1 : x < size u), ∃(y : Z), (0%Z ≤ y ∧ y < size u) ∧ repr u x y.
Axiom Repr_function_2 : forall  (x : Z) (u : uf_pure) (y : Z) (z : Z) (fact0 : 0%Z ≤ x) (fact1 : x < size u) (fact2 : repr u x y) (fact3 : repr u x z), y = z.
Definition same (u : uf_pure) (x : Z) (y : Z) := ∀(r : Z), repr u x r = repr u y r.
Definition same_reprs (u1 : uf_pure) (u2 : uf_pure) := ∀(x : Z) (r : Z), repr u1 x r = repr u2 x r.
Axiom OneClass : forall  (u : uf_pure) (x : Z) (y : Z) (fact0 : num u = 1%Z) (fact1 : 0%Z ≤ x) (fact2 : x < size u) (fact3 : 0%Z ≤ y) (fact4 : y < size u), same u x y.
