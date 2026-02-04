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
Axiom program_var : Type.
Axiom program_var_inhabited : Inhabited program_var.
Global Existing Instance program_var_inhabited.
Axiom program_var_countable : Countable program_var.
Global Existing Instance program_var_countable.
Inductive expr :=
  | Elit : Z -> expr
  | Evar : program_var -> expr
  | Esub : expr -> expr -> expr.
Axiom expr_inhabited : Inhabited expr.
Global Existing Instance expr_inhabited.
Axiom expr_countable : Countable expr.
Global Existing Instance expr_countable.
Inductive cmd :=
  | Cskip : cmd
  | Cassign : program_var -> expr -> cmd
  | Cseq : cmd -> cmd -> cmd
  | Cif : expr -> cmd -> cmd -> cmd
  | Cwhile : expr -> cmd -> cmd.
Axiom cmd_inhabited : Inhabited cmd.
Global Existing Instance cmd_inhabited.
Axiom cmd_countable : Countable cmd.
Global Existing Instance cmd_countable.
