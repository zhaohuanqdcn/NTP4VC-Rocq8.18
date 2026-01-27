import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.x509_parser.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace parse_ext_subjectDirAttr_Why3_ide_VCparse_ext_subjectDirAttr_loop_inv_established_goal1
theorem goal1 (a_1 : Memory.addr) (a : Memory.addr) (i : ℤ) (i_1 : ℤ) (t : ℤ -> ℤ) : let x : ℤ := Memory.addr.base a_1; let x_1 : ℤ := Memory.addr.base a; let x_2 : ℤ := i - i_1; ¬i = (0 : ℤ) → ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_1 → ¬x = x_1 → (0 : ℤ) ≤ i → i_1 ≤ i → (0 : ℤ) ≤ i_1 → Memory.region x_1 ≤ (0 : ℤ) → Memory.region x ≤ (0 : ℤ) → -(2147483648 : ℤ) ≤ i → (2 : ℤ) ≤ i_1 → i ≤ (2147483647 : ℤ) → Memory.linked t → Cint.is_uint16 i → Cint.is_uint16 i_1 → Memory.valid_rw t a (15 : ℤ) → Cint.is_uint16 x_2 → ((0 : ℤ) < i → Memory.valid_rd t (Memory.shift a_1 (0 : ℤ)) i) → Memory.valid_rd t (Memory.shift a_1 i_1) x_2
  := sorry
end parse_ext_subjectDirAttr_Why3_ide_VCparse_ext_subjectDirAttr_loop_inv_established_goal1
