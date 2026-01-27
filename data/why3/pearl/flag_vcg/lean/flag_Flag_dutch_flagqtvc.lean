import Why3.Base
import Why3.why3.Ref.Ref
import Why3.map.MapEq
import Why3.map.MapExchange
import Why3.map.MapPermut
open Classical
open Lean4Why3
namespace flag_Flag_dutch_flagqtvc
inductive color where
  | Blue : color
  | White : color
  | Red : color
axiom inhabited_axiom_color : Inhabited color
attribute [instance] inhabited_axiom_color
noncomputable def monochrome (a : List color) (i : ℤ) (j : ℤ) (c : color) := ∀(k : ℤ), i ≤ k ∧ k < j → a[Int.toNat k]! = c
theorem dutch_flag'vc (a : List color) : let o1 : ℤ := Int.ofNat (List.length a); (((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ o1 ∧ o1 ≤ Int.ofNat (List.length a)) ∧ monochrome a (0 : ℤ) (0 : ℤ) color.Blue ∧ monochrome a (0 : ℤ) (0 : ℤ) color.White ∧ monochrome a o1 (Int.ofNat (List.length a)) color.Red ∧ List.Perm a a) ∧ (∀(r : ℤ) (i : ℤ) (b : ℤ) (a1 : List color), List.length a1 = List.length a → ((0 : ℤ) ≤ b ∧ b ≤ i ∧ i ≤ r ∧ r ≤ Int.ofNat (List.length a1)) ∧ monochrome a1 (0 : ℤ) b color.Blue ∧ monochrome a1 b i color.White ∧ monochrome a1 r (Int.ofNat (List.length a1)) color.Red ∧ List.Perm a a1 → (if i < r then ((0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length a1)) ∧ (match a1[Int.toNat i]! with | color.Blue => (((0 : ℤ) ≤ b ∧ b < Int.ofNat (List.length a1)) ∧ (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length a1)) ∧ (∀(a2 : List color), List.length a2 = List.length a1 → Lean4Why3.arrayExchange a1 a2 b i → ((0 : ℤ) ≤ r - i ∧ r - (i + (1 : ℤ)) < r - i) ∧ ((0 : ℤ) ≤ b + (1 : ℤ) ∧ b + (1 : ℤ) ≤ i + (1 : ℤ) ∧ i + (1 : ℤ) ≤ r ∧ r ≤ Int.ofNat (List.length a2)) ∧ monochrome a2 (0 : ℤ) (b + (1 : ℤ)) color.Blue ∧ monochrome a2 (b + (1 : ℤ)) (i + (1 : ℤ)) color.White ∧ monochrome a2 r (Int.ofNat (List.length a2)) color.Red ∧ List.Perm a a2) | color.White => ((0 : ℤ) ≤ r - i ∧ r - (i + (1 : ℤ)) < r - i) ∧ ((0 : ℤ) ≤ b ∧ b ≤ i + (1 : ℤ) ∧ i + (1 : ℤ) ≤ r ∧ r ≤ Int.ofNat (List.length a1)) ∧ monochrome a1 (0 : ℤ) b color.Blue ∧ monochrome a1 b (i + (1 : ℤ)) color.White ∧ monochrome a1 r (Int.ofNat (List.length a1)) color.Red ∧ List.Perm a a1 | color.Red => (((0 : ℤ) ≤ r - (1 : ℤ) ∧ r - (1 : ℤ) < Int.ofNat (List.length a1)) ∧ (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length a1)) ∧ (∀(a2 : List color), List.length a2 = List.length a1 → Lean4Why3.arrayExchange a1 a2 (r - (1 : ℤ)) i → ((0 : ℤ) ≤ r - i ∧ r - (1 : ℤ) - i < r - i) ∧ ((0 : ℤ) ≤ b ∧ b ≤ i ∧ i ≤ r - (1 : ℤ) ∧ r - (1 : ℤ) ≤ Int.ofNat (List.length a2)) ∧ monochrome a2 (0 : ℤ) b color.Blue ∧ monochrome a2 b i color.White ∧ monochrome a2 (r - (1 : ℤ)) (Int.ofNat (List.length a2)) color.Red ∧ List.Perm a a2)) else (∃(b1 : ℤ) (r1 : ℤ), monochrome a1 (0 : ℤ) b1 color.Blue ∧ monochrome a1 b1 r1 color.White ∧ monochrome a1 r1 (Int.ofNat (List.length a1)) color.Red) ∧ List.Perm a a1))
  := sorry
end flag_Flag_dutch_flagqtvc
