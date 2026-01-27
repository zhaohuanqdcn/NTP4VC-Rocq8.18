import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.x509_parser.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace parse_x509_cert_Why3_ide_VCparse_x509_cert_call_parse_x509_signatureAlgorithm_pre_goal1
theorem goal1 (a : Memory.addr) (i_1 : ℤ) (i_2 : ℤ) (i : ℤ) (t : ℤ -> ℤ) : let a_1 : Memory.addr := Memory.shift a i_1; let x : ℤ := i_1 + i_2; let a_2 : Memory.addr := Memory.shift a x; let x_1 : ℤ := (2147483648 : ℤ) + i; let x_3 : ℤ := i - i_1; let x_4 : ℤ := i - i_1 - i_2; ¬i = (0 : ℤ) → ¬i_1 = i → ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a → ¬a_1 = Memory.addr.mk (0 : ℤ) (0 : ℤ) → ¬a_2 = Memory.addr.mk (0 : ℤ) (0 : ℤ) → (0 : ℤ) ≤ i → i_1 ≤ i → (0 : ℤ) ≤ i_1 → x < i → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → (2 : ℤ) ≤ i_1 → (2 : ℤ) ≤ i_2 → i ≤ (65535 : ℤ) + i_1 → i ≤ (2147483647 : ℤ) + i_1 → i_1 ≤ x_1 → x ≤ x_1 → i ≤ (65535 : ℤ) + i_1 + i_2 → i ≤ (2147483647 : ℤ) + i_1 + i_2 → Memory.linked t → Cint.is_uint16 i → Cint.is_uint16 i_1 → Cint.is_uint16 i_2 → Cint.is_uint16 x_3 → Cint.is_uint16 x_4 → ((0 : ℤ) < i → Memory.valid_rd t (Memory.shift a (0 : ℤ)) i) → (i_1 < i → Memory.valid_rd t a_1 x_3) → Memory.valid_rd t a_2 x_4
  := sorry
end parse_x509_cert_Why3_ide_VCparse_x509_cert_call_parse_x509_signatureAlgorithm_pre_goal1
