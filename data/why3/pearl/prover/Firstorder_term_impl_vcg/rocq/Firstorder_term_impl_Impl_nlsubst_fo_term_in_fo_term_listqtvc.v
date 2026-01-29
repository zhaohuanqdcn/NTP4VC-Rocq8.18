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
Theorem nlsubst_fo_term_in_fo_term_list'vc (t : nlimpl_fo_term_list) (u : nlimpl_fo_term) (x : Z) (fact0 : nlimpl_fo_term_list_ok t) (fact1 : nlimpl_fo_term_ok u) : let o1 : fo_term_list Z Z := subst_fo_term_list (model_fo_term_list_field t) subst_id_symbol (update (subst_id_fo_term : Z -> fo_term Z Z) x (model_fo_term_field u)) in (∀(a : Z) (b : Z) (result : Z), (if decide (a < b) then result = b else result = a) -> a ≤ result ∧ b ≤ result) ∧ (∀(o2 : Z), nlfree_var_fo_term_set_abstraction_fo_term_list_field t ≤ o2 ∧ nlfree_var_fo_term_set_abstraction_fo_term_field u ≤ o2 -> (∀(a : Z) (b : Z) (result : Z), (if decide (a < b) then result = b else result = a) -> a ≤ result ∧ b ≤ result) ∧ (∀(o3 : Z), nlfree_var_symbol_set_abstraction_fo_term_list_field t ≤ o3 ∧ nlfree_var_symbol_set_abstraction_fo_term_field u ≤ o3 -> (let o4 : Z -> fo_term Z Z := (const : fo_term Z Z -> Z -> fo_term Z Z) (Var_fo_term (- 1%Z)) in let o5 : Z -> fo_term Z Z := (subst_id_fo_term : Z -> fo_term Z Z) in let o6 : Z -> symbol Z := (const : symbol Z -> Z -> symbol Z) (Var_symbol (- 1%Z)) in let o7 : Z -> symbol Z := subst_id_symbol in let o8 : nl_fo_term Z Z := nlrepr_fo_term_field u in let o9 : nl_fo_term_list Z Z := nlrepr_fo_term_list_field t in (correct_indexes_fo_term_list o9 ∧ correct_indexes_fo_term o8 ∧ bound_depth_of_symbol_in_fo_term o8 = 0%Z ∧ bound_depth_of_fo_term_in_fo_term o8 = 0%Z) ∧ (∀(o10 : nl_fo_term_list Z Z), correct_indexes_fo_term_list o10 ∧ bound_depth_of_symbol_in_fo_term_list o10 = bound_depth_of_symbol_in_fo_term_list o9 ∧ bound_depth_of_fo_term_in_fo_term_list o10 = bound_depth_of_fo_term_in_fo_term_list o9 ∧ nlmodel_fo_term_list o10 o7 o6 o5 o4 = nlmodel_fo_term_list o9 o7 o6 (update o5 x (nlmodel_fo_term o8 o7 ((const : symbol Z -> Z -> symbol Z) (Var_symbol (- 1%Z))) o5 ((const : fo_term Z Z -> Z -> fo_term Z Z) (Var_fo_term (- 1%Z))))) o4 -> nlimpl_fo_term_list_ok (nlimpl_fo_term_list'mk o10 o3 o2 o1) ∧ o1 = subst_fo_term_list (model_fo_term_list_field t) subst_id_symbol (update (subst_id_fo_term : Z -> fo_term Z Z) x (model_fo_term_field u)))))).
Proof.
Admitted.
