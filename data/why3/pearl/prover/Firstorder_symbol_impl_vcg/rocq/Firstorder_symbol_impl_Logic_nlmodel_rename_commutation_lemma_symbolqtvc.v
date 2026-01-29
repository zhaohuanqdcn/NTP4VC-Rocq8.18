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
Definition nlmodel_symbol {ty'b0 : Type} {ty'c0 : Type} `{Inhabited ty'b0} `{Inhabited ty'c0} (t : nl_symbol ty'b0) (fr0 : ty'b0 -> symbol ty'c0) (bnd0 : Z -> symbol ty'c0) : symbol ty'c0 := match t with | NLFVar_symbol v0 => fr0 v0 | NLBruijn_symbol v0 => bnd0 v0 end.
Theorem nlmodel_rename_commutation_lemma_symbol'vc {ty'b0 : Type} {ty'd0 : Type} {ty'c0 : Type} `{Inhabited ty'b0} `{Inhabited ty'd0} `{Inhabited ty'c0} (t : nl_symbol ty'b0) (fr0 : ty'b0 -> symbol ty'c0) (s0 : ty'c0 -> ty'd0) (bnd0 : Z -> symbol ty'c0) : nlmodel_symbol t (rename_subst_symbol fr0 s0) (rename_subst_symbol bnd0 s0) = rename_symbol (nlmodel_symbol t fr0 bnd0) s0.
Proof.
Admitted.
