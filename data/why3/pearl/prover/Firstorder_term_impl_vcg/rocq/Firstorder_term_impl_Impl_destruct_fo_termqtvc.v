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
Require Import prover.Firstorder_term_impl.Logic.
Open Scope Z_scope.
Theorem destruct_fo_term'vc (t : nlimpl_fo_term) (fact0 : nlimpl_fo_term_ok t) : let fv0 : Z := nlfree_var_symbol_set_abstraction_fo_term_field t in let o1 : nl_fo_term Z Z := nlrepr_fo_term_field t in (match o1 with | NLFVar_fo_term v0 => True | NLBruijn_fo_term v0 => False | NL_App v0 v1 => (match model_fo_term_field t with | Var_fo_term x0 => False | App x0 x1 => True end) end) ∧ (∀(result : cons_fo_term), (match o1 with | NLFVar_fo_term v0 => result = NLCVar_fo_term v0 | NLBruijn_fo_term v0 => False | NL_App v0 v1 => (match model_fo_term_field t with | Var_fo_term x0 => False | App x0 x1 => result = NLC_App (nlimpl_symbol'mk v0 fv0 (rename_symbol x0 identity)) (nlimpl_fo_term_list'mk v1 fv0 (nlfree_var_fo_term_set_abstraction_fo_term_field t) (rename_fo_term_list x1 identity identity)) end) end) -> cons_ok_fo_term result ∧ cons_rel_fo_term result t ∧ cons_open_rel_fo_term result t).
Admitted.
