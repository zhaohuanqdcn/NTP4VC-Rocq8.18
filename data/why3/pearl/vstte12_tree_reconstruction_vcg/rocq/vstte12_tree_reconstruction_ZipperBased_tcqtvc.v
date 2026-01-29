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
Require Import vstte12_tree_reconstruction_vcg.vstte12_tree_reconstruction.Tree.
Open Scope Z_scope.
Program Fixpoint forest_depths (f : list (Z * tree)) : list Z :=
match f with | [] => ([] : list Z) | cons (d, t) r => depths d t ++ forest_depths r end.
Admit Obligations.
Program Fixpoint greedy (d : Z) (d1 : Z) (t1 : tree) : Prop :=
¬ d = d1 ∧ (match t1 with | Leaf => True | Node l1 _ => greedy d (d1 + 1%Z) l1 end).
Admit Obligations.
Inductive g : list (Z * tree) -> Prop :=
 | Gnil : g ([] : list (Z * tree))
 | Gone (d : Z) (t : tree) : g (cons (d, t) ([] : list (Z * tree)))
 | Gtwo (d1 : Z) (d2 : Z) (t2 : tree) (t1 : tree) (l : list (Z * tree)) : greedy d1 d2 t2 -> g (cons (d1, t1) l) -> g (cons (d2, t2) (cons (d1, t1) l)).
Program Fixpoint only_leaf (l : list (Z * tree)) : Prop :=
match l with | [] => True | cons (_, t) r => t = Leaf ∧ only_leaf r end.
Admit Obligations.
Theorem tc'vc (left1 : list (Z * tree)) (right1 : list (Z * tree)) (fact0 : g left1) (fact1 : match left1 with | cons (d1, _) [] => ¬ d1 = 0%Z ∨ ¬ right1 = ([] : list (Z * tree)) | _ => True end) (fact2 : match right1 with | cons (d2, t2) right' => only_leaf right' ∧ (match t2 with | Node l2 _ => g (cons (d2 + 1%Z, l2) left1) | Leaf => True end) | [] => True end) : match right1 with | [] => (∀(t : tree), ¬ depths 0%Z t = forest_depths (rev left1 ++ right1)) | cons x x1 => (match x1 with | [] => (match x with | (x2, x3) => (match left1 with | [] => (if decide (x2 = 0%Z) then depths 0%Z x3 = forest_depths (rev left1 ++ right1) else ∀(t : tree), ¬ depths 0%Z t = forest_depths (rev left1 ++ right1)) | cons x4 x5 => (match x4 with | (x6, x7) => (if decide (x6 = x2) then let o1 : Z := x6 - 1%Z in let o2 : list (Z * tree) := cons (o1, Node x7 x3) x1 in ((0%Z ≤ Z.of_nat (length left1) + 2%Z * Z.of_nat (length right1) ∧ Z.of_nat (length x5) + 2%Z * Z.of_nat (length o2) < Z.of_nat (length left1) + 2%Z * Z.of_nat (length right1)) ∧ g x5 ∧ (match x5 with | cons (d1, _) [] => True | _ => True end) ∧ only_leaf x1 ∧ g (cons (o1 + 1%Z, x7) x5)) ∧ (∀(result : tree), depths 0%Z result = forest_depths (rev x5 ++ o2) -> depths 0%Z result = forest_depths (rev left1 ++ right1)) ∧ ((∀(t : tree), ¬ depths 0%Z t = forest_depths (rev x5 ++ o2)) -> (∀(t : tree), ¬ depths 0%Z t = forest_depths (rev left1 ++ right1))) else let o1 : list (Z * tree) := cons (x2, x3) left1 in ((0%Z ≤ Z.of_nat (length left1) + 2%Z * Z.of_nat (length right1) ∧ Z.of_nat (length o1) + 2%Z * Z.of_nat (length x1) < Z.of_nat (length left1) + 2%Z * Z.of_nat (length right1)) ∧ g o1 ∧ (match left1 with | [] => ¬ x2 = 0%Z ∨ ¬ x1 = ([] : list (Z * tree)) | _ => True end) ∧ (match x1 with | cons (d2, t2) right' => only_leaf right' ∧ (match t2 with | Node l2 _ => g (cons (d2 + 1%Z, l2) o1) | Leaf => True end) | [] => True end)) ∧ (∀(result : tree), depths 0%Z result = forest_depths (rev o1 ++ x1) -> depths 0%Z result = forest_depths (rev left1 ++ right1)) ∧ ((∀(t : tree), ¬ depths 0%Z t = forest_depths (rev o1 ++ x1)) -> (∀(t : tree), ¬ depths 0%Z t = forest_depths (rev left1 ++ right1)))) end) end) end) | _ => (match x with | (x2, x3) => (match left1 with | [] => (let o1 : list (Z * tree) := cons (x2, x3) ([] : list (Z * tree)) in ((0%Z ≤ Z.of_nat (length left1) + 2%Z * Z.of_nat (length right1) ∧ Z.of_nat (length o1) + 2%Z * Z.of_nat (length x1) < Z.of_nat (length left1) + 2%Z * Z.of_nat (length right1)) ∧ g o1 ∧ (¬ x2 = 0%Z ∨ ¬ x1 = ([] : list (Z * tree))) ∧ (match x1 with | cons (d2, t2) right' => only_leaf right' ∧ (match t2 with | Node l2 _ => g (cons (d2 + 1%Z, l2) o1) | Leaf => True end) | [] => True end)) ∧ (∀(result : tree), depths 0%Z result = forest_depths (rev o1 ++ x1) -> depths 0%Z result = forest_depths (rev left1 ++ right1)) ∧ ((∀(t : tree), ¬ depths 0%Z t = forest_depths (rev o1 ++ x1)) -> (∀(t : tree), ¬ depths 0%Z t = forest_depths (rev left1 ++ right1)))) | cons x4 x5 => (match x4 with | (x6, x7) => (if decide (x6 = x2) then let o1 : Z := x6 - 1%Z in let o2 : list (Z * tree) := cons (o1, Node x7 x3) x1 in ((0%Z ≤ Z.of_nat (length left1) + 2%Z * Z.of_nat (length right1) ∧ Z.of_nat (length x5) + 2%Z * Z.of_nat (length o2) < Z.of_nat (length left1) + 2%Z * Z.of_nat (length right1)) ∧ g x5 ∧ (match x5 with | cons (d1, _) [] => True | _ => True end) ∧ only_leaf x1 ∧ g (cons (o1 + 1%Z, x7) x5)) ∧ (∀(result : tree), depths 0%Z result = forest_depths (rev x5 ++ o2) -> depths 0%Z result = forest_depths (rev left1 ++ right1)) ∧ ((∀(t : tree), ¬ depths 0%Z t = forest_depths (rev x5 ++ o2)) -> (∀(t : tree), ¬ depths 0%Z t = forest_depths (rev left1 ++ right1))) else let o1 : list (Z * tree) := cons (x2, x3) left1 in ((0%Z ≤ Z.of_nat (length left1) + 2%Z * Z.of_nat (length right1) ∧ Z.of_nat (length o1) + 2%Z * Z.of_nat (length x1) < Z.of_nat (length left1) + 2%Z * Z.of_nat (length right1)) ∧ g o1 ∧ (match left1 with | [] => ¬ x2 = 0%Z ∨ ¬ x1 = ([] : list (Z * tree)) | _ => True end) ∧ (match x1 with | cons (d2, t2) right' => only_leaf right' ∧ (match t2 with | Node l2 _ => g (cons (d2 + 1%Z, l2) o1) | Leaf => True end) | [] => True end)) ∧ (∀(result : tree), depths 0%Z result = forest_depths (rev o1 ++ x1) -> depths 0%Z result = forest_depths (rev left1 ++ right1)) ∧ ((∀(t : tree), ¬ depths 0%Z t = forest_depths (rev o1 ++ x1)) -> (∀(t : tree), ¬ depths 0%Z t = forest_depths (rev left1 ++ right1)))) end) end) end) end) end.
Proof.
Admitted.
