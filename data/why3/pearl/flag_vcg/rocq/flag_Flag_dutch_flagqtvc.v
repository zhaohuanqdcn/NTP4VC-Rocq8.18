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
Require Import Why3.map.MapEq.
Require Import Why3.map.MapExchange.
Require Import Why3.map.MapPermut.
Open Scope Z_scope.
Inductive color :=
  | Blue : color
  | White : color
  | Red : color.
Axiom color_inhabited : Inhabited color.
Global Existing Instance color_inhabited.
Axiom color_countable : Countable color.
Global Existing Instance color_countable.
Definition monochrome (a : list color) (i : Z) (j : Z) (c : color) := ∀(k : Z), i ≤ k ∧ k < j -> nth (Z.to_nat k) a inhabitant = c.
Theorem dutch_flag'vc (a : list color) : let o1 : Z := Z.of_nat (length a) in ((0%Z ≤ 0%Z ∧ 0%Z ≤ 0%Z ∧ 0%Z ≤ o1 ∧ o1 ≤ Z.of_nat (length a)) ∧ monochrome a 0%Z 0%Z Blue ∧ monochrome a 0%Z 0%Z White ∧ monochrome a o1 (Z.of_nat (length a)) Red ∧ a ≡ₚ a) ∧ (∀(r : Z) (i : Z) (b : Z) (a1 : list color), length a1 = length a -> (0%Z ≤ b ∧ b ≤ i ∧ i ≤ r ∧ r ≤ Z.of_nat (length a1)) ∧ monochrome a1 0%Z b Blue ∧ monochrome a1 b i White ∧ monochrome a1 r (Z.of_nat (length a1)) Red ∧ a ≡ₚ a1 -> (if decide (i < r) then (0%Z ≤ i ∧ i < Z.of_nat (length a1)) ∧ (match nth (Z.to_nat i) a1 inhabitant with | Blue => ((0%Z ≤ b ∧ b < Z.of_nat (length a1)) ∧ 0%Z ≤ i ∧ i < Z.of_nat (length a1)) ∧ (∀(a2 : list color), length a2 = length a1 -> array_exchange a1 a2 b i -> (0%Z ≤ r - i ∧ r - (i + 1%Z) < r - i) ∧ (0%Z ≤ b + 1%Z ∧ b + 1%Z ≤ i + 1%Z ∧ i + 1%Z ≤ r ∧ r ≤ Z.of_nat (length a2)) ∧ monochrome a2 0%Z (b + 1%Z) Blue ∧ monochrome a2 (b + 1%Z) (i + 1%Z) White ∧ monochrome a2 r (Z.of_nat (length a2)) Red ∧ a ≡ₚ a2) | White => (0%Z ≤ r - i ∧ r - (i + 1%Z) < r - i) ∧ (0%Z ≤ b ∧ b ≤ i + 1%Z ∧ i + 1%Z ≤ r ∧ r ≤ Z.of_nat (length a1)) ∧ monochrome a1 0%Z b Blue ∧ monochrome a1 b (i + 1%Z) White ∧ monochrome a1 r (Z.of_nat (length a1)) Red ∧ a ≡ₚ a1 | Red => ((0%Z ≤ r - 1%Z ∧ r - 1%Z < Z.of_nat (length a1)) ∧ 0%Z ≤ i ∧ i < Z.of_nat (length a1)) ∧ (∀(a2 : list color), length a2 = length a1 -> array_exchange a1 a2 (r - 1%Z) i -> (0%Z ≤ r - i ∧ r - 1%Z - i < r - i) ∧ (0%Z ≤ b ∧ b ≤ i ∧ i ≤ r - 1%Z ∧ r - 1%Z ≤ Z.of_nat (length a2)) ∧ monochrome a2 0%Z b Blue ∧ monochrome a2 b i White ∧ monochrome a2 (r - 1%Z) (Z.of_nat (length a2)) Red ∧ a ≡ₚ a2) end) else (∃(b1 : Z) (r1 : Z), monochrome a1 0%Z b1 Blue ∧ monochrome a1 b1 r1 White ∧ monochrome a1 r1 (Z.of_nat (length a1)) Red) ∧ a ≡ₚ a1)).
Proof.
Admitted.
