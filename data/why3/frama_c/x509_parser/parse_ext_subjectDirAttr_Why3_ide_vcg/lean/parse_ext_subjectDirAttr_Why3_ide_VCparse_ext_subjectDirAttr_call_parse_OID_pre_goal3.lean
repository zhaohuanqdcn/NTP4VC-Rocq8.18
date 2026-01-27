import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.x509_parser.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace parse_ext_subjectDirAttr_Why3_ide_VCparse_ext_subjectDirAttr_call_parse_OID_pre_goal3
theorem goal3 (a_1 : Memory.addr) (a : Memory.addr) (a_2 : Memory.addr) (i_3 : ℤ) (i : ℤ) (i_1 : ℤ) (i_4 : ℤ) (i_2 : ℤ) (t : ℤ -> ℤ) : let x : ℤ := Memory.addr.base a_1; let x_1 : ℤ := Memory.addr.base a; let a_3 : Memory.addr := Memory.shift a_2 i_3; ¬i = (0 : ℤ) → ¬i_1 = (0 : ℤ) → ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_1 → ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_2 → ¬x = x_1 → ¬a_3 = Memory.addr.mk (0 : ℤ) (0 : ℤ) → (0 : ℤ) < i_4 → (0 : ℤ) ≤ i → i_3 ≤ i → i_4 ≤ i → (0 : ℤ) ≤ i_1 → i_2 ≤ i_1 → (0 : ℤ) ≤ i_2 → i_3 + i_4 ≤ i → Memory.region x_1 ≤ (0 : ℤ) → Memory.region x ≤ (0 : ℤ) → -(2147483648 : ℤ) ≤ i_1 → (2 : ℤ) ≤ i_2 → (2 : ℤ) ≤ i_3 → i_1 ≤ (2147483647 : ℤ) → i ≤ (65535 : ℤ) + i_3 → i ≤ (2147483647 : ℤ) + i_3 → i_3 ≤ (2147483648 : ℤ) + i → Memory.linked t → Cint.is_uint16 i → Cint.is_uint16 i_1 → Cint.is_uint16 i_2 → Cint.is_uint16 i_3 → Cint.is_uint16 i_4 → Memory.valid_rw t a (15 : ℤ) → Cint.is_uint16 (i_1 - i_2) → Memory.valid_rd t (Memory.shift a_2 (0 : ℤ)) i → ((0 : ℤ) < i_1 → Memory.valid_rd t (Memory.shift a_1 (0 : ℤ)) i_1) → Memory.valid_rd t a_3 i_4
  := sorry
end parse_ext_subjectDirAttr_Why3_ide_VCparse_ext_subjectDirAttr_call_parse_OID_pre_goal3
