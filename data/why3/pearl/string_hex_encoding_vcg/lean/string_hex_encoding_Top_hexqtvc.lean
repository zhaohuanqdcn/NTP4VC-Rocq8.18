import Why3.Base
import Why3.string.StringBuffer
open Classical
open Lean4Why3
namespace string_hex_encoding_Top_hexqtvc
noncomputable def valid_hex_char (c : BitVec 8) := (48 : ℤ) ≤ BitVec.toInt c ∧ BitVec.toInt c < (58 : ℤ) ∨ (65 : ℤ) ≤ BitVec.toInt c ∧ BitVec.toInt c < (71 : ℤ)
noncomputable def hex (i : ℤ) := if (0 : ℤ) ≤ i ∧ i < (10 : ℤ) then BitVec.ofNat 8 (Int.toNat (i + (48 : ℤ))) else if (10 : ℤ) ≤ i ∧ i < (16 : ℤ) then BitVec.ofNat 8 (Int.toNat (i + (55 : ℤ))) else ([0] : List (BitVec 8))[(0 : ℕ)]!
theorem hex'vc (i : BitVec 63) (fact0 : (0 : ℤ) ≤ BitVec.toInt i) (fact1 : BitVec.toInt i < (16 : ℤ)) : (if BitVec.toInt i < (10 : ℤ) then int'63_in_bounds (BitVec.toInt i + (48 : ℤ)) ∧ (∀(o1 : BitVec 63), BitVec.toInt o1 = BitVec.toInt i + (48 : ℤ) → (0 : ℤ) ≤ BitVec.toInt o1 ∧ BitVec.toInt o1 < (256 : ℤ)) else int'63_in_bounds (BitVec.toInt i + (55 : ℤ)) ∧ (∀(o1 : BitVec 63), BitVec.toInt o1 = BitVec.toInt i + (55 : ℤ) → (0 : ℤ) ≤ BitVec.toInt o1 ∧ BitVec.toInt o1 < (256 : ℤ))) ∧ (∀(result : BitVec 8), (if BitVec.toInt i < (10 : ℤ) then ∃(o1 : BitVec 63), BitVec.toInt o1 = BitVec.toInt i + (48 : ℤ) ∧ result = BitVec.ofNat 8 (Int.toNat (BitVec.toInt o1)) else ∃(o1 : BitVec 63), BitVec.toInt o1 = BitVec.toInt i + (55 : ℤ) ∧ result = BitVec.ofNat 8 (Int.toNat (BitVec.toInt o1))) → result = hex (BitVec.toInt i))
  := sorry
end string_hex_encoding_Top_hexqtvc
