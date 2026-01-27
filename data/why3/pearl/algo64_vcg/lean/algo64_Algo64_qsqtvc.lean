import Why3.Base
import Why3.why3.Ref.Ref
import Why3.map.MapEq
import Why3.map.MapExchange
import Why3.map.MapPermut
import Why3.array.IntArraySorted
open Classical
open Lean4Why3
namespace algo64_Algo64_qsqtvc
noncomputable def qs_partition (t1 : List ℤ) (t2 : List ℤ) (m : ℤ) (n : ℤ) (i : ℤ) (j : ℤ) (x : ℤ) := List.permut_sub' t1 t2 (Int.toNat m) (Int.toNat (n + (1 : ℤ))) ∧ (∀(k : ℤ), m ≤ k ∧ k ≤ j → t2[Int.toNat k]! ≤ x) ∧ (∀(k : ℤ), j < k ∧ k < i → t2[Int.toNat k]! = x) ∧ (∀(k : ℤ), i ≤ k ∧ k ≤ n → x ≤ t2[Int.toNat k]!)
theorem qs'vc (a : List ℤ) : if (0 : ℤ) < Int.ofNat (List.length a) then let o1 : ℤ := Int.ofNat (List.length a) - (1 : ℤ); ((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ o1 ∧ o1 < Int.ofNat (List.length a)) ∧ (∀(a1 : List ℤ), List.length a1 = List.length a → List.permut_sub' a a1 (0 : ℕ) (Int.toNat (o1 + (1 : ℤ))) ∧ IntArraySorted.sorted_sub1 a1 (0 : ℤ) (o1 + (1 : ℤ)) → List.Perm a a1 ∧ IntArraySorted.sorted a1) else List.Perm a a ∧ IntArraySorted.sorted a
  := sorry
end algo64_Algo64_qsqtvc
