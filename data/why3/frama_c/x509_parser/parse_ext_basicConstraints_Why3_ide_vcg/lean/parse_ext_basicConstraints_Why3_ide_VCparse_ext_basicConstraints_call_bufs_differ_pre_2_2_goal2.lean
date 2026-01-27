import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.x509_parser.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace parse_ext_basicConstraints_Why3_ide_VCparse_ext_basicConstraints_call_bufs_differ_pre_2_2_goal2
theorem goal2 (a_1 : Memory.addr) (a : Memory.addr) (i : ℤ) (t : ℤ -> ℤ) : let x : ℤ := Memory.addr.base a_1; let x_1 : ℤ := Memory.addr.base a; let x_2 : ℤ := i - (6 : ℤ); ¬i = (0 : ℤ) → ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_1 → ¬x = x_1 → (0 : ℤ) ≤ i → Memory.region x_1 ≤ (0 : ℤ) → Memory.region x ≤ (0 : ℤ) → -(2147483648 : ℤ) ≤ i → (6 : ℤ) ≤ i → (8 : ℤ) ≤ i → i ≤ (2147483647 : ℤ) → Memory.linked t → Cint.is_uint16 i → Memory.valid_rw t a (15 : ℤ) → Cint.is_uint16 x_2 → Memory.valid_rw t (Memory.shift a (4 : ℤ)) (1 : ℤ) → ((0 : ℤ) < i → Memory.valid_rd t (Memory.shift a_1 (0 : ℤ)) i) → Memory.valid_rd t (Memory.shift a_1 x_2) (5 : ℤ)
  := sorry
end parse_ext_basicConstraints_Why3_ide_VCparse_ext_basicConstraints_call_bufs_differ_pre_2_2_goal2
