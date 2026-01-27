import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.x509_parser.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace parse_boolean_Why3_ide_VCparse_boolean_assert_rte_mem_access_3_goal2
theorem goal2 (a_1 : Memory.addr) (a : Memory.addr) (i : ℤ) (t_1 : Memory.addr -> ℤ) (t : ℤ -> ℤ) : let x : ℤ := Memory.addr.base a_1; let x_1 : ℤ := Memory.addr.base a; let a_2 : Memory.addr := Memory.shift a_1 (0 : ℤ); let a_3 : Memory.addr := Memory.shift a_1 (1 : ℤ); ¬i = (0 : ℤ) → ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_1 → ¬x = x_1 → t_1 a_2 = (1 : ℤ) → t_1 a_3 = (1 : ℤ) → (0 : ℤ) ≤ i → Memory.region x_1 ≤ (0 : ℤ) → Memory.region x ≤ (0 : ℤ) → (3 : ℤ) ≤ i → Memory.linked t → Cint.is_uint16 i → Memory.valid_rw t a (1 : ℤ) → Memory.valid_rd t a_2 (1 : ℤ) → Memory.valid_rd t a_3 (1 : ℤ) → ((0 : ℤ) < i → Memory.valid_rd t a_2 i) → Memory.valid_rd t (Memory.shift a_1 (2 : ℤ)) (1 : ℤ)
  := sorry
end parse_boolean_Why3_ide_VCparse_boolean_assert_rte_mem_access_3_goal2
