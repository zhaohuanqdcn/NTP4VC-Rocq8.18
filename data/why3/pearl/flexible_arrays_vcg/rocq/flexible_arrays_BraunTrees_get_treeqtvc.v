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
Require Import Why3.bintree.Tree.
Require Import Why3.bintree.Size.
Open Scope Z_scope.
Program Fixpoint braun {α : Type} `{Inhabited α} (t : tree α) : Prop :=
match t with | Empty => True | Node l _ r => (Size.size l = Size.size r ∨ Size.size l = Size.size r + 1%Z) ∧ braun l ∧ braun r end.
Admit Obligations.
Theorem get_tree'vc {α : Type} `{Inhabited α} (i : Z) (t : tree α) (fact0 : 0%Z ≤ i) (fact1 : i < Size.size t) (fact2 : braun t) : match t with | Empty => False | Node l x r => ¬ i = 0%Z -> ¬ 2%Z = 0%Z ∧ (if decide (Z.quot i 2%Z = 1%Z) then ¬ 2%Z = 0%Z ∧ (let o1 : Z := Z.rem i 2%Z in (match t with | Empty => False | Node f _ f1 => f = l ∨ f1 = l end) ∧ (0%Z ≤ o1 ∧ o1 < Size.size l) ∧ braun l) else ¬ 2%Z = 0%Z ∧ (let o1 : Z := Z.rem i 2%Z - 1%Z in (match t with | Empty => False | Node f _ f1 => f = r ∨ f1 = r end) ∧ (0%Z ≤ o1 ∧ o1 < Size.size r) ∧ braun r)) end.
Admitted.
