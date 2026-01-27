import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.x509_parser.lib.lean.Compound.Compound
import frama_c.x509_parser.lib.lean.Globals.Globals
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace parse_x509_Extension_Why3_ide_VCparse_x509_Extension_call_parse_boolean_pre_goal37
theorem goal37 (a_3 : Memory.addr) (i_3 : ℤ) (i : ℤ) (i_4 : ℤ) (i_1 : ℤ) (i_2 : ℤ) (a : Memory.addr) (a_1 : Memory.addr) (a_2 : Memory.addr) (t_1 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) : let a_4 : Memory.addr := Memory.shift a_3 i_3; let a_5 : Memory.addr := Memory.shift a_3 (i + i_3); let x : ℤ := i_3 + i_4; let x_1 : ℤ := i_4 - i; ¬i = (0 : ℤ) → ¬i_1 = (0 : ℤ) → ¬i_4 = (0 : ℤ) → ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_3 → ¬a_4 = Memory.addr.mk (0 : ℤ) (0 : ℤ) → ¬Compound.shift___anonstruct__ext_oid_14 (Memory.addr.mk (-(8682 : ℤ)) (0 : ℤ)) i_2 = Memory.addr.mk (0 : ℤ) (0 : ℤ) → ¬a_5 = Memory.addr.mk (0 : ℤ) (0 : ℤ) → (0 : ℤ) ≤ i → i < i_4 → (0 : ℤ) ≤ i_1 → i_3 ≤ i_1 → i_4 ≤ i_1 → (0 : ℤ) ≤ i_2 → (0 : ℤ) ≤ i_4 → x ≤ i_1 → (0 : ℤ) ≤ x → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_3) ≤ (0 : ℤ) → (2 : ℤ) ≤ i_3 → (3 : ℤ) ≤ i → i_2 ≤ (28 : ℤ) → -(2147483648 : ℤ) ≤ x → x ≤ (65535 : ℤ) → x ≤ (2147483647 : ℤ) → i ≤ (2147483648 : ℤ) + i_4 → i_1 ≤ (65535 : ℤ) + i_3 → i_1 ≤ (2147483647 : ℤ) + i_3 → i_3 ≤ (2147483648 : ℤ) + i_1 → i_4 ≤ (65535 : ℤ) + i → i_4 ≤ (2147483647 : ℤ) + i → Memory.framed t_1 → Memory.linked t → Cint.is_uint16 i → Cint.is_uint16 i_1 → Cint.is_uint16 i_3 → Cint.is_uint16 i_4 → Memory.valid_rw t a (1 : ℤ) → Memory.valid_rw t a_1 (1 : ℤ) → Memory.valid_rw t a_2 (15 : ℤ) → Cint.is_uint16 x_1 → Memory.valid_rw t (Memory.shift a (0 : ℤ)) (29 : ℤ) → ((0 : ℤ) < i_1 → Memory.valid_rd t (Memory.shift a_3 (0 : ℤ)) i_1) → ((0 : ℤ) < i → Memory.valid_rd t a_4 i) → ((0 : ℤ) < i_4 → Memory.valid_rd t a_4 i_4) → Memory.valid_rd t a_5 x_1
  := sorry
end parse_x509_Extension_Why3_ide_VCparse_x509_Extension_call_parse_boolean_pre_goal37
