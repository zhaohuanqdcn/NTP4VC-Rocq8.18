import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.x509_parser.lib.lean.Compound.Compound
import Why3.Cint.Cint
import frama_c.x509_parser.lib.lean.Globals.Globals
open Classical
open Lean4Why3
namespace parse_x509_AlgorithmIdentifier_Why3_ide_VCparse_x509_AlgorithmIdentifier_post_2_part20_goal5
theorem goal5 (t_1 : ℤ -> Memory.addr) (i_2 : ℤ) (a_2 : Memory.addr) (a : Memory.addr) (i_3 : ℤ) (i : ℤ) (i_1 : ℤ) (a_1 : Memory.addr) (a_3 : Memory.addr) (t_2 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) : let a_4 : Memory.addr := t_1 i_2; let x : ℤ := Memory.addr.base a_2; let x_1 : ℤ := Memory.addr.base a; let a_5 : Memory.addr := Memory.shift a_2 i_3; let a_6 : Memory.addr := Memory.shift a_4 (7 : ℤ); let x_2 : ℤ := i + i_3; ¬i = (0 : ℤ) → ¬i_1 = (0 : ℤ) → ¬a_2 = a_1 → ¬a_3 = a_1 → ¬a_3 = a_2 → ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_2 → ¬a_4 = Memory.addr.mk (0 : ℤ) (0 : ℤ) → ¬x = x_1 → ¬a_5 = Memory.addr.mk (0 : ℤ) (0 : ℤ) → t_2 a_6 = Memory.addr.mk (8419 : ℤ) (0 : ℤ) → ¬Memory.shift a_2 x_2 = Memory.addr.mk (0 : ℤ) (0 : ℤ) → (0 : ℤ) ≤ i → (0 : ℤ) ≤ i_1 → i ≤ i_1 → i_3 ≤ i_1 → (0 : ℤ) ≤ i_2 → x_2 ≤ i_1 → (0 : ℤ) ≤ x_2 → Memory.region x_1 ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.region x ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_3) ≤ (0 : ℤ) → (2 : ℤ) ≤ i_3 → (3 : ℤ) ≤ i → i_2 ≤ (26 : ℤ) → -(2147483648 : ℤ) ≤ x_2 → x_2 ≤ (65535 : ℤ) → x_2 ≤ (2147483647 : ℤ) → Memory.framed t_2 → Memory.linked t → Cint.is_uint16 i → Cint.is_uint16 i_1 → Cint.is_uint16 i_3 → Memory.valid_rw t a (4 : ℤ) → Memory.valid_rw t a_1 (1 : ℤ) → Memory.valid_rw t a_3 (1 : ℤ) → Memory.separated a (4 : ℤ) a_1 (1 : ℤ) → Memory.separated a_2 (1 : ℤ) a (4 : ℤ) → Memory.separated a_3 (1 : ℤ) a (4 : ℤ) → Cint.is_uint16 x_2 → Memory.valid_rd t a_6 (1 : ℤ) → ((0 : ℤ) < i_1 → Memory.valid_rd t (Memory.shift a_2 (0 : ℤ)) i_1) → ((0 : ℤ) < i → Memory.valid_rd t a_5 i) → (2 : ℤ) ≤ x_2
  := sorry
end parse_x509_AlgorithmIdentifier_Why3_ide_VCparse_x509_AlgorithmIdentifier_post_2_part20_goal5
