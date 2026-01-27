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
Require Import prover.Firstorder_term_impl.Types.
Require Import prover.Nat.Nat.
Require Import prover.Functions.Config.
Require Import prover.Functions.Func.
Require Import prover.OptionFuncs.Funcs.
Require Import prover.Sum.Sum.
Require Import prover.Firstorder_symbol_spec.Spec.
Require Import prover.Firstorder_symbol_impl.Types.
Require Import prover.Firstorder_symbol_impl.Logic.
Require Import prover.Firstorder_symbol_impl.Impl.
Require Import prover.Firstorder_term_spec.Spec.
Open Scope Z_scope.
Axiom nat_nlsize_fo_term_list : forall {ty'b0 : Type} `{Inhabited ty'b0} {ty'b3 : Type} `{Inhabited ty'b3}, nl_fo_term_list ty'b0 ty'b3 -> Nat.nat.
Axiom nat_nlsize_fo_term : forall {ty'b0 : Type} `{Inhabited ty'b0} {ty'b3 : Type} `{Inhabited ty'b3}, nl_fo_term ty'b0 ty'b3 -> Nat.nat.
Axiom nlsize_fo_term_list : forall {ty'b0 : Type} `{Inhabited ty'b0} {ty'b3 : Type} `{Inhabited ty'b3}, nl_fo_term_list ty'b0 ty'b3 -> Z.
Axiom nlsize_fo_term : forall {ty'b0 : Type} `{Inhabited ty'b0} {ty'b3 : Type} `{Inhabited ty'b3}, nl_fo_term ty'b0 ty'b3 -> Z.
Axiom nat_nlsize_fo_term_list_def : forall {ty'b0 : Type} {ty'b3 : Type} `{Inhabited ty'b0} `{Inhabited ty'b3} (t : nl_fo_term_list ty'b0 ty'b3), nat_nlsize_fo_term_list t = (match t with | NL_FONil => (let s : Nat.nat := SNat ONat in s) | NL_FOCons v0 v1 => (let s : Nat.nat := SNat ONat in let s1 : Nat.nat := add_nat (nat_nlsize_fo_term_list v1) s in let s2 : Nat.nat := add_nat (nat_nlsize_fo_term v0) s1 in s2) end).
Axiom nat_nlsize_fo_term_def : forall {ty'b0 : Type} {ty'b3 : Type} `{Inhabited ty'b0} `{Inhabited ty'b3} (t : nl_fo_term ty'b0 ty'b3), nat_nlsize_fo_term t = (match t with | NLFVar_fo_term v0 => SNat ONat | NLBruijn_fo_term v0 => SNat ONat | NL_App v0 v1 => (let s : Nat.nat := SNat ONat in let s1 : Nat.nat := add_nat (nat_nlsize_fo_term_list v1) s in let s2 : Nat.nat := add_nat (nat_nlsize_symbol v0) s1 in s2) end).
Axiom nlsize_fo_term_list_def : forall {ty'b0 : Type} {ty'b3 : Type} `{Inhabited ty'b0} `{Inhabited ty'b3} (t : nl_fo_term_list ty'b0 ty'b3), nlsize_fo_term_list t = (match t with | NL_FONil => (let s : Z := 1%Z in s) | NL_FOCons v0 v1 => (let s : Z := 1%Z in let s1 : Z := nlsize_fo_term_list v1 + s in let s2 : Z := nlsize_fo_term v0 + s1 in s2) end).
Axiom nlsize_fo_term_def : forall {ty'b0 : Type} {ty'b3 : Type} `{Inhabited ty'b0} `{Inhabited ty'b3} (t : nl_fo_term ty'b0 ty'b3), nlsize_fo_term t = (match t with | NLFVar_fo_term v0 => 1%Z | NLBruijn_fo_term v0 => 1%Z | NL_App v0 v1 => (let s : Z := 1%Z in let s1 : Z := nlsize_fo_term_list v1 + s in let s2 : Z := nlsize_symbol v0 + s1 in s2) end).
Axiom shiftb_fo_term : forall {ty'b0 : Type} `{Inhabited ty'b0} {ty'b3 : Type} `{Inhabited ty'b3}, (Z -> fo_term ty'b0 ty'b3) -> Z -> fo_term ty'b0 (option ty'b3).
Axiom shiftb_fo_term_definition : forall  {ty'b0 : Type} {ty'b3 : Type} `{Inhabited ty'b0} `{Inhabited ty'b3} (bnd : Z -> fo_term ty'b0 ty'b3) (i : Z), shiftb_fo_term bnd i = (if decide (i = 0%Z) then Var_fo_term (None : option ty'b3) else rename_fo_term (bnd (i - 1%Z)) identity some).
Axiom nlmodel_fo_term_list : forall {ty'b0 : Type} `{Inhabited ty'b0} {ty'b3 : Type} `{Inhabited ty'b3} {ty'c0 : Type} `{Inhabited ty'c0} {ty'c3 : Type} `{Inhabited ty'c3}, nl_fo_term_list ty'b0 ty'b3 -> (ty'b0 -> symbol ty'c0) -> (Z -> symbol ty'c0) -> (ty'b3 -> fo_term ty'c0 ty'c3) -> (Z -> fo_term ty'c0 ty'c3) -> fo_term_list ty'c0 ty'c3.
Axiom nlmodel_fo_term : forall {ty'b0 : Type} `{Inhabited ty'b0} {ty'b3 : Type} `{Inhabited ty'b3} {ty'c0 : Type} `{Inhabited ty'c0} {ty'c3 : Type} `{Inhabited ty'c3}, nl_fo_term ty'b0 ty'b3 -> (ty'b0 -> symbol ty'c0) -> (Z -> symbol ty'c0) -> (ty'b3 -> fo_term ty'c0 ty'c3) -> (Z -> fo_term ty'c0 ty'c3) -> fo_term ty'c0 ty'c3.
Axiom nlmodel_fo_term_list_def : forall {ty'b0 : Type} {ty'b3 : Type} {ty'c0 : Type} {ty'c3 : Type} `{Inhabited ty'b0} `{Inhabited ty'b3} `{Inhabited ty'c0} `{Inhabited ty'c3} (t : nl_fo_term_list ty'b0 ty'b3) (fr0 : ty'b0 -> symbol ty'c0) (bnd0 : Z -> symbol ty'c0) (fr3 : ty'b3 -> fo_term ty'c0 ty'c3) (bnd3 : Z -> fo_term ty'c0 ty'c3), nlmodel_fo_term_list t fr0 bnd0 fr3 bnd3 = (match t with | NL_FONil => (FONil : fo_term_list ty'c0 ty'c3) | NL_FOCons v0 v1 => FOCons (nlmodel_fo_term v0 (rename_subst_symbol fr0 identity) (rename_subst_symbol bnd0 identity) (rename_subst_fo_term fr3 identity identity) (rename_subst_fo_term bnd3 identity identity)) (nlmodel_fo_term_list v1 (rename_subst_symbol fr0 identity) (rename_subst_symbol bnd0 identity) (rename_subst_fo_term fr3 identity identity) (rename_subst_fo_term bnd3 identity identity)) end).
Axiom nlmodel_fo_term_def : forall {ty'b0 : Type} {ty'b3 : Type} {ty'c0 : Type} {ty'c3 : Type} `{Inhabited ty'b0} `{Inhabited ty'b3} `{Inhabited ty'c0} `{Inhabited ty'c3} (t : nl_fo_term ty'b0 ty'b3) (fr0 : ty'b0 -> symbol ty'c0) (bnd0 : Z -> symbol ty'c0) (fr3 : ty'b3 -> fo_term ty'c0 ty'c3) (bnd3 : Z -> fo_term ty'c0 ty'c3), nlmodel_fo_term t fr0 bnd0 fr3 bnd3 = (match t with | NLFVar_fo_term v0 => fr3 v0 | NLBruijn_fo_term v0 => bnd3 v0 | NL_App v0 v1 => App (nlmodel_symbol v0 (rename_subst_symbol fr0 identity) (rename_subst_symbol bnd0 identity)) (nlmodel_fo_term_list v1 (rename_subst_symbol fr0 identity) (rename_subst_symbol bnd0 identity) (rename_subst_fo_term fr3 identity identity) (rename_subst_fo_term bnd3 identity identity)) end).
Theorem nlmodel_rename_commutation_lemma_fo_term_list'vc {ty'c3 : Type} {ty'b0 : Type} {ty'd0 : Type} {ty'd3 : Type} {ty'b3 : Type} {ty'c0 : Type} `{Inhabited ty'c3} `{Inhabited ty'b0} `{Inhabited ty'd0} `{Inhabited ty'd3} `{Inhabited ty'b3} `{Inhabited ty'c0} (t : nl_fo_term_list ty'b0 ty'b3) (fr0 : ty'b0 -> symbol ty'c0) (s0 : ty'c0 -> ty'd0) (bnd0 : Z -> symbol ty'c0) (fr3 : ty'b3 -> fo_term ty'c0 ty'c3) (s3 : ty'c3 -> ty'd3) (bnd3 : Z -> fo_term ty'c0 ty'c3) : nlmodel_fo_term_list t (rename_subst_symbol fr0 s0) (rename_subst_symbol bnd0 s0) (rename_subst_fo_term fr3 s0 s3) (rename_subst_fo_term bnd3 s0 s3) = rename_fo_term_list (nlmodel_fo_term_list t fr0 bnd0 fr3 bnd3) s0 s3.
Admitted.
