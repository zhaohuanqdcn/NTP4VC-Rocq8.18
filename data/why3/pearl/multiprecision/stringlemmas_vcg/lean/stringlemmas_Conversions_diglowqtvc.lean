import Why3.Base
import Why3.why3.Ref.Ref
import Why3.map.Const
import Why3.map.MapEq
import pearl.multiprecision.lib.lean.lemmas.Lemmas
import Why3.mach.int.Unsigned
import Why3.mach.c.C
import Why3.mach.c.String
import Why3.mach.c.UChar
import pearl.multiprecision.lib.lean.types.Config
import pearl.multiprecision.lib.lean.types.Types
import pearl.multiprecision.lib.lean.types.Int32Eq
import pearl.multiprecision.lib.lean.types.UInt64Eq
open Classical
open Lean4Why3
namespace stringlemmas_Conversions_diglowqtvc
noncomputable def num_to_lowercase_text (d : BitVec 8) := if (0 : ℤ) ≤ BitVec.toInt d ∧ BitVec.toInt d < (36 : ℤ) then ([48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122] : List (BitVec 8))[Int.toNat (BitVec.toInt d)]! else BitVec.ofNat 8 (Int.toNat (-(1 : ℤ)))
noncomputable def to_lowercase_text (d : ℤ -> BitVec 8) (t : ℤ -> BitVec 8) (m : ℤ) (n : ℤ) := ∀(i : ℤ), n ≤ i ∧ i < m → t i = num_to_lowercase_text (d i)
noncomputable def num_to_uppercase_text (d : BitVec 8) := if (0 : ℤ) ≤ BitVec.toInt d ∧ BitVec.toInt d < (36 : ℤ) then ([48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90] : List (BitVec 8))[Int.toNat (BitVec.toInt d)]! else BitVec.ofNat 8 (Int.toNat (-(1 : ℤ)))
noncomputable def to_uppercase_text (d : ℤ -> BitVec 8) (t : ℤ -> BitVec 8) (m : ℤ) (n : ℤ) := ∀(i : ℤ), n ≤ i ∧ i < m → t i = num_to_uppercase_text (d i)
noncomputable def num_to_bothcase_text (d : BitVec 8) := if (0 : ℤ) ≤ BitVec.toInt d ∧ BitVec.toInt d < (62 : ℤ) then ([48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122] : List (BitVec 8))[Int.toNat (BitVec.toInt d)]! else BitVec.ofNat 8 (Int.toNat (-(1 : ℤ)))
noncomputable def to_bothcase_text (d : ℤ -> BitVec 8) (t : ℤ -> BitVec 8) (m : ℤ) (n : ℤ) := ∀(i : ℤ), n ≤ i ∧ i < m → t i = num_to_bothcase_text (d i)
noncomputable def text_to_num_onecase (c : BitVec 8) := if BitVec.toInt (([48] : List (BitVec 8))[(0 : ℕ)]!) ≤ BitVec.toInt c ∧ BitVec.toInt c ≤ BitVec.toInt (([57] : List (BitVec 8))[(0 : ℕ)]!) then BitVec.toInt c - BitVec.toInt (([48] : List (BitVec 8))[(0 : ℕ)]!) else if BitVec.toInt (([97] : List (BitVec 8))[(0 : ℕ)]!) ≤ BitVec.toInt c ∧ BitVec.toInt c ≤ BitVec.toInt (([122] : List (BitVec 8))[(0 : ℕ)]!) then BitVec.toInt c - BitVec.toInt (([97] : List (BitVec 8))[(0 : ℕ)]!) + (10 : ℤ) else if BitVec.toInt (([65] : List (BitVec 8))[(0 : ℕ)]!) ≤ BitVec.toInt c ∧ BitVec.toInt c ≤ BitVec.toInt (([90] : List (BitVec 8))[(0 : ℕ)]!) then BitVec.toInt c - BitVec.toInt (([65] : List (BitVec 8))[(0 : ℕ)]!) + (10 : ℤ) else -(1 : ℤ)
noncomputable def text_to_num_bothcase (c : BitVec 8) := if BitVec.toInt (([48] : List (BitVec 8))[(0 : ℕ)]!) ≤ BitVec.toInt c ∧ BitVec.toInt c ≤ BitVec.toInt (([57] : List (BitVec 8))[(0 : ℕ)]!) then BitVec.toInt c - BitVec.toInt (([48] : List (BitVec 8))[(0 : ℕ)]!) else if BitVec.toInt (([97] : List (BitVec 8))[(0 : ℕ)]!) ≤ BitVec.toInt c ∧ BitVec.toInt c ≤ BitVec.toInt (([122] : List (BitVec 8))[(0 : ℕ)]!) then BitVec.toInt c - BitVec.toInt (([97] : List (BitVec 8))[(0 : ℕ)]!) + (36 : ℤ) else if BitVec.toInt (([65] : List (BitVec 8))[(0 : ℕ)]!) ≤ BitVec.toInt c ∧ BitVec.toInt c ≤ BitVec.toInt (([90] : List (BitVec 8))[(0 : ℕ)]!) then BitVec.toInt c - BitVec.toInt (([65] : List (BitVec 8))[(0 : ℕ)]!) + (10 : ℤ) else -(1 : ℤ)
noncomputable def text_to_num (base : ℤ) (c : BitVec 8) := if -(36 : ℤ) ≤ base ∧ base ≤ (36 : ℤ) then text_to_num_onecase c else text_to_num_bothcase c
noncomputable def num_to_text (base : ℤ) (d : BitVec 8) := if (0 : ℤ) ≤ base ∧ base ≤ (36 : ℤ) then num_to_lowercase_text d else if (36 : ℤ) < base ∧ base ≤ (62 : ℤ) then num_to_bothcase_text d else if -(36 : ℤ) ≤ base then num_to_uppercase_text d else BitVec.ofNat 8 (Int.toNat (-(1 : ℤ)))
noncomputable def to_num (base : ℤ) (t : ℤ -> BitVec 8) (d : ℤ -> BitVec 8) (n : ℤ) (m : ℤ) := ∀(i : ℤ), n ≤ i ∧ i < m → BitVec.toInt (d i) = text_to_num base (t i)
theorem diglow'vc : BitVec.toInt (([57] : List (BitVec 8))[(0 : ℕ)]!) < BitVec.toInt (([97] : List (BitVec 8))[(0 : ℕ)]!)
  := sorry
end stringlemmas_Conversions_diglowqtvc
