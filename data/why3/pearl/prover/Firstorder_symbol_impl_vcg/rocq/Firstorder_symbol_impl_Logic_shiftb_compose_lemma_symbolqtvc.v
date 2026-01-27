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
Axiom shiftb_symbol : forall {ty'b0 : Type} `{Inhabited ty'b0}, (Z -> symbol ty'b0) -> Z -> symbol (option ty'b0).
Axiom shiftb_symbol_definition : forall  {ty'b0 : Type} `{Inhabited ty'b0} (bnd : Z -> symbol ty'b0) (i : Z), shiftb_symbol bnd i = (if decide (i = 0%Z) then Var_symbol (None : option ty'b0) else rename_symbol (bnd (i - 1%Z)) some).
Theorem shiftb_compose_lemma_symbol'vc {ty'b0 : Type} {ty'c0 : Type} `{Inhabited ty'b0} `{Inhabited ty'c0} (bnd : Z -> symbol ty'b0) (s0 : ty'b0 -> symbol ty'c0) : subst_compose_symbol (shiftb_symbol bnd) ((olifts_symbol : (ty'b0 -> symbol ty'c0) -> option ty'b0 -> symbol (option ty'c0)) s0) = shiftb_symbol (subst_compose_symbol bnd s0).
Admitted.
