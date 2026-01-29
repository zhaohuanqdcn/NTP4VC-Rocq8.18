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
Open Scope Z_scope.
Axiom loc : Type.
Axiom loc_inhabited : Inhabited loc.
Global Existing Instance loc_inhabited.
Axiom loc_countable : Countable loc.
Global Existing Instance loc_countable.
Axiom null : loc.
Axiom stacknodes : Type.
Axiom stacknodes_inhabited : Inhabited stacknodes.
Global Existing Instance stacknodes_inhabited.
Axiom stacknodes_countable : Countable stacknodes.
Global Existing Instance stacknodes_countable.
Definition not_in_stack (n : loc) (s : list loc) := ∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length s) -> ¬ n = nth (Z.to_nat i) s inhabitant.
Definition last (s : list loc) : loc := nth (Z.to_nat (Z.of_nat (length s) - 1%Z)) s inhabitant.
Definition distinct (s : list loc) := ∀(i : Z) (j : Z), 0%Z ≤ i ∧ i < Z.of_nat (length s) -> 0%Z ≤ j ∧ j < Z.of_nat (length s) -> ¬ i = j -> ¬ nth (Z.to_nat i) s inhabitant = nth (Z.to_nat j) s inhabitant.
Definition edge (x : loc) (y : loc) (left1 : loc -> loc) (right1 : loc -> loc) := ¬ x = null ∧ (left1 x = y ∨ right1 x = y).
Inductive path : (loc -> loc) -> (loc -> loc) -> loc -> loc -> list loc -> Prop :=
 | path_nil (l : loc -> loc) (r : loc -> loc) (x : loc) : path l r x x ([] : list loc)
 | path_cons (x : loc) (z : loc) (l : loc -> loc) (r : loc -> loc) (y : loc) (p : list loc) : edge x z l r -> path l r z y p -> path l r x y (cons x p).
Theorem trans_path'vc (l : loc -> loc) (r : loc -> loc) (x : loc) (y : loc) (p1 : list loc) (z : loc) (p2 : list loc) (fact0 : path l r x y p1) (fact1 : path l r y z p2) : path l r x z (p1 ++ p2).
Proof.
Admitted.
