import Why3.Base
open Classical
open Lean4Why3
namespace verifythis_2018_le_rouge_et_le_noir_1_ColoredTiles_first_black_tileqtvc
inductive color where
  | Red : color
  | Black : color
axiom inhabited_axiom_color : Inhabited color
attribute [instance] inhabited_axiom_color
axiom coloring : Type
axiom inhabited_axiom_coloring : Inhabited coloring
attribute [instance] inhabited_axiom_coloring
noncomputable def tworedneighbors (c : List color) (i : ℤ) := getElem! c (Int.toNat (i - (2 : ℤ))) = color.Red ∧ getElem! c (Int.toNat (i - (1 : ℤ))) = color.Red ∧ (2 : ℤ) ≤ i ∨ getElem! c (Int.toNat (i - (1 : ℤ))) = color.Red ∧ getElem! c (Int.toNat (i + (1 : ℤ))) = color.Red ∧ (1 : ℤ) ≤ i ∧ i ≤ Int.ofNat (List.length c) - (2 : ℤ) ∨ getElem! c (Int.toNat (i + (1 : ℤ))) = color.Red ∧ getElem! c (Int.toNat (i + (2 : ℤ))) = color.Red ∧ i ≤ Int.ofNat (List.length c) - (3 : ℤ)
noncomputable def valid (c : List color) := ∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length c) → getElem! c (Int.toNat i) = color.Red → tworedneighbors c i
theorem first_black_tile'vc (c : List color) : let o1 : ℤ := Int.ofNat (List.length c); (¬o1 = (0 : ℤ) → (match getElem! c (0 : ℕ) with | color.Black => True | color.Red => ((0 : ℤ) ≤ (1 : ℤ) ∧ (1 : ℤ) ≤ Int.ofNat (List.length c)) ∧ (0 : ℤ) ≤ Int.ofNat (List.length c) ∧ List.length (List.drop (1 : ℕ) c) < List.length c)) ∧ (∀(result : ℤ), (if o1 = (0 : ℤ) then result = (0 : ℤ) else match getElem! c (0 : ℕ) with | color.Black => result = (0 : ℤ) | color.Red => (let o2 : List color := List.drop (1 : ℕ) c; ∃(r : ℤ), (((0 : ℤ) ≤ r ∧ r ≤ Int.ofNat (List.length o2)) ∧ (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < r ∧ r ≤ Int.ofNat (List.length o2) → o2[Int.toNat j]! = color.Red) ∧ (r < Int.ofNat (List.length o2) → o2[Int.toNat r]! = color.Black) ∧ (valid o2 → r = (0 : ℤ) ∨ (3 : ℤ) ≤ r)) ∧ result = (1 : ℤ) + r)) → ((0 : ℤ) ≤ result ∧ result ≤ Int.ofNat (List.length c)) ∧ (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < result ∧ result ≤ Int.ofNat (List.length c) → getElem! c (Int.toNat j) = color.Red) ∧ (result < Int.ofNat (List.length c) → getElem! c (Int.toNat result) = color.Black) ∧ (valid c → result = (0 : ℤ) ∨ (3 : ℤ) ≤ result))
  := sorry
end verifythis_2018_le_rouge_et_le_noir_1_ColoredTiles_first_black_tileqtvc
