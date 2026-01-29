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
Require Import Why3.why3.Ref.Ref.
Require Import Why3.int.NumOf.
Require Import Why3.queue.Queue.
Open Scope Z_scope.
Axiom n : Z.
Axiom N_val : 2%Z ≤ n.
Axiom k : Z.
Axiom K_val : 2%Z ≤ k.
Axiom tick : Type.
Axiom tick_inhabited : Inhabited tick.
Global Existing Instance tick_inhabited.
Axiom tick_countable : Countable tick.
Global Existing Instance tick_countable.
Axiom b : tick -> Z.
Axiom v : tick -> Z.
Axiom tick'invariant : forall  (self : tick), 0%Z ≤ v self ∧ 0%Z ≤ b self ∧ b self < k * n ∧ b self = ZEuclid.modulo (v self) (k * n).
Definition tick'eq (a : tick) (b1 : tick) := b a = b b1 ∧ v a = v b1.
Axiom tick'inj : forall  (a : tick) (b1 : tick) (fact0 : tick'eq a b1), a = b1.
Definition lt (tick1 : tick) (tick2 : tick) := v tick1 < v tick2.
Definition sorted (s : list tick) := ∀(i : Z) (j : Z), 0%Z ≤ i ∧ i < j ∧ j < Z.of_nat (length s) -> lt (nth (Z.to_nat i) s inhabitant) (nth (Z.to_nat j) s inhabitant).
Definition consecutive (l : list tick) := ∀(i : Z), 0%Z < i ∧ i < Z.of_nat (length l) -> v (nth (Z.to_nat i) l inhabitant) = v (nth (Z.to_nat (i - 1%Z)) l inhabitant) + 1%Z.
Definition last (l : list tick) : option tick := if decide (Z.of_nat (length l) = 0%Z) then None else Some (nth (Z.to_nat (Z.of_nat (length l) - 1%Z)) l inhabitant).
Definition hd (l : list tick) : option tick := if decide (Z.of_nat (length l) = 0%Z) then None else Some (nth 0%nat l inhabitant).
Inductive pc :=
  | A1 : pc
  | A2 : pc
  | A3 : pc
  | R1 : pc
  | R2 : pc
  | I : pc
  | W : pc.
Axiom pc_inhabited : Inhabited pc.
Global Existing Instance pc_inhabited.
Axiom pc_countable : Countable pc.
Global Existing Instance pc_countable.
Definition has_ticket (pc1 : pc) := match pc1 with | A1 => False | I => False | _ => True end.
Definition has_lock (pc1 : pc) := match pc1 with | A3 => True | W => True | R1 => True | R2 => True | _ => False end.
Axiom nondet_source : Type.
Axiom nondet_source_inhabited : Inhabited nondet_source.
Global Existing Instance nondet_source_inhabited.
Axiom nondet_source_countable : Countable nondet_source.
Global Existing Instance nondet_source_countable.
Axiom rng : Type.
Axiom rng_inhabited : Inhabited rng.
Global Existing Instance rng_inhabited.
Axiom rng_countable : Countable rng.
Global Existing Instance rng_countable.
Axiom source : rng -> nondet_source.
Axiom fc : forall {α : Type} `{Inhabited α}, list α -> α -> Z -> bool.
Axiom fc'def : forall  {α : Type} `{Inhabited α} (a : list α) (v1 : α) (i : Z), (fc a v1 i = true) = (nth (Z.to_nat i) a inhabitant = v1).
Theorem mod_diff'vc (c : Z) (a : Z) (b1 : Z) (fact0 : 0%Z < c) (fact1 : ZEuclid.modulo a c = ZEuclid.modulo b1 c) : ZEuclid.modulo (a - b1) c = 0%Z.
Proof.
Admitted.
