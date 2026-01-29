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
Open Scope Z_scope.
Axiom fc : forall {α : Type} `{Inhabited α}, list α -> α -> Z -> bool.
Axiom fc'def : forall  {α : Type} `{Inhabited α} (a : list α) (v : α) (i : Z), (fc a v i = true) = (nth (Z.to_nat i) a inhabitant = v).
Axiom candidate : Type.
Axiom candidate_inhabited : Inhabited candidate.
Global Existing Instance candidate_inhabited.
Axiom candidate_countable : Countable candidate.
Global Existing Instance candidate_countable.
