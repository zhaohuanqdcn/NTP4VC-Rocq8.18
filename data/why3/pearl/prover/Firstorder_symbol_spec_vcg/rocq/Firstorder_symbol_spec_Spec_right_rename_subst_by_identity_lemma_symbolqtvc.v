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
Require Import prover.Nat.Nat.
Require Import prover.Functions.Config.
Require Import prover.Functions.Func.
Require Import prover.OptionFuncs.Funcs.
Require Import prover.Sum.Sum.
Open Scope Z_scope.
Inductive symbol (ty'b0 : Type) :=
  | Var_symbol : ty'b0 -> symbol ty'b0.
Axiom symbol_inhabited : forall  {ty'b0 : Type} `{Inhabited ty'b0}, Inhabited (symbol ty'b0).
Global Existing Instance symbol_inhabited.
Arguments Var_symbol {ty'b0}.
Axiom nat_size_symbol : forall {ty'b0 : Type} `{Inhabited ty'b0}, symbol ty'b0 -> Nat.nat.
Axiom size_symbol : forall {ty'b0 : Type} `{Inhabited ty'b0}, symbol ty'b0 -> Z.
Axiom nat_size_symbol_def : forall {ty'b0 : Type} `{Inhabited ty'b0} (t : symbol ty'b0), nat_size_symbol t = (match t with | Var_symbol v0 => SNat ONat end).
Axiom size_symbol_def : forall {ty'b0 : Type} `{Inhabited ty'b0} (t : symbol ty'b0), size_symbol t = (match t with | Var_symbol v0 => 1%Z end).
Definition rename_symbol {ty'b0 : Type} {ty'c0 : Type} `{Inhabited ty'b0} `{Inhabited ty'c0} (t : symbol ty'b0) (s0 : ty'b0 -> ty'c0) : symbol ty'c0 := match t with | Var_symbol v0 => Var_symbol (s0 v0) end.
Axiom rename_subst_symbol : forall {ty'b0 : Type} `{Inhabited ty'b0} {ty'd0 : Type} `{Inhabited ty'd0} {ty'c0 : Type} `{Inhabited ty'c0}, (ty'b0 -> symbol ty'c0) -> (ty'c0 -> ty'd0) -> ty'b0 -> symbol ty'd0.
Axiom rename_subst_symbol_definition : forall  {ty'b0 : Type} {ty'd0 : Type} {ty'c0 : Type} `{Inhabited ty'b0} `{Inhabited ty'd0} `{Inhabited ty'c0} (s0 : ty'b0 -> symbol ty'c0) (s10 : ty'c0 -> ty'd0) (x : ty'b0), rename_subst_symbol s0 s10 x = rename_symbol (s0 x) s10.
Theorem right_rename_subst_by_identity_lemma_symbol'vc {ty'b0 : Type} {ty'c0 : Type} `{Inhabited ty'b0} `{Inhabited ty'c0} (s0 : ty'b0 -> symbol ty'c0) : rename_subst_symbol s0 identity = s0.
Admitted.
