import Why3.Base
open Classical
open Lean4Why3
namespace verifythis_2018_le_rouge_et_le_noir_1_ColoredTiles_mapaddleft_cardqtvc
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
axiom first_black_tile : List color -> ℤ
axiom first_black_tile'def (c : List color) : if Int.ofNat (List.length c) = (0 : ℤ) then first_black_tile c = (0 : ℤ) else match getElem! c (0 : ℕ) with | color.Black => first_black_tile c = (0 : ℤ) | color.Red => first_black_tile c = (1 : ℤ) + first_black_tile (List.drop (1 : ℕ) c)
axiom first_black_tile'spec'2 (c : List color) : (0 : ℤ) ≤ first_black_tile c ∧ first_black_tile c ≤ Int.ofNat (List.length c)
axiom first_black_tile'spec'1 (j : ℤ) (c : List color) (fact0 : (0 : ℤ) ≤ j) (fact1 : j < first_black_tile c) (fact2 : first_black_tile c ≤ Int.ofNat (List.length c)) : getElem! c (Int.toNat j) = color.Red
axiom first_black_tile'spec'0 (c : List color) (fact0 : first_black_tile c < Int.ofNat (List.length c)) : getElem! c (Int.toNat (first_black_tile c)) = color.Black
axiom first_black_tile'spec (c : List color) (fact0 : valid c) : first_black_tile c = (0 : ℤ) ∨ (3 : ℤ) ≤ first_black_tile c
axiom addleft : ℤ -> List color -> List color
axiom addleft'def (nr : ℤ) (c : List color) : if nr ≤ (0 : ℤ) then addleft nr c = List.cons color.Black c else addleft nr c = List.cons color.Red (addleft (nr - (1 : ℤ)) c)
axiom addleft'spec (nr : ℤ) (c : List color) (fact0 : (0 : ℤ) ≤ nr) : Int.ofNat (List.length (addleft nr c)) = Int.ofNat (List.length c) + nr + (1 : ℤ)
axiom addleft_closure : ℤ -> List color -> List color
axiom addleft_closure_def (y : ℤ) (y1 : List color) : addleft_closure y y1 = addleft y y1
noncomputable def mapaddleft (s : Finset (List color)) (nr : ℤ) := Finset.image (addleft_closure nr) s
noncomputable def reciprocal {β : Type} {α : Type} [Inhabited β] [Inhabited α] (f : α -> β) (g : β -> α) := ∀(y : α), g (f y) = y
noncomputable def rmleft (nr : ℤ) (c : List color) := List.drop (Int.toNat (nr + (1 : ℤ))) c
theorem mapaddleft_card'vc (nr : ℤ) (s : Finset (List color)) (fact0 : (0 : ℤ) ≤ nr) : Finset.card (mapaddleft s nr) = Finset.card s
  := sorry
end verifythis_2018_le_rouge_et_le_noir_1_ColoredTiles_mapaddleft_cardqtvc
