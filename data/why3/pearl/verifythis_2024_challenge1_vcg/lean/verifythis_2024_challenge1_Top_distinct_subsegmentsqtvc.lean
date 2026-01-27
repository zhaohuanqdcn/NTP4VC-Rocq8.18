import Why3.Base
open Classical
open Lean4Why3
namespace verifythis_2024_challenge1_Top_distinct_subsegmentsqtvc
noncomputable def permutation (l : ℤ) (p : List ℤ) := ((0 : ℤ) ≤ l ∧ l ≤ Int.ofNat (List.length p)) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < l → (0 : ℤ) ≤ p[Int.toNat i]! ∧ p[Int.toNat i]! < l) ∧ (∀(i : ℤ) (j : ℤ), (0 : ℤ) ≤ i ∧ i < l → (0 : ℤ) ≤ j ∧ j < l → ¬i = j → ¬p[Int.toNat i]! = p[Int.toNat j]!)
noncomputable def permutation_pair (l : ℤ) (p : List ℤ) (invp : List ℤ) := permutation l p ∧ permutation l invp ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < l → p[Int.toNat (invp[Int.toNat i]!)]! = i) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < l → invp[Int.toNat (p[Int.toNat i]!)]! = i)
axiom identity : ℤ -> List ℤ
axiom identity'spec'1 (l : ℤ) (fact0 : (0 : ℤ) < l) : Int.ofNat (List.length (identity l)) = l
axiom identity'spec'0 (l : ℤ) (i : ℤ) (fact0 : (0 : ℤ) < l) (fact1 : (0 : ℤ) ≤ i) (fact2 : i < l) : (identity l)[Int.toNat i]! = i
axiom identity'spec (l : ℤ) (fact0 : (0 : ℤ) < l) : permutation_pair l (identity l) (identity l)
axiom elt : Type
axiom inhabited_axiom_elt : Inhabited elt
attribute [instance] inhabited_axiom_elt
noncomputable def valid_chunk (a : List elt) (ofs : ℤ) (len : ℤ) := (0 : ℤ) ≤ ofs ∧ ofs ≤ ofs + len ∧ ofs + len ≤ Int.ofNat (List.length a)
noncomputable def copy (src : List elt) (dst : List elt) (ofs : ℤ) (len : ℤ) := valid_chunk src ofs len ∧ List.length src = List.length dst ∧ (∀(i : ℤ), ofs ≤ i ∧ i < ofs + len → dst[Int.toNat i]! = src[Int.toNat i]!)
noncomputable def copy_to (src : List elt) (dst : List elt) (ofss : ℤ) (ofsd : ℤ) (len : ℤ) := valid_chunk src ofss len ∧ valid_chunk dst ofsd len ∧ List.length src = List.length dst ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < len → dst[Int.toNat (ofsd + i)]! = src[Int.toNat (ofss + i)]!) ∧ (∀(i : ℤ), ofsd ≤ i ∧ i < ofsd + len → dst[Int.toNat i]! = src[Int.toNat (i + (ofss - ofsd))]!)
noncomputable def copy_perm (src : List elt) (dst : List elt) (size : ℤ) (p : List ℤ) (invp : List ℤ) := valid_chunk src (0 : ℤ) size ∧ List.length src = List.length dst ∧ permutation_pair size p invp ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < size → (0 : ℤ) ≤ p[Int.toNat i]! ∧ p[Int.toNat i]! < size) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < size → (0 : ℤ) ≤ invp[Int.toNat i]! ∧ invp[Int.toNat i]! < size) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < size → dst[Int.toNat i]! = src[Int.toNat (p[Int.toNat i]!)]!) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < size → src[Int.toNat i]! = dst[Int.toNat (invp[Int.toNat i]!)]!)
noncomputable def copy_subsegment (src : List elt) (dst : List elt) (s : ℤ) (k : ℤ) (l : ℤ) (j : ℤ) (sigma : List ℤ) (tau : List ℤ) (p : List ℤ) (invp : List ℤ) := let start : ℤ := s * (k * l); let starts : ℤ := start + sigma[Int.toNat j]! * k; let startd : ℤ := start + tau[Int.toNat (sigma[Int.toNat j]!)]! * k; copy_to src dst starts startd k ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < k → p[Int.toNat (startd + i)]! = starts + i) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < k → invp[Int.toNat (starts + i)]! = startd + i)
theorem distinct_subsegments'vc (k : ℤ) (l : ℤ) (s : ℤ) (j1 : ℤ) (j2 : ℤ) (sigma : List ℤ) (tau : List ℤ) (fact0 : (0 : ℤ) < k) (fact1 : (0 : ℤ) < l) (fact2 : (0 : ℤ) ≤ s) (fact3 : (0 : ℤ) ≤ j1) (fact4 : j1 < l) (fact5 : (0 : ℤ) ≤ j2) (fact6 : j2 < l) (fact7 : ¬j1 = j2) (fact8 : permutation l sigma) (fact9 : permutation l tau) : let start : ℤ := s * (k * l); ∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < k → ¬start + sigma[Int.toNat j1]! * k + i = start + sigma[Int.toNat j2]! * k + i ∧ ¬start + tau[Int.toNat (sigma[Int.toNat j1]!)]! * k + i = start + tau[Int.toNat (sigma[Int.toNat j2]!)]! * k + i
  := sorry
end verifythis_2024_challenge1_Top_distinct_subsegmentsqtvc
