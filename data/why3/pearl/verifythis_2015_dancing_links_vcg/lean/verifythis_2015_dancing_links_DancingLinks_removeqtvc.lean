import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace verifythis_2015_dancing_links_DancingLinks_removeqtvc
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
theorem remove'vc (l : dll) (i : ℤ) (s : List ℤ) (fact0 : valid_in l i) (fact1 : is_list l (List.cons i s)) : let o1 : List ℤ := prev l; ((0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length o1)) ∧ (let o2 : ℤ := o1[Int.toNat i]!; let o3 : List ℤ := next l; ((0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length o3)) ∧ (let o4 : ℤ := o3[Int.toNat i]!; let o5 : List ℤ := prev l; ((0 : ℤ) ≤ o4 ∧ o4 < Int.ofNat (List.length o5)) ∧ (List.length (List.set o5 (Int.toNat o4) o2) = List.length o5 → List.length (List.set o5 (Int.toNat o4) o2) = List.length (prev l) → getElem! (List.set o5 (Int.toNat o4) o2) ∘ Int.toNat = Function.update (getElem! o5 ∘ Int.toNat) o4 o2 → ((0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length (next l))) ∧ (let o6 : ℤ := (next l)[Int.toNat i]!; ((0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length (List.set o5 (Int.toNat o4) o2))) ∧ (let o7 : ℤ := (List.set o5 (Int.toNat o4) o2)[Int.toNat i]!; ((0 : ℤ) ≤ o7 ∧ o7 < Int.ofNat (List.length (next l))) ∧ (∀(l1 : dll), List.length (List.set (next l) (Int.toNat o7) o6) = List.length (next l) → List.length (List.set (next l) (Int.toNat o7) o6) = List.length (next l) → getElem! (List.set (next l) (Int.toNat o7) o6) ∘ Int.toNat = Function.update (getElem! (next l) ∘ Int.toNat) o7 o6 → (List.length (List.set o5 (Int.toNat o4) o2) = List.length (List.set (next l) (Int.toNat o7) o6) ∧ Int.ofNat (List.length (List.set (next l) (Int.toNat o7) o6)) = n l) ∧ (n l = n l1 ∧ List.set (next l) (Int.toNat o7) o6 = next l1 ∧ List.set o5 (Int.toNat o4) o2 = prev l1 → valid_out l1 i ∧ is_list l1 s)))))))
  := sorry
end verifythis_2015_dancing_links_DancingLinks_removeqtvc
