import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.x509_parser.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace parse_ext_nameConstraints_Why3_ide_VCparse_ext_nameConstraints_call_parse_GeneralSubtrees_pre_____2_goal4
theorem goal4 (a_1 : Memory.addr) (a : Memory.addr) (i_3 : ℤ) (i_4 : ℤ) (i : ℤ) (i_2 : ℤ) (i_6 : ℤ) (i_5 : ℤ) (i_1 : ℤ) (t : ℤ -> ℤ) : let x : ℤ := Memory.addr.base a_1; let x_1 : ℤ := Memory.addr.base a; let a_2 : Memory.addr := Memory.shift a_1 i_3; let a_3 : Memory.addr := Memory.shift a_1 (i_3 + i_4); ¬i = (0 : ℤ) → ¬i_2 = (0 : ℤ) → ¬i_6 = (0 : ℤ) → ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_1 → ¬x = x_1 → ¬a_2 = Memory.addr.mk (0 : ℤ) (0 : ℤ) → ¬a_3 = Memory.addr.mk (0 : ℤ) (0 : ℤ) → (0 : ℤ) < i_5 → (0 : ℤ) ≤ i → i_4 ≤ i → i_5 ≤ i → i_1 < (0 : ℤ) → (0 : ℤ) ≤ i_2 → i ≤ i_2 → i_3 ≤ i_2 → i_4 + i_5 ≤ i → i + i_3 ≤ i_2 → Memory.region x_1 ≤ (0 : ℤ) → Memory.region x ≤ (0 : ℤ) → (2 : ℤ) ≤ i_3 → (2 : ℤ) ≤ i_4 → i ≤ (65535 : ℤ) + i_4 → i ≤ (2147483647 : ℤ) + i_4 → i_4 ≤ (2147483648 : ℤ) + i → Memory.linked t → Cint.is_uint16 i → Cint.is_uint16 i_2 → Cint.is_uint16 i_3 → Cint.is_uint16 i_4 → Cint.is_uint16 i_5 → Cint.is_sint32 i_1 → Cint.is_sint32 i_6 → Memory.valid_rw t a (15 : ℤ) → ((0 : ℤ) < i_2 → Memory.valid_rd t (Memory.shift a_1 (0 : ℤ)) i_2) → ((0 : ℤ) < i → Memory.valid_rd t a_2 i) → Memory.valid_rd t a_3 i_5
  := sorry
end parse_ext_nameConstraints_Why3_ide_VCparse_ext_nameConstraints_call_parse_GeneralSubtrees_pre_____2_goal4
