import Why3.Base
import Why3.string.StringBuffer
open Classical
open Lean4Why3
namespace string_base64_encoding_Base64_eq_symbolqtvc
noncomputable def int2b64 (i : ℤ) := if (0 : ℤ) ≤ i ∧ i ≤ (25 : ℤ) then BitVec.ofNat 8 (Int.toNat (i + (65 : ℤ))) else if (26 : ℤ) ≤ i ∧ i ≤ (51 : ℤ) then BitVec.ofNat 8 (Int.toNat (i - (26 : ℤ) + (97 : ℤ))) else if (52 : ℤ) ≤ i ∧ i ≤ (61 : ℤ) then BitVec.ofNat 8 (Int.toNat (i - (52 : ℤ) + (48 : ℤ))) else if i = (62 : ℤ) then BitVec.ofNat 8 (43 : ℕ) else if i = (63 : ℤ) then BitVec.ofNat 8 (47 : ℕ) else BitVec.ofNat 8 (0 : ℕ)
theorem eq_symbol'vc : (0 : ℤ) ≤ (61 : ℤ) ∧ (61 : ℤ) < (256 : ℤ)
  := sorry
end string_base64_encoding_Base64_eq_symbolqtvc
