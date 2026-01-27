import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace verifythis_2015_dancing_links_DancingLinks_put_backqtvc
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
theorem put_back'vc (l : dll) (i : ℤ) (s : List ℤ) (fact0 : valid_out l i) (fact1 : is_list l s) (fact2 : (0 : ℤ) < Int.ofNat (List.length s)) (fact3 : (next l)[Int.toNat i]! = s[(0 : ℕ)]!) (fact4 : ¬s[(0 : ℕ)]! = i) : let o1 : List ℤ := next l; ((0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length o1)) ∧ (let o2 : ℤ := o1[Int.toNat i]!; let o3 : List ℤ := prev l; ((0 : ℤ) ≤ o2 ∧ o2 < Int.ofNat (List.length o3)) ∧ (List.length (List.set o3 (Int.toNat o2) i) = List.length o3 → List.length (List.set o3 (Int.toNat o2) i) = List.length (prev l) → getElem! (List.set o3 (Int.toNat o2) i) ∘ Int.toNat = Function.update (getElem! o3 ∘ Int.toNat) o2 i → ((0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length (List.set o3 (Int.toNat o2) i))) ∧ (let o4 : ℤ := (List.set o3 (Int.toNat o2) i)[Int.toNat i]!; ((0 : ℤ) ≤ o4 ∧ o4 < Int.ofNat (List.length (next l))) ∧ (∀(l1 : dll), List.length (List.set (next l) (Int.toNat o4) i) = List.length (next l) → List.length (List.set (next l) (Int.toNat o4) i) = List.length (next l) → getElem! (List.set (next l) (Int.toNat o4) i) ∘ Int.toNat = Function.update (getElem! (next l) ∘ Int.toNat) o4 i → (List.length (List.set o3 (Int.toNat o2) i) = List.length (List.set (next l) (Int.toNat o4) i) ∧ Int.ofNat (List.length (List.set (next l) (Int.toNat o4) i)) = n l) ∧ (n l = n l1 ∧ List.set (next l) (Int.toNat o4) i = next l1 ∧ List.set o3 (Int.toNat o2) i = prev l1 → valid_in l1 i ∧ is_list l1 (List.cons i s))))))
  := sorry
end verifythis_2015_dancing_links_DancingLinks_put_backqtvc
