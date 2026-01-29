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
Require Import prover.Firstorder_symbol_impl.Types.
Require Import prover.Nat.Nat.
Require Import prover.Functions.Config.
Require Import prover.Functions.Func.
Require Import prover.OptionFuncs.Funcs.
Require Import prover.Sum.Sum.
Require Import prover.Firstorder_symbol_spec.Spec.
Require Import prover.Firstorder_symbol_impl.Logic.
Open Scope Z_scope.
Theorem bind_var_symbol_in_symbol'vc {ty'b0 : Type} `{Inhabited ty'b0} (t : nl_symbol Z) (i : Z) (x : Z) (fr0 : Z -> symbol ty'b0) (bnd0 : Z -> symbol ty'b0) (fact0 : correct_indexes_symbol t) (fact1 : bound_depth_of_symbol_in_symbol t ≤ i) : (match t with | NLFVar_symbol v0 => True | NLBruijn_symbol v0 => True end) ∧ (∀(result : nl_symbol Z), (match t with | NLFVar_symbol v0 => (if decide (v0 = x) then result = NLBruijn_symbol i else result = NLFVar_symbol v0) | NLBruijn_symbol v0 => result = NLBruijn_symbol v0 end) -> bound_depth_of_symbol_in_symbol result ≤ i + 1%Z ∧ correct_indexes_symbol result ∧ nlmodel_symbol result fr0 bnd0 = nlmodel_symbol t (update fr0 x (bnd0 i)) bnd0).
Proof.
Admitted.
