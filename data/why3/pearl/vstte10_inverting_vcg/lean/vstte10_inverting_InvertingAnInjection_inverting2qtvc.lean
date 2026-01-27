import Why3.Base
import Why3.map.MapInjection
open Classical
open Lean4Why3
namespace vstte10_inverting_InvertingAnInjection_inverting2qtvc
noncomputable def injective (a : List ℤ) (n : ℤ) := MapInjection.injective (getElem! a ∘ Int.toNat) n
noncomputable def surjective (a : List ℤ) (n : ℤ) := MapInjection.surjective (getElem! a ∘ Int.toNat) n
noncomputable def range (a : List ℤ) (n : ℤ) := MapInjection.range (getElem! a ∘ Int.toNat) n
theorem inverting2'vc (a : List ℤ) (fact0 : injective a (Int.ofNat (List.length a))) (fact1 : range a (Int.ofNat (List.length a))) : (0 : ℤ) ≤ Int.ofNat (List.length a) ∧ (∀(b : List ℤ), (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length a) → b[Int.toNat i]! = (0 : ℤ)) ∧ List.length b = List.length a → (let o1 : ℤ := Int.ofNat (List.length a) - (1 : ℤ); ((0 : ℤ) ≤ o1 + (1 : ℤ) → (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < (0 : ℤ) → b[Int.toNat (a[Int.toNat j]!)]! = j) ∧ (∀(b1 : List ℤ), List.length b1 = List.length b → (∀(i : ℤ), ((0 : ℤ) ≤ i ∧ i ≤ o1) ∧ (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < i → b1[Int.toNat (a[Int.toNat j]!)]! = j) → ((0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length a)) ∧ (let o2 : ℤ := a[Int.toNat i]!; ((0 : ℤ) ≤ o2 ∧ o2 < Int.ofNat (List.length b1)) ∧ (List.length (List.set b1 (Int.toNat o2) i) = List.length b1 → getElem! (List.set b1 (Int.toNat o2) i) ∘ Int.toNat = Function.update (getElem! b1 ∘ Int.toNat) o2 i → (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < i + (1 : ℤ) → (List.set b1 (Int.toNat o2) i)[Int.toNat (a[Int.toNat j]!)]! = j)))) ∧ ((∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < o1 + (1 : ℤ) → b1[Int.toNat (a[Int.toNat j]!)]! = j) → List.length b1 = List.length a ∧ injective b1 (Int.ofNat (List.length a)) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length a) → b1[Int.toNat (a[Int.toNat i]!)]! = i)))) ∧ (o1 + (1 : ℤ) < (0 : ℤ) → List.length b = List.length a ∧ injective b (Int.ofNat (List.length a)) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length a) → b[Int.toNat (a[Int.toNat i]!)]! = i))))
  := sorry
end vstte10_inverting_InvertingAnInjection_inverting2qtvc
