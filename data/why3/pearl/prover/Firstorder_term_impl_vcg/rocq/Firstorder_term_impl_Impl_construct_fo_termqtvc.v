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
Theorem construct_fo_term'vc (c : cons_fo_term) (fact0 : cons_ok_fo_term c) : (match c with | NLCVar_fo_term v0 => True | NLC_App v0 v1 => (∀(a : Z) (b : Z) (result : Z), (if decide (a < b) then result = b else result = a) -> a ≤ result ∧ b ≤ result) end) ∧ (∀(result : nlimpl_fo_term), (match c with | NLCVar_fo_term v0 => result = nlimpl_fo_term'mk (NLFVar_fo_term v0) 0%Z (1%Z + v0) (Var_fo_term v0) | NLC_App v0 v1 => (∃(o1 : Z), (nlfree_var_symbol_set_abstraction_symbol_field v0 ≤ o1 ∧ nlfree_var_symbol_set_abstraction_fo_term_list_field v1 ≤ o1) ∧ result = nlimpl_fo_term'mk (NL_App (nlrepr_symbol_field v0) (nlrepr_fo_term_list_field v1)) o1 (nlfree_var_fo_term_set_abstraction_fo_term_list_field v1) (App (rename_symbol (model_symbol_field v0) identity) (rename_fo_term_list (model_fo_term_list_field v1) identity identity))) end) -> nlimpl_fo_term_ok result ∧ cons_rel_fo_term c result).
Admitted.
