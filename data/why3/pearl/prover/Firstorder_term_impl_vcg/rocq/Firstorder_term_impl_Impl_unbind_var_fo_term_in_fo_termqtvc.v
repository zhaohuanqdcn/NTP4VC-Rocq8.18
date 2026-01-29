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
Require Import prover.Firstorder_term_impl.Logic.
Open Scope Z_scope.
Theorem unbind_var_fo_term_in_fo_term'vc {ty'b0 : Type} {ty'b3 : Type} `{Inhabited ty'b0} `{Inhabited ty'b3} (i : Z) (t : nl_fo_term Z Z) (x : nl_fo_term Z Z) (bnd13 : Z -> fo_term ty'b0 ty'b3) (fr3 : Z -> fo_term ty'b0 ty'b3) (bnd10 : Z -> symbol ty'b0) (fr0 : Z -> symbol ty'b0) (bnd20 : Z -> symbol ty'b0) (bnd23 : Z -> fo_term ty'b0 ty'b3) (fact0 : 0%Z ≤ i) (fact1 : correct_indexes_fo_term t) (fact2 : bound_depth_of_fo_term_in_fo_term t ≤ i + 1%Z) (fact3 : correct_indexes_fo_term x) (fact4 : bound_depth_of_symbol_in_fo_term x = 0%Z) (fact5 : bound_depth_of_fo_term_in_fo_term x = 0%Z) : (match t with | NLFVar_fo_term v0 => True | NLBruijn_fo_term v0 => True | NL_App v0 v1 => (let o1 : Z := i + 0%Z in (0%Z ≤ nlsize_fo_term t ∧ nlsize_fo_term_list v1 < nlsize_fo_term t) ∧ 0%Z ≤ o1 ∧ correct_indexes_fo_term_list v1 ∧ bound_depth_of_fo_term_in_fo_term_list v1 ≤ o1 + 1%Z ∧ correct_indexes_fo_term x ∧ bound_depth_of_symbol_in_fo_term x = 0%Z ∧ bound_depth_of_fo_term_in_fo_term x = 0%Z) end) ∧ (∀(result : nl_fo_term Z Z), (match t with | NLFVar_fo_term v0 => result = NLFVar_fo_term v0 | NLBruijn_fo_term v0 => (if decide (v0 = i) then result = x else result = NLBruijn_fo_term v0) | NL_App v0 v1 => (let o1 : Z -> fo_term ty'b0 ty'b3 := rename_subst_fo_term bnd13 identity identity in let o2 : Z -> fo_term ty'b0 ty'b3 := rename_subst_fo_term fr3 identity identity in let o3 : Z -> symbol ty'b0 := rename_subst_symbol bnd10 identity in let o4 : Z -> symbol ty'b0 := rename_subst_symbol fr0 identity in let o5 : Z := i + 0%Z in ∃(o6 : nl_fo_term_list Z Z), (correct_indexes_fo_term_list o6 ∧ bound_depth_of_fo_term_in_fo_term_list o6 ≤ o5 ∧ bound_depth_of_symbol_in_fo_term_list o6 = bound_depth_of_symbol_in_fo_term_list v1 ∧ nlmodel_fo_term_list o6 o4 o3 o2 o1 = nlmodel_fo_term_list v1 o4 o3 o2 (update o1 o5 (nlmodel_fo_term x o4 (rename_subst_symbol bnd20 identity) o2 (rename_subst_fo_term bnd23 identity identity)))) ∧ result = NL_App v0 o6) end) -> correct_indexes_fo_term result ∧ bound_depth_of_fo_term_in_fo_term result ≤ i ∧ bound_depth_of_symbol_in_fo_term result = bound_depth_of_symbol_in_fo_term t ∧ nlmodel_fo_term result fr0 bnd10 fr3 bnd13 = nlmodel_fo_term t fr0 bnd10 fr3 (update bnd13 i (nlmodel_fo_term x fr0 bnd20 fr3 bnd23))).
Proof.
Admitted.
