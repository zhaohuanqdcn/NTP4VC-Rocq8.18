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
Require Import Why3.why3.Ref.Ref.
Open Scope Z_scope.
Axiom t : Type.
Axiom t_inhabited : Inhabited t.
Global Existing Instance t_inhabited.
Axiom t_countable : Countable t.
Global Existing Instance t_countable.
Axiom rvars : Type.
Axiom rvars_inhabited : Inhabited rvars.
Global Existing Instance rvars_inhabited.
Axiom rvars_countable : Countable rvars.
Global Existing Instance rvars_countable.
Definition rinterp (t1 : Z * Z) (x_v : Z -> R) : R := match t1 with | (n, d) => Rdiv (Rdefinitions.IZR n) (Rdefinitions.IZR d) end.
Theorem simp'vc (d : Z) (n : Z) : (¬ d = 0%Z -> ¬ n = 0%Z -> (let o1 : Z := Z.abs d in let o2 : Z := Z.abs n in (0%Z < o2 ∧ 0%Z < o1) ∧ (let g : Z := Z.gcd o2 o1 in 0%Z < g -> ¬ g = 0%Z))) ∧ (∀(result : Z) (result1 : Z), let result2 : Z * Z := (result, result1) in (if decide (d = 0%Z) then result = n ∧ result1 = d else if decide (n = 0%Z) then result2 = (0%Z, 1%Z) else let g : Z := Z.gcd (Z.abs n) (Z.abs d) in 0%Z < g ∧ result = Z.rem n g ∧ result1 = Z.rem d g) -> (∀(v : Z -> R), rinterp result2 v = rinterp (n, d) v)).
Admitted.
