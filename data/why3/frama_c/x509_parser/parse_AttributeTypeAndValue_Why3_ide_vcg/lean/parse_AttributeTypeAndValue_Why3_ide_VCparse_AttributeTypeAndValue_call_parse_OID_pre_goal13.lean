import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.x509_parser.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace parse_AttributeTypeAndValue_Why3_ide_VCparse_AttributeTypeAndValue_call_parse_OID_pre_goal13
theorem goal13 (a_1 : Memory.addr) (i_1 : ℤ) (i_2 : ℤ) (i : ℤ) (a : Memory.addr) (t_1 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) : let a_2 : Memory.addr := Memory.shift a_1 i_1; let x : ℤ := i_1 + i_2; ¬i = (0 : ℤ) → ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_1 → ¬a_2 = Memory.addr.mk (0 : ℤ) (0 : ℤ) → (0 : ℤ) < i_2 → (0 : ℤ) ≤ i → i_1 ≤ i → i_2 ≤ i → x ≤ i → (0 : ℤ) ≤ x → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → (2 : ℤ) ≤ i_1 → -(2147483648 : ℤ) ≤ x → x ≤ (65535 : ℤ) → x ≤ (2147483647 : ℤ) → i ≤ (65535 : ℤ) + i_1 → i ≤ (2147483647 : ℤ) + i_1 → i_1 ≤ (2147483648 : ℤ) + i → Memory.framed t_1 → Memory.linked t → Cint.is_uint16 i → Cint.is_uint16 i_1 → Cint.is_uint16 i_2 → Memory.valid_rw t a (1 : ℤ) → ((0 : ℤ) < i → Memory.valid_rd t (Memory.shift a_1 (0 : ℤ)) i) → Memory.valid_rd t a_2 i_2
  := sorry
end parse_AttributeTypeAndValue_Why3_ide_VCparse_AttributeTypeAndValue_call_parse_OID_pre_goal13
