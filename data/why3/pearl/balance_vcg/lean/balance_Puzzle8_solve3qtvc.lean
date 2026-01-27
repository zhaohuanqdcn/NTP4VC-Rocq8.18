import Why3.Base
import pearl.balance_vcg.lean.balance.Roberval
open Classical
open Lean4Why3
namespace balance_Puzzle8_solve3qtvc
noncomputable def spec (balls : List ℤ) (lo : ℤ) (hi : ℤ) (lb : ℤ) (w : ℤ) := ((0 : ℤ) ≤ lo ∧ lo ≤ lb ∧ lb < hi ∧ hi ≤ Int.ofNat (List.length balls)) ∧ (∀(i : ℤ), lo ≤ i ∧ i < hi → ¬i = lb → balls[Int.toNat i]! = w) ∧ balls[Int.toNat lb]! < w
theorem solve3'vc (counter : Roberval.counter) (balls : List ℤ) (lo : ℤ) (lb : ℤ) (w : ℤ) (fact0 : (1 : ℤ) ≤ Roberval.v counter) (fact1 : spec balls lo (lo + (3 : ℤ)) lb w) : let o1 : ℤ := lo + (1 : ℤ); ((0 : ℤ) ≤ o1 ∧ o1 < Int.ofNat (List.length balls)) ∧ (let o2 : ℤ := balls[Int.toNat o1]!; ((0 : ℤ) ≤ lo ∧ lo < Int.ofNat (List.length balls)) ∧ (let o3 : ℤ := balls[Int.toNat lo]!; (0 : ℤ) < Roberval.v counter ∧ (∀(counter1 : Roberval.counter) (o4 : Roberval.outcome), (match o4 with | Roberval.outcome.Left => o2 < o3 | Roberval.outcome.Equal => o3 = o2 | Roberval.outcome.Right => o3 < o2) ∧ Roberval.v counter1 = Roberval.v counter - (1 : ℤ) → (match o4 with | Roberval.outcome.Right => True | Roberval.outcome.Left => True | Roberval.outcome.Equal => True) ∧ (∀(result : ℤ), (match o4 with | Roberval.outcome.Right => result = lo | Roberval.outcome.Left => result = lo + (1 : ℤ) | Roberval.outcome.Equal => result = lo + (2 : ℤ)) → result = lb ∧ Roberval.v counter1 = Roberval.v counter - (1 : ℤ)))))
  := sorry
end balance_Puzzle8_solve3qtvc
