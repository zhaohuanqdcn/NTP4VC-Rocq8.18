import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.x509_parser.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace parse_directory_string_Why3_ide_VCparse_directory_string_call_check_utf8_string_pre_goal3
theorem goal3 (a : Memory.addr) (t_1 : Memory.addr -> ℤ) (i : ℤ) (i_1 : ℤ) (t : ℤ -> ℤ) : let a_1 : Memory.addr := Memory.shift a (2 : ℤ); let a_2 : Memory.addr := Memory.shift a (0 : ℤ); let a_3 : Memory.addr := Memory.shift a (1 : ℤ); let x : ℤ := t_1 a_3; let x_1 : ℤ := (2 : ℤ) + x; ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a → ¬a_1 = Memory.addr.mk (0 : ℤ) (0 : ℤ) → t_1 a_2 = (12 : ℤ) → ¬x = -(2 : ℤ) → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → (0 : ℤ) < x → x ≤ i → i_1 ≤ x → -(2147483648 : ℤ) ≤ x → -(2 : ℤ) ≤ x → x ≤ (65535 : ℤ) → Memory.linked t → Cint.is_uint16 i → Cint.is_uint16 i_1 → Cint.is_uint8 x → Cint.is_uint16 x → Memory.valid_rd t a_2 (1 : ℤ) → Memory.valid_rd t a_3 (1 : ℤ) → Cint.is_uint16 x_1 → Memory.valid_rd t a_2 x_1 → Memory.valid_rd t a_1 x
  := sorry
end parse_directory_string_Why3_ide_VCparse_directory_string_call_check_utf8_string_pre_goal3
