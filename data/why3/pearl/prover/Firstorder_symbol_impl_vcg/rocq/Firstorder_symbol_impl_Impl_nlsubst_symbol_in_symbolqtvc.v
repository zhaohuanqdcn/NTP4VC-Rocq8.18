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
Require Import prover.Firstorder_symbol_impl.Types.
Require Import prover.Nat.Nat.
Require Import prover.Functions.Config.
Require Import prover.Functions.Func.
Require Import prover.OptionFuncs.Funcs.
Require Import prover.Sum.Sum.
Require Import prover.Firstorder_symbol_spec.Spec.
Require Import prover.Firstorder_symbol_impl.Logic.
Open Scope Z_scope.
Theorem nlsubst_symbol_in_symbol'vc (t : nlimpl_symbol) (u : nlimpl_symbol) (x : Z) (fact0 : nlimpl_symbol_ok t) (fact1 : nlimpl_symbol_ok u) : let o1 : symbol Z := subst_symbol (model_symbol_field t) (update subst_id_symbol x (model_symbol_field u)) in (∀(a : Z) (b : Z) (result : Z), (if decide (a < b) then result = b else result = a) -> a ≤ result ∧ b ≤ result) ∧ (∀(o2 : Z), nlfree_var_symbol_set_abstraction_symbol_field t ≤ o2 ∧ nlfree_var_symbol_set_abstraction_symbol_field u ≤ o2 -> (let o3 : Z -> symbol Z := (const : symbol Z -> Z -> symbol Z) (Var_symbol (- 1%Z)) in let o4 : Z -> symbol Z := subst_id_symbol in let o5 : nl_symbol Z := nlrepr_symbol_field u in let o6 : nl_symbol Z := nlrepr_symbol_field t in (correct_indexes_symbol o6 ∧ correct_indexes_symbol o5 ∧ bound_depth_of_symbol_in_symbol o5 = 0%Z) ∧ (∀(o7 : nl_symbol Z), correct_indexes_symbol o7 ∧ bound_depth_of_symbol_in_symbol o7 = bound_depth_of_symbol_in_symbol o6 ∧ nlmodel_symbol o7 o4 o3 = nlmodel_symbol o6 (update o4 x (nlmodel_symbol o5 o4 ((const : symbol Z -> Z -> symbol Z) (Var_symbol (- 1%Z))))) o3 -> nlimpl_symbol_ok (nlimpl_symbol'mk o7 o2 o1) ∧ o1 = subst_symbol (model_symbol_field t) (update subst_id_symbol x (model_symbol_field u))))).
Admitted.
