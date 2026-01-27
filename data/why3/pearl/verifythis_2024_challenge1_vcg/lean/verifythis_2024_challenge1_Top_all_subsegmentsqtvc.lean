import Why3.Base
open Classical
open Lean4Why3
namespace verifythis_2024_challenge1_Top_all_subsegmentsqtvc
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
theorem all_subsegments'vc (k : ℤ) (l : ℤ) (src : List elt) (start : ℤ) (dst : List elt) (sigma : List ℤ) (invsigma : List ℤ) (fact0 : (0 : ℤ) < k) (fact1 : (0 : ℤ) < l) (fact2 : valid_chunk src start (k * l)) (fact3 : List.length dst = List.length src) (fact4 : ∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < l → copy src dst (start + sigma[Int.toNat j]! * k) k) (fact5 : permutation_pair l sigma invsigma) : copy src dst start (k * l)
  := sorry
end verifythis_2024_challenge1_Top_all_subsegmentsqtvc
