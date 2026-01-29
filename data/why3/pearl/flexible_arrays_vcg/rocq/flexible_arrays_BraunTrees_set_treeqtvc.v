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
Require Import Why3.bintree.Tree.
Require Import Why3.bintree.Size.
Open Scope Z_scope.
Program Fixpoint braun {α : Type} `{Inhabited α} (t : tree α) : Prop :=
match t with | Empty => True | Node l _ r => (Size.size l = Size.size r ∨ Size.size l = Size.size r + 1%Z) ∧ braun l ∧ braun r end.
Admit Obligations.
Axiom get_tree : forall {α : Type} `{Inhabited α}, tree α -> Z -> α.
Axiom get_tree'def : forall  {α : Type} `{Inhabited α} (i : Z) (t : tree α) (fact0 : 0%Z ≤ i) (fact1 : i < Size.size t) (fact2 : braun t), match t with | Empty => False | Node l x r => (if decide (i = 0%Z) then get_tree t i = x else if decide (Z.quot i 2%Z = 1%Z) then get_tree t i = get_tree l (Z.rem i 2%Z) else get_tree t i = get_tree r (Z.rem i 2%Z - 1%Z)) end.
Theorem set_tree'vc {α : Type} `{Inhabited α} (i : Z) (t : tree α) (v : α) (fact0 : 0%Z ≤ i) (fact1 : i < Size.size t) (fact2 : braun t) : (match t with | Empty => False | Node l x r => ¬ i = 0%Z -> ¬ 2%Z = 0%Z ∧ (if decide (Z.quot i 2%Z = 1%Z) then ¬ 2%Z = 0%Z ∧ (let o1 : Z := Z.rem i 2%Z in (match t with | Empty => False | Node f _ f1 => f = l ∨ f1 = l end) ∧ (0%Z ≤ o1 ∧ o1 < Size.size l) ∧ braun l) else ¬ 2%Z = 0%Z ∧ (let o1 : Z := Z.rem i 2%Z - 1%Z in (match t with | Empty => False | Node f _ f1 => f = r ∨ f1 = r end) ∧ (0%Z ≤ o1 ∧ o1 < Size.size r) ∧ braun r)) end) ∧ (∀(r : tree α), (match t with | Empty => False | Node l x r1 => (if decide (i = 0%Z) then r = Node l v r1 else if decide (Z.quot i 2%Z = 1%Z) then let o1 : Z := Z.rem i 2%Z in ∃(o2 : tree α), (Size.size o2 = Size.size l ∧ braun o2 ∧ get_tree o2 o1 = v ∧ (∀(j : Z), 0%Z ≤ j ∧ j < Size.size l -> ¬ j = o1 -> get_tree o2 j = get_tree l j)) ∧ r = Node o2 x r1 else let o1 : Z := Z.rem i 2%Z - 1%Z in ∃(o2 : tree α), (Size.size o2 = Size.size r1 ∧ braun o2 ∧ get_tree o2 o1 = v ∧ (∀(j : Z), 0%Z ≤ j ∧ j < Size.size r1 -> ¬ j = o1 -> get_tree o2 j = get_tree r1 j)) ∧ r = Node l x o2) end) -> Size.size r = Size.size t ∧ braun r ∧ get_tree r i = v ∧ (∀(j : Z), 0%Z ≤ j ∧ j < Size.size t -> ¬ j = i -> get_tree r j = get_tree t j)).
Proof.
Admitted.
