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
Axiom char : Type.
Axiom char_inhabited : Inhabited char.
Global Existing Instance char_inhabited.
Axiom char_countable : Countable char.
Global Existing Instance char_countable.
Axiom dummy_char : char.
Axiom char_string : Type.
Axiom char_string_inhabited : Inhabited char_string.
Global Existing Instance char_string_inhabited.
Axiom char_string_countable : Countable char_string.
Global Existing Instance char_string_countable.
Axiom length : char_string -> Z.
Axiom length'spec : forall  (x : char_string), 0%Z ≤ length x.
Axiom mixfix_lbrb : char_string -> Z -> char.
Axiom empty : char_string.
Axiom empty'def : length empty = 0%Z.
Definition infix_eqeq (s1 : char_string) (s2 : char_string) := length s1 = length s2 ∧ (∀(i : Z), 0%Z ≤ i ∧ i < length s1 -> mixfix_lbrb s1 i = mixfix_lbrb s2 i).
Axiom extensionality : forall  (s1 : char_string) (s2 : char_string) (fact0 : infix_eqeq s1 s2), s1 = s2.
Axiom app : char_string -> char_string -> char_string.
Axiom app_def1 : forall  (s1 : char_string) (s2 : char_string), length (app s1 s2) = length s1 + length s2.
Axiom app_def2 : forall  (i : Z) (s1 : char_string) (s2 : char_string) (fact0 : 0%Z ≤ i) (fact1 : i < length s1), mixfix_lbrb (app s1 s2) i = mixfix_lbrb s1 i.
Axiom app_def3 : forall  (s1 : char_string) (i : Z) (s2 : char_string) (fact0 : length s1 ≤ i) (fact1 : i < length s1 + length s2), mixfix_lbrb (app s1 s2) i = mixfix_lbrb s2 (i - length s1).
Axiom sub : char_string -> Z -> Z -> char_string.
Axiom sub_def1 : forall  (len : Z) (ofs : Z) (s : char_string) (fact0 : 0%Z ≤ len) (fact1 : 0%Z ≤ ofs) (fact2 : ofs ≤ length s) (fact3 : ofs + len ≤ length s), length (sub s ofs len) = len.
Axiom sub_def2 : forall  (len : Z) (ofs : Z) (s : char_string) (i : Z) (fact0 : 0%Z ≤ len) (fact1 : 0%Z ≤ ofs) (fact2 : ofs ≤ length s) (fact3 : ofs + len ≤ length s) (fact4 : 0%Z ≤ i) (fact5 : i < len), mixfix_lbrb (sub s ofs len) i = mixfix_lbrb s (ofs + i).
