import Why3.Base
import Why3.why3.Ref.Ref
import Why3.map.MapEq
import Why3.map.MapExchange
import Why3.map.MapPermut
import Why3.map.MapInjection
import pearl.verifythis_fm2012_LRS_vcg.lean.verifythis_fm2012_LRS.LCP
import pearl.verifythis_fm2012_LRS_vcg.lean.verifythis_fm2012_LRS.SuffixSort
import pearl.verifythis_fm2012_LRS_vcg.lean.verifythis_fm2012_LRS.SuffixArray
import pearl.verifythis_fm2012_LRS_vcg.lean.verifythis_fm2012_LRS.LRS
open Classical
open Lean4Why3
namespace verifythis_fm2012_LRS_LRS_test_benchqtvc
theorem bench'vc : (0 : ℤ) ≤ (4 : ℤ) ∧ (∀(arr : List ℤ), (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < (4 : ℤ) → arr[Int.toNat i]! = (0 : ℤ)) ∧ Int.ofNat (List.length arr) = (4 : ℤ) → ((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) < Int.ofNat (List.length arr)) ∧ (List.length (List.set arr (0 : ℕ) (7 : ℤ)) = List.length arr → getElem! (List.set arr (0 : ℕ) (7 : ℤ)) ∘ Int.toNat = Function.update (getElem! arr ∘ Int.toNat) (0 : ℤ) (7 : ℤ) → ((0 : ℤ) ≤ (1 : ℤ) ∧ (1 : ℤ) < Int.ofNat (List.length (List.set arr (0 : ℕ) (7 : ℤ)))) ∧ (List.length (List.set (List.set arr (0 : ℕ) (7 : ℤ)) (1 : ℕ) (8 : ℤ)) = List.length (List.set arr (0 : ℕ) (7 : ℤ)) → getElem! (List.set (List.set arr (0 : ℕ) (7 : ℤ)) (1 : ℕ) (8 : ℤ)) ∘ Int.toNat = Function.update (getElem! (List.set arr (0 : ℕ) (7 : ℤ)) ∘ Int.toNat) (1 : ℤ) (8 : ℤ) → ((0 : ℤ) ≤ (2 : ℤ) ∧ (2 : ℤ) < Int.ofNat (List.length (List.set (List.set arr (0 : ℕ) (7 : ℤ)) (1 : ℕ) (8 : ℤ)))) ∧ (List.length (List.set (List.set (List.set arr (0 : ℕ) (7 : ℤ)) (1 : ℕ) (8 : ℤ)) (2 : ℕ) (8 : ℤ)) = List.length (List.set (List.set arr (0 : ℕ) (7 : ℤ)) (1 : ℕ) (8 : ℤ)) → getElem! (List.set (List.set (List.set arr (0 : ℕ) (7 : ℤ)) (1 : ℕ) (8 : ℤ)) (2 : ℕ) (8 : ℤ)) ∘ Int.toNat = Function.update (getElem! (List.set (List.set arr (0 : ℕ) (7 : ℤ)) (1 : ℕ) (8 : ℤ)) ∘ Int.toNat) (2 : ℤ) (8 : ℤ) → ((0 : ℤ) ≤ (3 : ℤ) ∧ (3 : ℤ) < Int.ofNat (List.length (List.set (List.set (List.set arr (0 : ℕ) (7 : ℤ)) (1 : ℕ) (8 : ℤ)) (2 : ℕ) (8 : ℤ)))) ∧ (List.length (List.set (List.set (List.set (List.set arr (0 : ℕ) (7 : ℤ)) (1 : ℕ) (8 : ℤ)) (2 : ℕ) (8 : ℤ)) (3 : ℕ) (6 : ℤ)) = List.length (List.set (List.set (List.set arr (0 : ℕ) (7 : ℤ)) (1 : ℕ) (8 : ℤ)) (2 : ℕ) (8 : ℤ)) → getElem! (List.set (List.set (List.set (List.set arr (0 : ℕ) (7 : ℤ)) (1 : ℕ) (8 : ℤ)) (2 : ℕ) (8 : ℤ)) (3 : ℕ) (6 : ℤ)) ∘ Int.toNat = Function.update (getElem! (List.set (List.set (List.set arr (0 : ℕ) (7 : ℤ)) (1 : ℕ) (8 : ℤ)) (2 : ℕ) (8 : ℤ)) ∘ Int.toNat) (3 : ℤ) (6 : ℤ) → (0 : ℤ) < Int.ofNat (List.length (List.set (List.set (List.set (List.set arr (0 : ℕ) (7 : ℤ)) (1 : ℕ) (8 : ℤ)) (2 : ℕ) (8 : ℤ)) (3 : ℕ) (6 : ℤ))))))))
  := sorry
end verifythis_fm2012_LRS_LRS_test_benchqtvc
