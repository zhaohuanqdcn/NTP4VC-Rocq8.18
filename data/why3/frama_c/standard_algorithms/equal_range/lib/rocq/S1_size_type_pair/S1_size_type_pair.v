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
Require Import Why3.Qed.Qed.
Require Import Why3.Cint.Cint.
Open Scope Z_scope.
Inductive s1_size_type_pair :=
  | s1_size_type_pair'mk : Z -> Z -> s1_size_type_pair.
Axiom s1_size_type_pair_inhabited : Inhabited s1_size_type_pair.
Global Existing Instance s1_size_type_pair_inhabited.
Axiom s1_size_type_pair_countable : Countable s1_size_type_pair.
Global Existing Instance s1_size_type_pair_countable.
Definition f1_size_type_pair_first (x : s1_size_type_pair) := match x with |  s1_size_type_pair'mk a _ => a end.
Definition f1_size_type_pair_second (x : s1_size_type_pair) := match x with |  s1_size_type_pair'mk _ a => a end.
Definition iss1_size_type_pair (s : s1_size_type_pair) := is_uint32 (f1_size_type_pair_first s) ∧ is_uint32 (f1_size_type_pair_second s).
