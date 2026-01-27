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
Require Import prover.Firstorder_symbol_impl.Types.
Require Import prover.Nat.Nat.
Require Import prover.Functions.Config.
Require Import prover.Functions.Func.
Require Import prover.OptionFuncs.Funcs.
Require Import prover.Sum.Sum.
Require Import prover.Firstorder_symbol_spec.Spec.
Open Scope Z_scope.
Axiom nat_nlsize_symbol : forall {ty'b0 : Type} `{Inhabited ty'b0}, nl_symbol ty'b0 -> Nat.nat.
Axiom nlsize_symbol : forall {ty'b0 : Type} `{Inhabited ty'b0}, nl_symbol ty'b0 -> Z.
Axiom nat_nlsize_symbol_def : forall {ty'b0 : Type} `{Inhabited ty'b0} (t : nl_symbol ty'b0), nat_nlsize_symbol t = (match t with | NLFVar_symbol v0 => SNat ONat | NLBruijn_symbol v0 => SNat ONat end).
Axiom nlsize_symbol_def : forall {ty'b0 : Type} `{Inhabited ty'b0} (t : nl_symbol ty'b0), nlsize_symbol t = (match t with | NLFVar_symbol v0 => 1%Z | NLBruijn_symbol v0 => 1%Z end).
Theorem nlsize_positive_lemma_symbol'vc {ty'b0 : Type} `{Inhabited ty'b0} (t : nl_symbol ty'b0) : 0%Z < nlsize_symbol t.
Admitted.
