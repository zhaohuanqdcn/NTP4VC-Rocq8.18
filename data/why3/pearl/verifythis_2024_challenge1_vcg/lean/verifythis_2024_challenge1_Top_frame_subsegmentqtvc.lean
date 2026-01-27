import Why3.Base
open Classical
open Lean4Why3
namespace verifythis_2024_challenge1_Top_frame_subsegmentqtvc
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
theorem frame_subsegment'vc (k : ℤ) (l : ℤ) (s : ℤ) (j1 : ℤ) (j2 : ℤ) (op : List ℤ) (p : List ℤ) (oinvp : List ℤ) (invp : List ℤ) (sigma : List ℤ) (tau : List ℤ) (src : List elt) (odst : List elt) (dst : List elt) (fact0 : (0 : ℤ) < k) (fact1 : (0 : ℤ) < l) (fact2 : (0 : ℤ) ≤ s) (fact3 : (0 : ℤ) ≤ j1) (fact4 : j1 < l) (fact5 : (0 : ℤ) ≤ j2) (fact6 : j2 < l) (fact7 : ¬j1 = j2) (fact8 : List.length op = List.length p) (fact9 : List.length p = List.length oinvp) (fact10 : List.length oinvp = List.length invp) (fact11 : (s + (1 : ℤ)) * (k * l) ≤ Int.ofNat (List.length invp)) (fact12 : permutation l sigma) (fact13 : permutation l tau) (fact14 : copy_subsegment src odst s k l j1 sigma tau op oinvp) (fact15 : frame odst dst (s * (k * l) + tau[Int.toNat (sigma[Int.toNat j2]!)]! * k) k) (fact16 : frame op p (s * (k * l) + tau[Int.toNat (sigma[Int.toNat j2]!)]! * k) k) (fact17 : frame oinvp invp (s * (k * l) + sigma[Int.toNat j2]! * k) k) : copy_subsegment src dst s k l j1 sigma tau p invp
  := sorry
end verifythis_2024_challenge1_Top_frame_subsegmentqtvc
