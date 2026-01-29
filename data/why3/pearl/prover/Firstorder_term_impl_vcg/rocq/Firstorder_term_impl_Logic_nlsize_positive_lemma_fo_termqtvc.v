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
Theorem nlsize_positive_lemma_fo_term'vc {ty'b0 : Type} {ty'b3 : Type} `{Inhabited ty'b0} `{Inhabited ty'b3} (t : nl_fo_term ty'b0 ty'b3) : 0%Z < nlsize_fo_term t.
Proof.
Admitted.
