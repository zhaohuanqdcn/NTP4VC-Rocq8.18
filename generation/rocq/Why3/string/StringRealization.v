From Stdlib Require Import Strings.String.
From Stdlib Require Import String Ascii.
From Stdlib Require Arith.
From stdpp Require Import base.
From stdpp Require Import fin_maps.
From stdpp Require Import gmap.
From stdpp Require Import base gmultiset.
From Stdlib Require Classical.
From Stdlib Require Import ZArith.
From stdpp.bitvector Require Import definitions tactics.
From Stdlib Require Import Sorting.Sorted.
From Stdlib Require Import Reals.Rbasic_fun.
From Stdlib Require Import Reals.Abstract.ConstructiveAbs.
From Stdlib Require Import Reals.Rdefinitions.
From stdpp Require Import list_relations.
From stdpp Require Import list_numbers.
From stdpp Require Import functions.
From Stdlib Require Import ClassicalEpsilon.
From stdpp Require Import base decidable.
From Stdlib Require Import ZArith.Zeuclid.
From Stdlib Require Import ZArith.Znumtheory.
From stdpp Require Import propset.
From Stdlib Require Import Reals.
Require Import Why3.Base.
Open Scope Z_scope.
Axiom concat : string -> string -> string.
Axiom length : string -> Z.
Axiom lt : string -> string -> Prop.
Axiom le : string -> string -> Prop.
Axiom s_at : string -> Z -> string.
Axiom substring : string -> Z -> Z -> string.
Axiom prefixof : string -> string -> Prop.
Axiom suffixof : string -> string -> Prop.
Axiom contains : string -> string -> Prop.
Axiom indexof : string -> string -> Z -> Z.
Axiom replace : string -> string -> string -> string.
Axiom replaceall : string -> string -> string -> string.
Axiom to_int : string -> Z.
Definition is_digit (s : string) := (0%Z ≤ to_int s ∧ to_int s ≤ 9%Z) ∧ length s = 1%Z.
Axiom from_int : Z -> string.
