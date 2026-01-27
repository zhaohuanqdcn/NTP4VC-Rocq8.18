import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace flag2_Flag_swapqtvc
inductive color where
  | Blue : color
  | White : color
  | Red : color
axiom inhabited_axiom_color : Inhabited color
attribute [instance] inhabited_axiom_color
noncomputable def monochrome (a : ℤ -> color) (i : ℤ) (j : ℤ) (c : color) := ∀(k : ℤ), i ≤ k ∧ k < j → a k = c
axiom nb_occ : (ℤ -> color) -> ℤ -> ℤ -> color -> ℤ
axiom nb_occ'def (j : ℤ) (i : ℤ) (a : ℤ -> color) (c : color) : if j ≤ i then nb_occ a i j c = (0 : ℤ) else if a (j - (1 : ℤ)) = c then nb_occ a i j c = (1 : ℤ) + nb_occ a i (j - (1 : ℤ)) c else nb_occ a i j c = nb_occ a i (j - (1 : ℤ)) c
theorem swap'vc (i : ℤ) (a : List color) (j : ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : i < Int.ofNat (List.length a)) (fact2 : (0 : ℤ) ≤ j) (fact3 : j < Int.ofNat (List.length a)) : (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length a) ∧ (let ai : color := a[Int.toNat i]!; ((0 : ℤ) ≤ j ∧ j < Int.ofNat (List.length a)) ∧ (let aj : color := a[Int.toNat j]!; ((0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length a)) ∧ (List.length (List.set a (Int.toNat i) aj) = List.length a → getElem! (List.set a (Int.toNat i) aj) ∘ Int.toNat = Function.update (getElem! a ∘ Int.toNat) i aj → ((0 : ℤ) ≤ j ∧ j < Int.ofNat (List.length (List.set a (Int.toNat i) aj))) ∧ (List.length (List.set (List.set a (Int.toNat i) aj) (Int.toNat j) ai) = List.length (List.set a (Int.toNat i) aj) → getElem! (List.set (List.set a (Int.toNat i) aj) (Int.toNat j) ai) ∘ Int.toNat = Function.update (getElem! (List.set a (Int.toNat i) aj) ∘ Int.toNat) j ai → (List.set (List.set a (Int.toNat i) aj) (Int.toNat j) ai)[Int.toNat i]! = a[Int.toNat j]! ∧ (List.set (List.set a (Int.toNat i) aj) (Int.toNat j) ai)[Int.toNat j]! = a[Int.toNat i]! ∧ (∀(k : ℤ), ¬k = i ∧ ¬k = j → (List.set (List.set a (Int.toNat i) aj) (Int.toNat j) ai)[Int.toNat k]! = a[Int.toNat k]!) ∧ (∀(k1 : ℤ) (k2 : ℤ) (c : color), (k1 ≤ i ∧ i < k2) ∧ k1 ≤ j ∧ j < k2 → nb_occ (getElem! (List.set (List.set a (Int.toNat i) aj) (Int.toNat j) ai) ∘ Int.toNat) k1 k2 c = nb_occ (getElem! a ∘ Int.toNat) k1 k2 c)))))
  := sorry
end flag2_Flag_swapqtvc
