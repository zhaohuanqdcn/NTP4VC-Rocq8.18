import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.x509_parser.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace parse_GeneralName_Why3_ide_VCparse_GeneralName_call_get_length_pre_2_goal14
theorem goal14 (a_2 : Memory.addr) (a : Memory.addr) (a_1 : Memory.addr) (i : ℤ) (t_1 : Memory.addr -> ℤ) (t : ℤ -> ℤ) : let x : ℤ := Memory.addr.base a_2; let x_1 : ℤ := Memory.addr.base a; let x_2 : ℤ := Memory.addr.base a_1; let a_3 : Memory.addr := Memory.shift a_2 (1 : ℤ); let a_4 : Memory.addr := Memory.shift a_2 (0 : ℤ); let x_3 : ℤ := i - (1 : ℤ); ¬i = (0 : ℤ) → ¬a_1 = a → ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_2 → ¬x = x_1 → ¬x = x_2 → ¬a_3 = Memory.addr.mk (0 : ℤ) (0 : ℤ) → t_1 a_4 = (135 : ℤ) → (0 : ℤ) < i → (0 : ℤ) ≤ i → Memory.region x_1 ≤ (0 : ℤ) → Memory.region x_2 ≤ (0 : ℤ) → Memory.region x ≤ (0 : ℤ) → -(2147483647 : ℤ) ≤ i → (2 : ℤ) ≤ i → i ≤ (65536 : ℤ) → Memory.linked t → Cint.is_uint16 i → Memory.valid_rw t a_1 (1 : ℤ) → Cint.is_uint16 x_3 → Memory.valid_rd t a_4 (1 : ℤ) → Memory.valid_rd t a_4 i → Memory.valid_rd t a_3 x_3
  := sorry
end parse_GeneralName_Why3_ide_VCparse_GeneralName_call_get_length_pre_2_goal14
