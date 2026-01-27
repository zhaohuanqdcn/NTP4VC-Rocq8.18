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
Require Import koda_ruskey_vcg.koda_ruskey.KodaRuskey_Spec.
Open Scope Z_scope.
Axiom stack : Type.
Axiom stack_inhabited : Inhabited stack.
Global Existing Instance stack_inhabited.
Axiom stack_countable : Countable stack.
Global Existing Instance stack_countable.
Program Fixpoint mem_stack (n : Z) (st : list forest) : Prop :=
match st with | [] => False | cons f tl => mem_forest n f ∨ mem_stack n tl end.
Admit Obligations.
Program Fixpoint size_stack (st : list forest) : Z :=
match st with | [] => 0%Z | cons f st1 => size_forest f + size_stack st1 end.
Admit Obligations.
Program Fixpoint even_forest (f : forest) : Prop :=
match f with | E => False | N _ f1 f2 => ¬ even_forest f1 ∨ even_forest f2 end.
Admit Obligations.
Program Fixpoint final_forest (f : forest) (c : Z -> color) : Prop :=
match f with | E => True | N i f1 f2 => c i = Black ∧ final_forest f1 c ∧ (if decide (¬ even_forest f1) then white_forest f2 c else final_forest f2 c) end.
Admit Obligations.
Definition any_forest (f : forest) (c : Z -> color) := white_forest f c ∨ final_forest f c.
Definition unchanged (st : list forest) (c1 : Z -> color) (c2 : Z -> color) := ∀(i : Z), mem_stack i st -> c1 i = c2 i.
Program Fixpoint inverse (st : list forest) (c1 : Z -> color) (c2 : Z -> color) : Prop :=
match st with | [] => True | cons f st' => (white_forest f c1 ∧ final_forest f c2 ∨ final_forest f c1 ∧ white_forest f c2) ∧ (if decide (even_forest f) then unchanged st' c1 c2 else inverse st' c1 c2) end.
Admit Obligations.
Program Fixpoint any_stack (st : list forest) (c : Z -> color) : Prop :=
match st with | [] => True | cons f st1 => (white_forest f c ∨ final_forest f c) ∧ any_stack st1 c end.
Admit Obligations.
Inductive sub : list forest -> forest -> (Z -> color) -> Prop :=
 | Sub_reflex (f : forest) (c : Z -> color) : sub (cons f ([] : list forest)) f c
 | Sub_brother (st : list forest) (f2 : forest) (c : Z -> color) (i : Z) (f1 : forest) : sub st f2 c -> sub st (N i f1 f2) c
 | Sub_append (st : list forest) (f1 : forest) (c : Z -> color) (i : Z) (f2 : forest) : sub st f1 c -> c i = Black -> sub (st ++ cons f2 ([] : list forest)) (N i f1 f2) c.
Definition disjoint_stack (f : forest) (st : list forest) := ∀(i : Z), mem_forest i f -> ¬ mem_stack i st.
Program Fixpoint count_stack (st : list forest) : Z :=
match st with | [] => 1%Z | cons f st' => count_forest f * count_stack st' end.
Admit Obligations.
Axiom visited : Type.
Axiom visited_inhabited : Inhabited visited.
Global Existing Instance visited_inhabited.
Axiom visited_countable : Countable visited.
Global Existing Instance visited_countable.
Definition stored_solutions (f0 : forest) (bits : Z -> color) (st : list forest) (v1 : list (Z -> color)) (v2 : list (Z -> color)) := let n : Z := size_forest f0 in let start : Z := Z.of_nat (length v1) in let stop : Z := Z.of_nat (length v2) in stop - start = count_stack st ∧ (∀(j : Z), 0%Z ≤ j ∧ j < start -> eq_coloring n (nth (Z.to_nat j) v2 inhabitant) (nth (Z.to_nat j) v1 inhabitant)) ∧ (∀(j : Z), start ≤ j ∧ j < stop -> valid_coloring f0 (nth (Z.to_nat j) v2 inhabitant) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < n -> ¬ mem_stack i st -> nth (Z.to_nat j) v2 inhabitant i = bits i) ∧ (∀(k : Z), start ≤ k ∧ k < stop -> ¬ j = k -> ¬ eq_coloring n (nth (Z.to_nat j) v2 inhabitant) (nth (Z.to_nat k) v2 inhabitant))).
