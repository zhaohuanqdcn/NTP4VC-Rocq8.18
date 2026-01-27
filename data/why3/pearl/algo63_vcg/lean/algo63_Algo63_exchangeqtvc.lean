import Why3.Base
import Why3.why3.Ref.Ref
import Why3.map.MapEq
import Why3.map.MapExchange
import Why3.map.MapPermut
open Classical
open Lean4Why3
namespace algo63_Algo63_exchangeqtvc
theorem exchange'vc (m : ℤ) (i : ℤ) (n : ℤ) (a : List ℤ) (j : ℤ) (fact0 : (0 : ℤ) ≤ m) (fact1 : m ≤ i) (fact2 : i ≤ n) (fact3 : n < Int.ofNat (List.length a)) (fact4 : m ≤ j) (fact5 : j ≤ n) : (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length a) ∧ (let v : ℤ := a[Int.toNat i]!; ((0 : ℤ) ≤ j ∧ j < Int.ofNat (List.length a)) ∧ (let o1 : ℤ := a[Int.toNat j]!; ((0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length a)) ∧ (List.length (List.set a (Int.toNat i) o1) = List.length a → getElem! (List.set a (Int.toNat i) o1) ∘ Int.toNat = Function.update (getElem! a ∘ Int.toNat) i o1 → ((0 : ℤ) ≤ j ∧ j < Int.ofNat (List.length (List.set a (Int.toNat i) o1))) ∧ (List.length (List.set (List.set a (Int.toNat i) o1) (Int.toNat j) v) = List.length (List.set a (Int.toNat i) o1) → getElem! (List.set (List.set a (Int.toNat i) o1) (Int.toNat j) v) ∘ Int.toNat = Function.update (getElem! (List.set a (Int.toNat i) o1) ∘ Int.toNat) j v → Lean4Why3.arrayExchange a (List.set (List.set a (Int.toNat i) o1) (Int.toNat j) v) i j ∧ List.permut_sub' a (List.set (List.set a (Int.toNat i) o1) (Int.toNat j) v) (Int.toNat m) (Int.toNat (n + (1 : ℤ)))))))
  := sorry
end algo63_Algo63_exchangeqtvc
