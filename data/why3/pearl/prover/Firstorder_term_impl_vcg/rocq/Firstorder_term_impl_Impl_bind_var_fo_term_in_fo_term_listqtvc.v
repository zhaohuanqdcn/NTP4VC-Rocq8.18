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
Theorem bind_var_fo_term_in_fo_term_list'vc {ty'b0 : Type} {ty'b3 : Type} `{Inhabited ty'b0} `{Inhabited ty'b3} (t : nl_fo_term_list Z Z) (i : Z) (bnd3 : Z -> fo_term ty'b0 ty'b3) (fr3 : Z -> fo_term ty'b0 ty'b3) (bnd0 : Z -> symbol ty'b0) (fr0 : Z -> symbol ty'b0) (x : Z) (fact0 : correct_indexes_fo_term_list t) (fact1 : bound_depth_of_fo_term_in_fo_term_list t ≤ i) : (match t with | NL_FONil => True | NL_FOCons v0 v1 => (let o1 : Z -> fo_term ty'b0 ty'b3 := rename_subst_fo_term bnd3 identity identity in let o2 : Z -> fo_term ty'b0 ty'b3 := rename_subst_fo_term fr3 identity identity in let o3 : Z -> symbol ty'b0 := rename_subst_symbol bnd0 identity in let o4 : Z -> symbol ty'b0 := rename_subst_symbol fr0 identity in let o5 : Z := i + 0%Z in ((0%Z ≤ nlsize_fo_term_list t ∧ nlsize_fo_term_list v1 < nlsize_fo_term_list t) ∧ correct_indexes_fo_term_list v1 ∧ bound_depth_of_fo_term_in_fo_term_list v1 ≤ o5) ∧ (∀(o6 : nl_fo_term_list Z Z), bound_depth_of_fo_term_in_fo_term_list o6 ≤ o5 + 1%Z ∧ correct_indexes_fo_term_list o6 ∧ bound_depth_of_symbol_in_fo_term_list v1 = bound_depth_of_symbol_in_fo_term_list o6 ∧ nlmodel_fo_term_list o6 o4 o3 o2 o1 = nlmodel_fo_term_list v1 o4 o3 (update o2 x (o1 o5)) o1 -> (0%Z ≤ nlsize_fo_term_list t ∧ nlsize_fo_term v0 < nlsize_fo_term_list t) ∧ correct_indexes_fo_term v0 ∧ bound_depth_of_fo_term_in_fo_term v0 ≤ i + 0%Z)) end) ∧ (∀(result : nl_fo_term_list Z Z), (match t with | NL_FONil => result = NL_FONil | NL_FOCons v0 v1 => (let o1 : Z -> fo_term ty'b0 ty'b3 := rename_subst_fo_term bnd3 identity identity in let o2 : Z -> fo_term ty'b0 ty'b3 := rename_subst_fo_term fr3 identity identity in let o3 : Z -> symbol ty'b0 := rename_subst_symbol bnd0 identity in let o4 : Z -> symbol ty'b0 := rename_subst_symbol fr0 identity in let o5 : Z := i + 0%Z in ∃(o6 : nl_fo_term_list Z Z), (bound_depth_of_fo_term_in_fo_term_list o6 ≤ o5 + 1%Z ∧ correct_indexes_fo_term_list o6 ∧ bound_depth_of_symbol_in_fo_term_list v1 = bound_depth_of_symbol_in_fo_term_list o6 ∧ nlmodel_fo_term_list o6 o4 o3 o2 o1 = nlmodel_fo_term_list v1 o4 o3 (update o2 x (o1 o5)) o1) ∧ (let o7 : Z -> fo_term ty'b0 ty'b3 := rename_subst_fo_term bnd3 identity identity in let o8 : Z -> fo_term ty'b0 ty'b3 := rename_subst_fo_term fr3 identity identity in let o9 : Z -> symbol ty'b0 := rename_subst_symbol bnd0 identity in let o10 : Z -> symbol ty'b0 := rename_subst_symbol fr0 identity in let o11 : Z := i + 0%Z in ∃(o12 : nl_fo_term Z Z), (bound_depth_of_fo_term_in_fo_term o12 ≤ o11 + 1%Z ∧ correct_indexes_fo_term o12 ∧ bound_depth_of_symbol_in_fo_term v0 = bound_depth_of_symbol_in_fo_term o12 ∧ nlmodel_fo_term o12 o10 o9 o8 o7 = nlmodel_fo_term v0 o10 o9 (update o8 x (o7 o11)) o7) ∧ result = NL_FOCons o12 o6)) end) -> bound_depth_of_fo_term_in_fo_term_list result ≤ i + 1%Z ∧ correct_indexes_fo_term_list result ∧ bound_depth_of_symbol_in_fo_term_list t = bound_depth_of_symbol_in_fo_term_list result ∧ nlmodel_fo_term_list result fr0 bnd0 fr3 bnd3 = nlmodel_fo_term_list t fr0 bnd0 (update fr3 x (bnd3 i)) bnd3).
Proof.
Admitted.
