import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace anagrammi_Top_anagrammiqtvc
axiom line : Type
axiom inhabited_axiom_line : Inhabited line
attribute [instance] inhabited_axiom_line
noncomputable def perm4 (s : List ℤ) := Int.ofNat (List.length s) = (4 : ℤ) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < (4 : ℤ) → (1 : ℤ) ≤ s[Int.toNat i]! ∧ s[Int.toNat i]! ≤ (4 : ℤ)) ∧ List.Nodup s
noncomputable def lt (s1 : List ℤ) (s2 : List ℤ) := ∃(i : ℤ), ((0 : ℤ) ≤ i ∧ i < (4 : ℤ)) ∧ s1[Int.toNat i]! < s2[Int.toNat i]! ∧ (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < i → s1[Int.toNat j]! = s2[Int.toNat j]!)
noncomputable def sorted (o1 : List (List ℤ)) := (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < Int.ofNat (List.length o1) → perm4 (o1[Int.toNat j]!)) ∧ (∀(j1 : ℤ) (j2 : ℤ), (0 : ℤ) ≤ j1 ∧ j1 < j2 ∧ j2 < Int.ofNat (List.length o1) → lt (o1[Int.toNat j1]!) (o1[Int.toNat j2]!))
noncomputable def below (o1 : List (List ℤ)) (pr : List ℤ -> Bool) := sorted o1 ∧ (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < Int.ofNat (List.length o1) → pr (o1[Int.toNat j]!) = true) ∧ (∀(s : List ℤ), perm4 s → pr s = true → s ∈ o1)
axiom pr1 : ℤ -> List ℤ -> Bool
axiom pr1'def (i1 : ℤ) (s : List ℤ) : (pr1 i1 s = true) = (s[(0 : ℕ)]! < i1)
axiom pr2 : ℤ -> ℤ -> List ℤ -> Bool
axiom pr2'def (i1 : ℤ) (i2 : ℤ) (s : List ℤ) : (pr2 i1 i2 s = true) = (pr1 i1 s = true ∨ s[(0 : ℕ)]! = i1 ∧ s[(1 : ℕ)]! < i2)
axiom pr3 : ℤ -> ℤ -> ℤ -> List ℤ -> Bool
axiom pr3'def (i1 : ℤ) (i2 : ℤ) (i3 : ℤ) (s : List ℤ) : (pr3 i1 i2 i3 s = true) = (pr2 i1 i2 s = true ∨ s[(0 : ℕ)]! = i1 ∧ s[(1 : ℕ)]! = i2 ∧ s[(2 : ℕ)]! < i3)
axiom fc : List ℤ -> Bool
axiom fc1 : List ℤ -> Bool
axiom fc'def (x : List ℤ) : fc x = true
axiom fc'def1 (x : List ℤ) : fc1 x = true
theorem anagrammi'vc : ((1 : ℤ) ≤ (4 : ℤ) + (1 : ℤ) → below ([] : List (List ℤ)) (pr1 (1 : ℤ)) ∧ (∀(output : List (List ℤ)), (∀(i1 : ℤ), ((1 : ℤ) ≤ i1 ∧ i1 ≤ (4 : ℤ)) ∧ below output (pr1 i1) → ((1 : ℤ) ≤ (4 : ℤ) + (1 : ℤ) → below output (pr2 i1 (1 : ℤ)) ∧ (∀(output1 : List (List ℤ)), (∀(i2 : ℤ), ((1 : ℤ) ≤ i2 ∧ i2 ≤ (4 : ℤ)) ∧ below output1 (pr2 i1 i2) → (if i2 = i1 then below output1 (pr2 i1 (i2 + (1 : ℤ))) else ((1 : ℤ) ≤ (4 : ℤ) + (1 : ℤ) → below output1 (pr3 i1 i2 (1 : ℤ)) ∧ (∀(output2 : List (List ℤ)), (∀(i3 : ℤ), ((1 : ℤ) ≤ i3 ∧ i3 ≤ (4 : ℤ)) ∧ below output2 (pr3 i1 i2 i3) → (if i3 = i1 then below output2 (pr3 i1 i2 (i3 + (1 : ℤ))) else if i3 = i2 then below output2 (pr3 i1 i2 (i3 + (1 : ℤ))) else let i4 : ℤ := (10 : ℤ) - (i1 + i2 + i3); let o1 : List ℤ := ([] : List ℤ); let o2 : List ℤ := List.cons i4 o1; Int.ofNat (List.length o2) = (1 : ℤ) + Int.ofNat (List.length o1) ∧ o2[(0 : ℕ)]! = i4 ∧ (∀(i : ℤ), (0 : ℤ) < i ∧ i ≤ Int.ofNat (List.length o1) → o2[Int.toNat i]! = o1[Int.toNat (i - (1 : ℤ))]!) → (let o3 : List ℤ := List.cons i3 o2; Int.ofNat (List.length o3) = (1 : ℤ) + Int.ofNat (List.length o2) ∧ o3[(0 : ℕ)]! = i3 ∧ (∀(i : ℤ), (0 : ℤ) < i ∧ i ≤ Int.ofNat (List.length o2) → o3[Int.toNat i]! = o2[Int.toNat (i - (1 : ℤ))]!) → (let o4 : List ℤ := List.cons i2 o3; Int.ofNat (List.length o4) = (1 : ℤ) + Int.ofNat (List.length o3) ∧ o4[(0 : ℕ)]! = i2 ∧ (∀(i : ℤ), (0 : ℤ) < i ∧ i ≤ Int.ofNat (List.length o3) → o4[Int.toNat i]! = o3[Int.toNat (i - (1 : ℤ))]!) → (let line1 : List ℤ := List.cons i1 o4; Int.ofNat (List.length line1) = (1 : ℤ) + Int.ofNat (List.length o4) ∧ line1[(0 : ℕ)]! = i1 ∧ (∀(i : ℤ), (0 : ℤ) < i ∧ i ≤ Int.ofNat (List.length o4) → line1[Int.toNat i]! = o4[Int.toNat (i - (1 : ℤ))]!) → (let o5 : List (List ℤ) := output2 ++ [line1]; Int.ofNat (List.length o5) = (1 : ℤ) + Int.ofNat (List.length output2) ∧ o5[List.length output2]! = line1 ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length output2) → o5[Int.toNat i]! = output2[Int.toNat i]!) → below o5 (pr3 i1 i2 (i3 + (1 : ℤ))))))))) ∧ (below output2 (pr3 i1 i2 ((4 : ℤ) + (1 : ℤ))) → below output2 (pr2 i1 (i2 + (1 : ℤ)))))) ∧ ((4 : ℤ) + (1 : ℤ) < (1 : ℤ) → below output1 (pr2 i1 (i2 + (1 : ℤ)))))) ∧ (below output1 (pr2 i1 ((4 : ℤ) + (1 : ℤ))) → below output1 (pr1 (i1 + (1 : ℤ)))))) ∧ ((4 : ℤ) + (1 : ℤ) < (1 : ℤ) → below output (pr1 (i1 + (1 : ℤ))))) ∧ (below output (pr1 ((4 : ℤ) + (1 : ℤ))) → below output fc))) ∧ ((4 : ℤ) + (1 : ℤ) < (1 : ℤ) → below ([] : List (List ℤ)) fc1)
  := sorry
end anagrammi_Top_anagrammiqtvc
