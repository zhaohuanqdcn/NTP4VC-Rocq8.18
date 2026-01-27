import Why3.Base
import Why3.string.StringBuffer
open Classical
open Lean4Why3
namespace string_base64_encoding_Base64_int2b64_valid_4_charqtvc
noncomputable def int2b64 (i : ℤ) := if (0 : ℤ) ≤ i ∧ i ≤ (25 : ℤ) then BitVec.ofNat 8 (Int.toNat (i + (65 : ℤ))) else if (26 : ℤ) ≤ i ∧ i ≤ (51 : ℤ) then BitVec.ofNat 8 (Int.toNat (i - (26 : ℤ) + (97 : ℤ))) else if (52 : ℤ) ≤ i ∧ i ≤ (61 : ℤ) then BitVec.ofNat 8 (Int.toNat (i - (52 : ℤ) + (48 : ℤ))) else if i = (62 : ℤ) then BitVec.ofNat 8 (43 : ℕ) else if i = (63 : ℤ) then BitVec.ofNat 8 (47 : ℕ) else BitVec.ofNat 8 (0 : ℕ)
noncomputable def valid_b64_char (c : BitVec 8) := (65 : ℤ) ≤ BitVec.toInt c ∧ BitVec.toInt c ≤ (90 : ℤ) ∨ (97 : ℤ) ≤ BitVec.toInt c ∧ BitVec.toInt c ≤ (122 : ℤ) ∨ (48 : ℤ) ≤ BitVec.toInt c ∧ BitVec.toInt c ≤ (57 : ℤ) ∨ BitVec.toInt c = (43 : ℤ) ∨ BitVec.toInt c = (47 : ℤ)
theorem int2b64_valid_4_char'vc (i : ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : i < (64 : ℤ)) : valid_b64_char (int2b64 i)
  := sorry
end string_base64_encoding_Base64_int2b64_valid_4_charqtvc
