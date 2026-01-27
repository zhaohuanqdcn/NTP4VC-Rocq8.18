import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.x509_parser.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace parse_ext_AKI_Why3_ide_VCparse_ext_AKI_call_parse_CertificateSerialNumber_pre_part2_goal4
theorem goal4 (a_1 : Memory.addr) (a : Memory.addr) (i_3 : ℤ) (i : ℤ) (i_2 : ℤ) (i_1 : ℤ) (t : ℤ -> ℤ) : let x : ℤ := Memory.addr.base a_1; let x_1 : ℤ := Memory.addr.base a; let a_2 : Memory.addr := Memory.shift a_1 i_3; let x_2 : ℤ := i + i_3; let a_3 : Memory.addr := Memory.shift a_1 x_2; let x_4 : ℤ := i_2 - i_3; let x_5 : ℤ := i_2 - i - i_3; ¬i_2 = (0 : ℤ) → ¬i_3 = i_2 → ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_1 → ¬x = x_1 → ¬a_2 = Memory.addr.mk (0 : ℤ) (0 : ℤ) → ¬a_3 = Memory.addr.mk (0 : ℤ) (0 : ℤ) → i_1 < (0 : ℤ) → (0 : ℤ) ≤ i_2 → i_3 ≤ i_2 → (0 : ℤ) ≤ i_3 → x_2 < i_2 → Memory.region x_1 ≤ (0 : ℤ) → Memory.region x ≤ (0 : ℤ) → -(2147483648 : ℤ) ≤ i_2 → (2 : ℤ) ≤ i → (2 : ℤ) ≤ i_3 → i_2 ≤ (2147483647 : ℤ) → x_2 ≤ (2147483648 : ℤ) + i_2 → i_2 ≤ (65535 : ℤ) + i + i_3 → i_2 ≤ (2147483647 : ℤ) + i + i_3 → Memory.linked t → Cint.is_uint16 i → Cint.is_uint16 i_2 → Cint.is_uint16 i_3 → Cint.is_sint32 i_1 → Memory.valid_rw t a (15 : ℤ) → Cint.is_uint16 x_4 → Cint.is_uint16 x_5 → ((0 : ℤ) < i_2 → Memory.valid_rd t (Memory.shift a_1 (0 : ℤ)) i_2) → (i_3 < i_2 → Memory.valid_rd t a_2 x_4) → Memory.valid_rd t a_3 x_5
  := sorry
end parse_ext_AKI_Why3_ide_VCparse_ext_AKI_call_parse_CertificateSerialNumber_pre_part2_goal4
