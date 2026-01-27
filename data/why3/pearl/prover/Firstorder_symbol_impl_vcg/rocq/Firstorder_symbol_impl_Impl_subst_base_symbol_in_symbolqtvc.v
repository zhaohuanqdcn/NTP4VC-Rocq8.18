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
Theorem subst_base_symbol_in_symbol'vc {ty'b0 : Type} `{Inhabited ty'b0} (t : nl_symbol Z) (u : nl_symbol Z) (x : Z) (fr0 : Z -> symbol ty'b0) (bnd10 : Z -> symbol ty'b0) (bnd20 : Z -> symbol ty'b0) (fact0 : correct_indexes_symbol t) (fact1 : correct_indexes_symbol u) (fact2 : bound_depth_of_symbol_in_symbol u = 0%Z) : (match t with | NLFVar_symbol v0 => True | NLBruijn_symbol v0 => True end) ∧ (∀(result : nl_symbol Z), (match t with | NLFVar_symbol v0 => (if decide (v0 = x) then result = u else result = NLFVar_symbol v0) | NLBruijn_symbol v0 => result = NLBruijn_symbol v0 end) -> correct_indexes_symbol result ∧ bound_depth_of_symbol_in_symbol result = bound_depth_of_symbol_in_symbol t ∧ nlmodel_symbol result fr0 bnd10 = nlmodel_symbol t (update fr0 x (nlmodel_symbol u fr0 bnd20)) bnd10).
Admitted.
