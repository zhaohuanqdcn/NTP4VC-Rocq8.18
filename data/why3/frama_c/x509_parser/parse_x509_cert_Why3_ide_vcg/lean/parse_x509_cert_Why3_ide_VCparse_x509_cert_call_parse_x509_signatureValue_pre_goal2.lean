import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.x509_parser.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace parse_x509_cert_Why3_ide_VCparse_x509_cert_call_parse_x509_signatureValue_pre_goal2
theorem goal2 (a_1 : Memory.addr) (i_2 : ℤ) (i_1 : ℤ) (i : ℤ) (i_3 : ℤ) (a : Memory.addr) (t : ℤ -> ℤ) : let x : ℤ := Memory.addr.base a_1; let a_2 : Memory.addr := Memory.shift a_1 i_2; let a_3 : Memory.addr := Memory.shift a_1 (i_1 - i); let a_4 : Memory.addr := Memory.shift a_1 (i_1 + i_3 - i); let x_2 : ℤ := i - i_3; let x_4 : ℤ := i_1 - i_2; ¬i = (0 : ℤ) → ¬i_1 = (0 : ℤ) → ¬i_2 = i_1 → ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_1 → ¬x = Memory.addr.base a → ¬a_2 = Memory.addr.mk (0 : ℤ) (0 : ℤ) → ¬a_3 = Memory.addr.mk (0 : ℤ) (0 : ℤ) → ¬a_4 = Memory.addr.mk (0 : ℤ) (0 : ℤ) → (0 : ℤ) ≤ i → (0 : ℤ) ≤ i_1 → i_2 ≤ i_1 → (0 : ℤ) ≤ i_2 → i_3 < i → Memory.region x ≤ (0 : ℤ) → -(2147483648 : ℤ) ≤ i → (2 : ℤ) ≤ i_2 → (2 : ℤ) ≤ i_3 → i ≤ (65535 : ℤ) → i ≤ (2147483647 : ℤ) → i ≤ (65535 : ℤ) + i_3 → i ≤ (2147483647 : ℤ) + i_3 → i_1 ≤ (65535 : ℤ) + i_2 → i_1 ≤ (2147483647 : ℤ) + i_2 → i_2 ≤ (2147483648 : ℤ) + i_1 → i_3 ≤ (2147483648 : ℤ) + i → (2 : ℤ) + i + i_2 ≤ i_1 → Memory.linked t → Cint.is_uint16 i → Cint.is_uint16 i_1 → Cint.is_uint16 i_2 → Cint.is_uint16 i_3 → Cint.is_uint16 x_2 → Cint.is_uint16 x_4 → Cint.is_uint16 (i_1 - i - i_2) → ((0 : ℤ) < i_1 → Memory.valid_rd t (Memory.shift a_1 (0 : ℤ)) i_1) → (i_2 < i_1 → Memory.valid_rd t a_2 x_4) → ((0 : ℤ) < i → Memory.valid_rd t a_3 i) → Memory.valid_rd t a_4 x_2
  := sorry
end parse_x509_cert_Why3_ide_VCparse_x509_cert_call_parse_x509_signatureValue_pre_goal2
