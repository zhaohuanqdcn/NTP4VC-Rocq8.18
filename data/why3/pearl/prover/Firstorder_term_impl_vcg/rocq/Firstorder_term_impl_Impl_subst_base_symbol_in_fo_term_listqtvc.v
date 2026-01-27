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
Theorem subst_base_symbol_in_fo_term_list'vc {ty'b0 : Type} {ty'b3 : Type} `{Inhabited ty'b0} `{Inhabited ty'b3} (t : nl_fo_term_list Z Z) (u : nl_symbol Z) (bnd13 : Z -> fo_term ty'b0 ty'b3) (fr3 : Z -> fo_term ty'b0 ty'b3) (bnd10 : Z -> symbol ty'b0) (fr0 : Z -> symbol ty'b0) (x : Z) (bnd20 : Z -> symbol ty'b0) (fact0 : correct_indexes_fo_term_list t) (fact1 : correct_indexes_symbol u) (fact2 : bound_depth_of_symbol_in_symbol u = 0%Z) : (match t with | NL_FONil => True | NL_FOCons v0 v1 => (let o1 : Z -> fo_term ty'b0 ty'b3 := rename_subst_fo_term bnd13 identity identity in let o2 : Z -> fo_term ty'b0 ty'b3 := rename_subst_fo_term fr3 identity identity in let o3 : Z -> symbol ty'b0 := rename_subst_symbol bnd10 identity in let o4 : Z -> symbol ty'b0 := rename_subst_symbol fr0 identity in ((0%Z ≤ nlsize_fo_term_list t ∧ nlsize_fo_term_list v1 < nlsize_fo_term_list t) ∧ correct_indexes_fo_term_list v1 ∧ correct_indexes_symbol u ∧ bound_depth_of_symbol_in_symbol u = 0%Z) ∧ (∀(o5 : nl_fo_term_list Z Z), correct_indexes_fo_term_list o5 ∧ bound_depth_of_symbol_in_fo_term_list o5 = bound_depth_of_symbol_in_fo_term_list v1 ∧ bound_depth_of_fo_term_in_fo_term_list o5 = bound_depth_of_fo_term_in_fo_term_list v1 ∧ nlmodel_fo_term_list o5 o4 o3 o2 o1 = nlmodel_fo_term_list v1 (update o4 x (nlmodel_symbol u o4 (rename_subst_symbol bnd20 identity))) o3 o2 o1 -> (0%Z ≤ nlsize_fo_term_list t ∧ nlsize_fo_term v0 < nlsize_fo_term_list t) ∧ correct_indexes_fo_term v0 ∧ correct_indexes_symbol u ∧ bound_depth_of_symbol_in_symbol u = 0%Z)) end) ∧ (∀(result : nl_fo_term_list Z Z), (match t with | NL_FONil => result = NL_FONil | NL_FOCons v0 v1 => (let o1 : Z -> fo_term ty'b0 ty'b3 := rename_subst_fo_term bnd13 identity identity in let o2 : Z -> fo_term ty'b0 ty'b3 := rename_subst_fo_term fr3 identity identity in let o3 : Z -> symbol ty'b0 := rename_subst_symbol bnd10 identity in let o4 : Z -> symbol ty'b0 := rename_subst_symbol fr0 identity in ∃(o5 : nl_fo_term_list Z Z), (correct_indexes_fo_term_list o5 ∧ bound_depth_of_symbol_in_fo_term_list o5 = bound_depth_of_symbol_in_fo_term_list v1 ∧ bound_depth_of_fo_term_in_fo_term_list o5 = bound_depth_of_fo_term_in_fo_term_list v1 ∧ nlmodel_fo_term_list o5 o4 o3 o2 o1 = nlmodel_fo_term_list v1 (update o4 x (nlmodel_symbol u o4 (rename_subst_symbol bnd20 identity))) o3 o2 o1) ∧ (let o6 : Z -> fo_term ty'b0 ty'b3 := rename_subst_fo_term bnd13 identity identity in let o7 : Z -> fo_term ty'b0 ty'b3 := rename_subst_fo_term fr3 identity identity in let o8 : Z -> symbol ty'b0 := rename_subst_symbol bnd10 identity in let o9 : Z -> symbol ty'b0 := rename_subst_symbol fr0 identity in ∃(o10 : nl_fo_term Z Z), (correct_indexes_fo_term o10 ∧ bound_depth_of_symbol_in_fo_term o10 = bound_depth_of_symbol_in_fo_term v0 ∧ bound_depth_of_fo_term_in_fo_term o10 = bound_depth_of_fo_term_in_fo_term v0 ∧ nlmodel_fo_term o10 o9 o8 o7 o6 = nlmodel_fo_term v0 (update o9 x (nlmodel_symbol u o9 (rename_subst_symbol bnd20 identity))) o8 o7 o6) ∧ result = NL_FOCons o10 o5)) end) -> correct_indexes_fo_term_list result ∧ bound_depth_of_symbol_in_fo_term_list result = bound_depth_of_symbol_in_fo_term_list t ∧ bound_depth_of_fo_term_in_fo_term_list result = bound_depth_of_fo_term_in_fo_term_list t ∧ nlmodel_fo_term_list result fr0 bnd10 fr3 bnd13 = nlmodel_fo_term_list t (update fr0 x (nlmodel_symbol u fr0 bnd20)) bnd10 fr3 bnd13).
Admitted.
