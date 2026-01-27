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
Theorem bind_var_fo_term_in_fo_term'vc {ty'b0 : Type} {ty'b3 : Type} `{Inhabited ty'b0} `{Inhabited ty'b3} (t : nl_fo_term Z Z) (i : Z) (x : Z) (bnd3 : Z -> fo_term ty'b0 ty'b3) (fr3 : Z -> fo_term ty'b0 ty'b3) (bnd0 : Z -> symbol ty'b0) (fr0 : Z -> symbol ty'b0) (fact0 : correct_indexes_fo_term t) (fact1 : bound_depth_of_fo_term_in_fo_term t ≤ i) : (match t with | NLFVar_fo_term v0 => True | NLBruijn_fo_term v0 => True | NL_App v0 v1 => (0%Z ≤ nlsize_fo_term t ∧ nlsize_fo_term_list v1 < nlsize_fo_term t) ∧ correct_indexes_fo_term_list v1 ∧ bound_depth_of_fo_term_in_fo_term_list v1 ≤ i + 0%Z end) ∧ (∀(result : nl_fo_term Z Z), (match t with | NLFVar_fo_term v0 => (if decide (v0 = x) then result = NLBruijn_fo_term i else result = NLFVar_fo_term v0) | NLBruijn_fo_term v0 => result = NLBruijn_fo_term v0 | NL_App v0 v1 => (let o1 : Z -> fo_term ty'b0 ty'b3 := rename_subst_fo_term bnd3 identity identity in let o2 : Z -> fo_term ty'b0 ty'b3 := rename_subst_fo_term fr3 identity identity in let o3 : Z -> symbol ty'b0 := rename_subst_symbol bnd0 identity in let o4 : Z -> symbol ty'b0 := rename_subst_symbol fr0 identity in let o5 : Z := i + 0%Z in ∃(o6 : nl_fo_term_list Z Z), (bound_depth_of_fo_term_in_fo_term_list o6 ≤ o5 + 1%Z ∧ correct_indexes_fo_term_list o6 ∧ bound_depth_of_symbol_in_fo_term_list v1 = bound_depth_of_symbol_in_fo_term_list o6 ∧ nlmodel_fo_term_list o6 o4 o3 o2 o1 = nlmodel_fo_term_list v1 o4 o3 (update o2 x (o1 o5)) o1) ∧ result = NL_App v0 o6) end) -> bound_depth_of_fo_term_in_fo_term result ≤ i + 1%Z ∧ correct_indexes_fo_term result ∧ bound_depth_of_symbol_in_fo_term t = bound_depth_of_symbol_in_fo_term result ∧ nlmodel_fo_term result fr0 bnd0 fr3 bnd3 = nlmodel_fo_term t fr0 bnd0 (update fr3 x (bnd3 i)) bnd3).
Admitted.
