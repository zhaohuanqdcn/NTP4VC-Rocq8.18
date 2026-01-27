import Why3.Base
open Classical
open Lean4Why3
namespace verifythis_2018_le_rouge_et_le_noir_1_ColoredTiles_valid_split_fbqtvc
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
theorem valid_split_fb'vc (k : ℤ) (c : List color) (fact0 : (3 : ℤ) ≤ k) (fact1 : k < Int.ofNat (List.length c)) (fact2 : ∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < k → getElem! c (Int.toNat i) = color.Red) (fact3 : valid (List.drop (Int.toNat (k + (1 : ℤ))) c)) : valid c
  := sorry
end verifythis_2018_le_rouge_et_le_noir_1_ColoredTiles_valid_split_fbqtvc
