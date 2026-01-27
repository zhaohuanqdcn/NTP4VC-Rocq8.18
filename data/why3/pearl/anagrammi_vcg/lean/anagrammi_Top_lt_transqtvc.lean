import Why3.Base
open Classical
open Lean4Why3
namespace anagrammi_Top_lt_transqtvc
axiom line : Type
axiom inhabited_axiom_line : Inhabited line
attribute [instance] inhabited_axiom_line
noncomputable def perm4 (s : List ℤ) := Int.ofNat (List.length s) = (4 : ℤ) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < (4 : ℤ) → (1 : ℤ) ≤ s[Int.toNat i]! ∧ s[Int.toNat i]! ≤ (4 : ℤ)) ∧ List.Nodup s
noncomputable def lt (s1 : List ℤ) (s2 : List ℤ) := ∃(i : ℤ), ((0 : ℤ) ≤ i ∧ i < (4 : ℤ)) ∧ s1[Int.toNat i]! < s2[Int.toNat i]! ∧ (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < i → s1[Int.toNat j]! = s2[Int.toNat j]!)
theorem lt_trans'vc (s1 : List ℤ) (s2 : List ℤ) (s3 : List ℤ) (fact0 : perm4 s1) (fact1 : perm4 s2) (fact2 : perm4 s3) (fact3 : lt s1 s2) (fact4 : lt s2 s3) : lt s1 s3
  := sorry
end anagrammi_Top_lt_transqtvc
