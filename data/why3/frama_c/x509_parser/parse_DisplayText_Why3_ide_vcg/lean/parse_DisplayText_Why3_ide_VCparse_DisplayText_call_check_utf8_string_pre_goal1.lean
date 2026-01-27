import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.x509_parser.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace parse_DisplayText_Why3_ide_VCparse_DisplayText_call_check_utf8_string_pre_goal1
theorem goal1 (a_1 : Memory.addr) (a : Memory.addr) (i_1 : ℤ) (i : ℤ) (t_1 : Memory.addr -> ℤ) (i_2 : ℤ) (t : ℤ -> ℤ) : let x : ℤ := Memory.addr.base a_1; let x_1 : ℤ := Memory.addr.base a; let a_2 : Memory.addr := Memory.shift a_1 i_1; let a_3 : Memory.addr := Memory.shift a_1 (0 : ℤ); ¬i = (0 : ℤ) → ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_1 → ¬x = x_1 → ¬a_2 = Memory.addr.mk (0 : ℤ) (0 : ℤ) → t_1 a_3 = (12 : ℤ) → (0 : ℤ) < i_2 → (0 : ℤ) ≤ i → i_1 ≤ i → i_2 ≤ i → i_1 + i_2 ≤ i → Memory.region x_1 ≤ (0 : ℤ) → Memory.region x ≤ (0 : ℤ) → (2 : ℤ) ≤ i_1 → Memory.linked t → Cint.is_uint16 i → Cint.is_uint16 i_1 → Cint.is_uint16 i_2 → Memory.valid_rw t a (1 : ℤ) → Memory.valid_rd t a_3 (1 : ℤ) → ((0 : ℤ) < i → Memory.valid_rd t a_3 i) → Memory.valid_rd t a_2 i_2
  := sorry
end parse_DisplayText_Why3_ide_VCparse_DisplayText_call_check_utf8_string_pre_goal1
