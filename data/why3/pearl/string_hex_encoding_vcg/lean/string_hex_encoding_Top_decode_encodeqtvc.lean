import Why3.Base
import Why3.why3.Ref.Ref
import Why3.string.StringBuffer
open Classical
open Lean4Why3
namespace string_hex_encoding_Top_decode_encodeqtvc
noncomputable def valid_hex_char (c : BitVec 8) := (48 : ℤ) ≤ BitVec.toInt c ∧ BitVec.toInt c < (58 : ℤ) ∨ (65 : ℤ) ≤ BitVec.toInt c ∧ BitVec.toInt c < (71 : ℤ)
noncomputable def hex (i : ℤ) := if (0 : ℤ) ≤ i ∧ i < (10 : ℤ) then BitVec.ofNat 8 (Int.toNat (i + (48 : ℤ))) else if (10 : ℤ) ≤ i ∧ i < (16 : ℤ) then BitVec.ofNat 8 (Int.toNat (i + (55 : ℤ))) else ([0] : List (BitVec 8))[(0 : ℕ)]!
noncomputable def xeh (c : BitVec 8) := if (48 : ℤ) ≤ BitVec.toInt c ∧ BitVec.toInt c < (58 : ℤ) then BitVec.toInt c - (48 : ℤ) else if (65 : ℤ) ≤ BitVec.toInt c ∧ BitVec.toInt c < (71 : ℤ) then BitVec.toInt c - (55 : ℤ) else -(1 : ℤ)
noncomputable def valid_hex (s : List (BitVec 8)) := Int.tmod (Int.ofNat (List.length s)) (2 : ℤ) = (0 : ℤ) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length s) → valid_hex_char (s[Int.toNat i]!))
noncomputable def encoding (s1 : List (BitVec 8)) (s2 : List (BitVec 8)) := Int.ofNat (List.length s2) = (2 : ℤ) * Int.ofNat (List.length s1) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length s1) → s1[Int.toNat i]! = BitVec.ofNat 8 (Int.toNat (xeh (s2[Int.toNat ((2 : ℤ) * i)]!) * (16 : ℤ) + xeh (s2[Int.toNat ((2 : ℤ) * i + (1 : ℤ))]!)))) ∧ valid_hex s2
theorem decode_encode'vc (s : List (BitVec 8)) (s1 : List (BitVec 8)) (fact0 : encoding s s1) : valid_hex s1
  := sorry
end string_hex_encoding_Top_decode_encodeqtvc
