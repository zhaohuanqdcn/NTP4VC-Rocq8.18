import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.x509_parser.lib.lean.Compound.Compound
import frama_c.x509_parser.lib.lean.Globals.Globals
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace parse_AttributeTypeAndValue_Why3_ide_VCparse_AttributeTypeAndValue_call_parse_rdn_val_state_pre_goal20
theorem goal20 (a_2 : Memory.addr) (i_3 : ℤ) (i : ℤ) (i_4 : ℤ) (i_2 : ℤ) (i_1 : ℤ) (t_1 : Memory.addr -> Memory.addr) (a_1 : Memory.addr) (t : ℤ -> ℤ) : let a_3 : Memory.addr := Memory.shift a_2 i_3; let x : ℤ := i + i_4; let a_4 : Memory.addr := Compound.shift___anonstruct__name_oid_11 (Memory.addr.mk (-(8604 : ℤ)) (0 : ℤ)) i_2; let a_5 : Memory.addr := Memory.shift a_2 (i + i_3); let a_6 : Memory.addr := Memory.shift a_4 (2 : ℤ); let x_1 : ℤ := i + i_3 + i_4; ¬i = (0 : ℤ) → ¬i_1 = (0 : ℤ) → ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_2 → ¬a_3 = Memory.addr.mk (0 : ℤ) (0 : ℤ) → ¬x = (0 : ℤ) → ¬a_4 = Memory.addr.mk (0 : ℤ) (0 : ℤ) → ¬a_5 = Memory.addr.mk (0 : ℤ) (0 : ℤ) → t_1 a_6 = Memory.addr.mk (8595 : ℤ) (0 : ℤ) → (0 : ℤ) < i_4 → (0 : ℤ) ≤ i → (0 : ℤ) ≤ i_1 → i_3 ≤ i_1 → (0 : ℤ) ≤ i_2 → x ≤ i_1 → (0 : ℤ) ≤ x → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ) → x_1 ≤ i_1 → (0 : ℤ) ≤ x_1 → -(2147483648 : ℤ) ≤ i_4 → (2 : ℤ) ≤ i_3 → (3 : ℤ) ≤ i → i_2 ≤ (15 : ℤ) → i_4 ≤ (65535 : ℤ) → i_4 ≤ (2147483647 : ℤ) → i_1 ≤ (65535 : ℤ) + i_3 → i_1 ≤ (2147483647 : ℤ) + i_3 → i_3 ≤ (2147483648 : ℤ) + i_1 → -(2147483648 : ℤ) ≤ x_1 → x_1 ≤ (65535 : ℤ) → x_1 ≤ (2147483647 : ℤ) → Memory.framed t_1 → Memory.linked t → Cint.is_uint16 i → Cint.is_uint16 i_1 → Cint.is_uint16 i_3 → Cint.is_uint16 i_4 → Memory.valid_rw t a_1 (1 : ℤ) → Cint.is_uint16 x → Memory.valid_rd t a_6 (1 : ℤ) → ((0 : ℤ) < i_1 → Memory.valid_rd t (Memory.shift a_2 (0 : ℤ)) i_1) → ((0 : ℤ) < i → Memory.valid_rd t a_3 i) → ((0 : ℤ) < x → Memory.valid_rd t a_3 x) → Memory.valid_rd t a_5 i_4
  := sorry
end parse_AttributeTypeAndValue_Why3_ide_VCparse_AttributeTypeAndValue_call_parse_rdn_val_state_pre_goal20
