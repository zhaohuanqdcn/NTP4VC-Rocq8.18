import Why3.Base
open Classical
open Lean4Why3
namespace verifythis_2024_challenge1_Top_copy_chunkqtvc
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
theorem copy_chunk'vc (src : List elt) (dst : List elt) (ofss : ℤ) (len : ℤ) (ofsd : ℤ) (fact0 : List.length src = List.length dst) (fact1 : valid_chunk src ofss len) (fact2 : valid_chunk dst ofsd len) : let o1 : ℤ := len - (1 : ℤ); ((0 : ℤ) ≤ o1 + (1 : ℤ) → copy_to src dst ofss ofsd (0 : ℤ) ∧ (∀(dst1 : List elt), List.length dst1 = List.length dst → (∀(i : ℤ), ((0 : ℤ) ≤ i ∧ i ≤ o1) ∧ copy_to src dst1 ofss ofsd i ∧ (∀(i1 : ℤ), (0 : ℤ) ≤ i1 ∧ i1 < ofsd → dst1[Int.toNat i1]! = dst[Int.toNat i1]!) ∧ (∀(i1 : ℤ), ofsd + len ≤ i1 ∧ i1 < Int.ofNat (List.length dst1) → dst1[Int.toNat i1]! = dst[Int.toNat i1]!) → (let o2 : ℤ := ofss + i; ((0 : ℤ) ≤ o2 ∧ o2 < Int.ofNat (List.length src)) ∧ (let o3 : elt := src[Int.toNat o2]!; let o4 : ℤ := ofsd + i; ((0 : ℤ) ≤ o4 ∧ o4 < Int.ofNat (List.length dst1)) ∧ (List.length (List.set dst1 (Int.toNat o4) o3) = List.length dst1 → getElem! (List.set dst1 (Int.toNat o4) o3) ∘ Int.toNat = Function.update (getElem! dst1 ∘ Int.toNat) o4 o3 → copy_to src (List.set dst1 (Int.toNat o4) o3) ofss ofsd (i + (1 : ℤ)) ∧ (∀(i1 : ℤ), (0 : ℤ) ≤ i1 ∧ i1 < ofsd → (List.set dst1 (Int.toNat o4) o3)[Int.toNat i1]! = dst[Int.toNat i1]!) ∧ (∀(i1 : ℤ), ofsd + len ≤ i1 ∧ i1 < Int.ofNat (List.length (List.set dst1 (Int.toNat o4) o3)) → (List.set dst1 (Int.toNat o4) o3)[Int.toNat i1]! = dst[Int.toNat i1]!))))) ∧ (copy_to src dst1 ofss ofsd (o1 + (1 : ℤ)) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < ofsd → dst1[Int.toNat i]! = dst[Int.toNat i]!) ∧ (∀(i : ℤ), ofsd + len ≤ i ∧ i < Int.ofNat (List.length dst1) → dst1[Int.toNat i]! = dst[Int.toNat i]!) → copy_to src dst1 ofss ofsd len ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < ofsd → dst1[Int.toNat i]! = dst[Int.toNat i]!) ∧ (∀(i : ℤ), ofsd + len ≤ i ∧ i < Int.ofNat (List.length dst1) → dst1[Int.toNat i]! = dst[Int.toNat i]!)))) ∧ (o1 + (1 : ℤ) < (0 : ℤ) → copy_to src dst ofss ofsd len)
  := sorry
end verifythis_2024_challenge1_Top_copy_chunkqtvc
