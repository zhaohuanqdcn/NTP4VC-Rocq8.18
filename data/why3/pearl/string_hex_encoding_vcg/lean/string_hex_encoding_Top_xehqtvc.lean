import Why3.Base
import Why3.string.StringBuffer
open Classical
open Lean4Why3
namespace string_hex_encoding_Top_xehqtvc
noncomputable def valid_hex_char (c : BitVec 8) := (48 : ℤ) ≤ BitVec.toInt c ∧ BitVec.toInt c < (58 : ℤ) ∨ (65 : ℤ) ≤ BitVec.toInt c ∧ BitVec.toInt c < (71 : ℤ)
noncomputable def hex (i : ℤ) := if (0 : ℤ) ≤ i ∧ i < (10 : ℤ) then BitVec.ofNat 8 (Int.toNat (i + (48 : ℤ))) else if (10 : ℤ) ≤ i ∧ i < (16 : ℤ) then BitVec.ofNat 8 (Int.toNat (i + (55 : ℤ))) else ([0] : List (BitVec 8))[(0 : ℕ)]!
noncomputable def xeh (c : BitVec 8) := if (48 : ℤ) ≤ BitVec.toInt c ∧ BitVec.toInt c < (58 : ℤ) then BitVec.toInt c - (48 : ℤ) else if (65 : ℤ) ≤ BitVec.toInt c ∧ BitVec.toInt c < (71 : ℤ) then BitVec.toInt c - (55 : ℤ) else -(1 : ℤ)
theorem xeh'vc (c : BitVec 8) (q1' : BitVec 63) (o1 : Bool) (fact0 : valid_hex_char c) (fact1 : BitVec.toInt q1' = BitVec.toInt c) (fact2 : if (48 : ℤ) ≤ BitVec.toInt q1' then o1 = (if BitVec.toInt q1' < (58 : ℤ) then true else false) else o1 = false) : (if o1 = true then ∀(o2 : BitVec 63), BitVec.toInt o2 = BitVec.toInt c → int'63_in_bounds (BitVec.toInt o2 - (48 : ℤ)) else ∀(o2 : BitVec 63), BitVec.toInt o2 = BitVec.toInt c → int'63_in_bounds (BitVec.toInt o2 - (55 : ℤ))) ∧ (∀(result : BitVec 63), (if o1 = true then ∃(o2 : BitVec 63), BitVec.toInt o2 = BitVec.toInt c ∧ BitVec.toInt result = BitVec.toInt o2 - (48 : ℤ) else ∃(o2 : BitVec 63), BitVec.toInt o2 = BitVec.toInt c ∧ BitVec.toInt result = BitVec.toInt o2 - (55 : ℤ)) → BitVec.toInt result = xeh c)
  := sorry
end string_hex_encoding_Top_xehqtvc
