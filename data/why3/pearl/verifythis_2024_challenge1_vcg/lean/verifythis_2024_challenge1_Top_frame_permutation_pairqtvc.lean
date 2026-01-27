import Why3.Base
open Classical
open Lean4Why3
namespace verifythis_2024_challenge1_Top_frame_permutation_pairqtvc
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
noncomputable def frame {α : Type} [Inhabited α] (a1 : List α) (a2 : List α) (ofs : ℤ) (len : ℤ) := List.length a2 = List.length a1 ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < ofs → a2[Int.toNat i]! = a1[Int.toNat i]!) ∧ (∀(i : ℤ), ofs + len ≤ i ∧ i < Int.ofNat (List.length a2) → a2[Int.toNat i]! = a1[Int.toNat i]!)
theorem frame_permutation_pair'vc (op : List ℤ) (p : List ℤ) (oinvp : List ℤ) (invp : List ℤ) (start : ℤ) (start1 : ℤ) (k : ℤ) (start2 : ℤ) (fact0 : List.length op = List.length p) (fact1 : List.length p = List.length oinvp) (fact2 : List.length oinvp = List.length invp) (fact3 : (0 : ℤ) ≤ start) (fact4 : start ≤ start1) (fact5 : start1 ≤ start1 + k) (fact6 : start1 + k ≤ Int.ofNat (List.length p)) (fact7 : (0 : ℤ) ≤ start) (fact8 : start ≤ start2) (fact9 : start2 ≤ start2 + k) (fact10 : start2 + k ≤ Int.ofNat (List.length p)) (fact11 : permutation_pair start op oinvp) (fact12 : frame op p start1 k) (fact13 : frame oinvp invp start2 k) : permutation_pair start p invp
  := sorry
end verifythis_2024_challenge1_Top_frame_permutation_pairqtvc
