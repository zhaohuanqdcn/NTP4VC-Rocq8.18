import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace DancingLinks
axiom dll : Type
axiom inhabited_axiom_dll : Inhabited dll
attribute [instance] inhabited_axiom_dll
axiom prev : dll -> List ℤ
axiom next : dll -> List ℤ
axiom n : dll -> ℤ
axiom dll'invariant (self : dll) : List.length (prev self) = List.length (next self) ∧ Int.ofNat (List.length (next self)) = n self
noncomputable def dll'eq (a : dll) (b : dll) := prev a = prev b ∧ next a = next b ∧ n a = n b
axiom dll'inj (a : dll) (b : dll) (fact0 : dll'eq a b) : a = b
noncomputable def valid_in (l : dll) (i : ℤ) := ((0 : ℤ) ≤ i ∧ i < n l) ∧ ((0 : ℤ) ≤ (prev l)[Int.toNat i]! ∧ (prev l)[Int.toNat i]! < n l) ∧ ((0 : ℤ) ≤ (next l)[Int.toNat i]! ∧ (next l)[Int.toNat i]! < n l) ∧ (next l)[Int.toNat ((prev l)[Int.toNat i]!)]! = i ∧ (prev l)[Int.toNat ((next l)[Int.toNat i]!)]! = i
noncomputable def valid_out (l : dll) (i : ℤ) := ((0 : ℤ) ≤ i ∧ i < n l) ∧ ((0 : ℤ) ≤ (prev l)[Int.toNat i]! ∧ (prev l)[Int.toNat i]! < n l) ∧ ((0 : ℤ) ≤ (next l)[Int.toNat i]! ∧ (next l)[Int.toNat i]! < n l) ∧ (next l)[Int.toNat ((prev l)[Int.toNat i]!)]! = (next l)[Int.toNat i]! ∧ (prev l)[Int.toNat ((next l)[Int.toNat i]!)]! = (prev l)[Int.toNat i]!
noncomputable def is_list (l : dll) (s : List ℤ) := ∀(k : ℤ), (0 : ℤ) ≤ k ∧ k < Int.ofNat (List.length s) → ((0 : ℤ) ≤ s[Int.toNat k]! ∧ s[Int.toNat k]! < n l) ∧ (prev l)[Int.toNat (s[Int.toNat k]!)]! = s[Int.toNat (if k = (0 : ℤ) then Int.ofNat (List.length s) - (1 : ℤ) else k - (1 : ℤ))]! ∧ (next l)[Int.toNat (s[Int.toNat k]!)]! = s[Int.toNat (if k = Int.ofNat (List.length s) - (1 : ℤ) then (0 : ℤ) else k + (1 : ℤ))]! ∧ (∀(k' : ℤ), (0 : ℤ) ≤ k' ∧ k' < Int.ofNat (List.length s) → ¬k = k' → ¬s[Int.toNat k]! = s[Int.toNat k']!)
end DancingLinks
