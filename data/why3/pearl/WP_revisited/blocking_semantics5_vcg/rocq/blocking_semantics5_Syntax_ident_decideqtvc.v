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
Inductive datatype :=
  | TYunit : datatype
  | TYint : datatype
  | TYbool : datatype.
Axiom datatype_inhabited : Inhabited datatype.
Global Existing Instance datatype_inhabited.
Axiom datatype_countable : Countable datatype.
Global Existing Instance datatype_countable.
Inductive value :=
  | Vvoid : value
  | Vint : Z -> value
  | Vbool : bool -> value.
Axiom value_inhabited : Inhabited value.
Global Existing Instance value_inhabited.
Axiom value_countable : Countable value.
Global Existing Instance value_countable.
Inductive operator :=
  | Oplus : operator
  | Ominus : operator
  | Omult : operator
  | Ole : operator.
Axiom operator_inhabited : Inhabited operator.
Global Existing Instance operator_inhabited.
Axiom operator_countable : Countable operator.
Global Existing Instance operator_countable.
Axiom mident : Type.
Axiom mident_inhabited : Inhabited mident.
Global Existing Instance mident_inhabited.
Axiom mident_countable : Countable mident.
Global Existing Instance mident_countable.
Axiom ident : Type.
Axiom ident_inhabited : Inhabited ident.
Global Existing Instance ident_inhabited.
Axiom ident_countable : Countable ident.
Global Existing Instance ident_countable.
Theorem ident_decide'vc : True ∨ ¬ True.
Proof.
Admitted.
