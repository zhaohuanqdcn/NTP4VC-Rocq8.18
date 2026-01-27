import Why3.Base
import Why3.string.StringBuffer
open Classical
open Lean4Why3
namespace string_base64_encoding_Base64_b642int_int2b64qtvc
noncomputable def int2b64 (i : ℤ) := if (0 : ℤ) ≤ i ∧ i ≤ (25 : ℤ) then BitVec.ofNat 8 (Int.toNat (i + (65 : ℤ))) else if (26 : ℤ) ≤ i ∧ i ≤ (51 : ℤ) then BitVec.ofNat 8 (Int.toNat (i - (26 : ℤ) + (97 : ℤ))) else if (52 : ℤ) ≤ i ∧ i ≤ (61 : ℤ) then BitVec.ofNat 8 (Int.toNat (i - (52 : ℤ) + (48 : ℤ))) else if i = (62 : ℤ) then BitVec.ofNat 8 (43 : ℕ) else if i = (63 : ℤ) then BitVec.ofNat 8 (47 : ℕ) else BitVec.ofNat 8 (0 : ℕ)
noncomputable def valid_b64_char (c : BitVec 8) := (65 : ℤ) ≤ BitVec.toInt c ∧ BitVec.toInt c ≤ (90 : ℤ) ∨ (97 : ℤ) ≤ BitVec.toInt c ∧ BitVec.toInt c ≤ (122 : ℤ) ∨ (48 : ℤ) ≤ BitVec.toInt c ∧ BitVec.toInt c ≤ (57 : ℤ) ∨ BitVec.toInt c = (43 : ℤ) ∨ BitVec.toInt c = (47 : ℤ)
noncomputable def b642int (c : BitVec 8) := if (65 : ℤ) ≤ BitVec.toInt c ∧ BitVec.toInt c ≤ (90 : ℤ) then BitVec.toInt c - (65 : ℤ) else if (97 : ℤ) ≤ BitVec.toInt c ∧ BitVec.toInt c ≤ (122 : ℤ) then BitVec.toInt c - (97 : ℤ) + (26 : ℤ) else if (48 : ℤ) ≤ BitVec.toInt c ∧ BitVec.toInt c ≤ (57 : ℤ) then BitVec.toInt c - (48 : ℤ) + (52 : ℤ) else if BitVec.toInt c = (43 : ℤ) then (62 : ℤ) else if BitVec.toInt c = (47 : ℤ) then (63 : ℤ) else if c = BitVec.ofNat 8 (Int.toNat (BitVec.toInt (61 : BitVec 63))) then (0 : ℤ) else (64 : ℤ)
theorem b642int_int2b64'vc (i : ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : i < (64 : ℤ)) : b642int (int2b64 i) = i
  := sorry
end string_base64_encoding_Base64_b642int_int2b64qtvc
