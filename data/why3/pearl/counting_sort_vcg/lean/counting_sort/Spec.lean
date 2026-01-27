import Why3.Base
import Why3.int.NumOf
import Why3.array.IntArraySorted
open Classical
open Lean4Why3
namespace Spec
axiom k : ℤ
axiom k'def : (0 : ℤ) < k
noncomputable def k_values (a : List ℤ) := ∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length a) → (0 : ℤ) ≤ a[Int.toNat i]! ∧ a[Int.toNat i]! < k
axiom fc : List ℤ -> ℤ -> ℤ -> Bool
axiom fc'def (a : List ℤ) (v : ℤ) (k1 : ℤ) : (fc a v k1 = true) = (a[Int.toNat k1]! = v)
noncomputable def numeq (a : List ℤ) (v : ℤ) (i : ℤ) (j : ℤ) := NumOf.numof (fc a v) i j
axiom fc1 : List ℤ -> ℤ -> ℤ -> Bool
axiom fc'def1 (a : List ℤ) (v : ℤ) (k1 : ℤ) : (fc1 a v k1 = true) = (a[Int.toNat k1]! < v)
noncomputable def numlt (a : List ℤ) (v : ℤ) (i : ℤ) (j : ℤ) := NumOf.numof (fc1 a v) i j
noncomputable def permut (a : List ℤ) (b : List ℤ) := List.length a = List.length b ∧ (∀(v : ℤ), (0 : ℤ) ≤ v ∧ v < k → numeq a v (0 : ℤ) (Int.ofNat (List.length a)) = numeq b v (0 : ℤ) (Int.ofNat (List.length b)))
end Spec
