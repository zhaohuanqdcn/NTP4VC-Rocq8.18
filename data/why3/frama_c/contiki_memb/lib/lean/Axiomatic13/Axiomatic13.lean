import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.contiki_memb.lib.lean.Compound.Compound
import frama_c.contiki_memb.lib.lean.A_OccArray.A_OccArray
open Classical
open Lean4Why3
namespace Axiomatic13
noncomputable def p_valid_memb (malloc_0 : ℤ -> ℤ) (mptr_0 : Memory.addr -> Memory.addr) (mint_0 : Memory.addr -> ℤ) (m : Memory.addr) := let x : ℤ := mint_0 (Memory.shift m (0 : ℤ)); let x_1 : ℤ := mint_0 (Memory.shift m (1 : ℤ)); let x_2 : ℤ := x_1 * x; let a : Memory.addr := mptr_0 (Memory.shift m (2 : ℤ)); let a_1 : Memory.addr := mptr_0 (Memory.shift m (3 : ℤ)); let a_2 : Memory.addr := Memory.shift a (0 : ℤ); let a_3 : Memory.addr := Memory.shift a_1 (0 : ℤ); (0 : ℤ) < x ∧ x_2 ≤ (2147483647 : ℤ) ∧ Memory.valid_rw malloc_0 m (4 : ℤ) ∧ Memory.valid_rw malloc_0 a (1 : ℤ) ∧ Memory.valid_rw malloc_0 a_1 (1 : ℤ) ∧ Memory.valid_rw malloc_0 a_2 x_1 ∧ Memory.valid_rw malloc_0 a_3 x_2 ∧ Memory.separated a_2 x_1 a_3 x_2
noncomputable def p__memb_full (mptr_0 : Memory.addr -> Memory.addr) (mchar_0 : Memory.addr -> ℤ) (mint_0 : Memory.addr -> ℤ) (m : Memory.addr) := ∀(i : ℤ), (0 : ℤ) ≤ i → i < mint_0 (Memory.shift m (1 : ℤ)) → ¬mchar_0 (Memory.shift (mptr_0 (Memory.shift m (2 : ℤ))) i) = (0 : ℤ)
noncomputable def l__memb_index (mptr_0 : Memory.addr -> Memory.addr) (mint_0 : Memory.addr -> ℤ) (m : Memory.addr) (ptr_0 : Memory.addr) := Int.tdiv (Memory.addr.offset ptr_0 - Memory.addr.offset (mptr_0 (Memory.shift m (3 : ℤ)))) (mint_0 (Memory.shift m (0 : ℤ)))
noncomputable def l__memb_ptr (mptr_0 : Memory.addr -> Memory.addr) (mint_0 : Memory.addr -> ℤ) (m : Memory.addr) (index_0 : ℤ) := Memory.shift (mptr_0 (Memory.shift m (3 : ℤ))) (index_0 * mint_0 (Memory.shift m (0 : ℤ)))
noncomputable def p__memb_has (mptr_0 : Memory.addr -> Memory.addr) (mint_0 : Memory.addr -> ℤ) (m : Memory.addr) (ptr_0 : Memory.addr) := ∃(i : ℤ), l__memb_ptr mptr_0 mint_0 m i = ptr_0 ∧ (0 : ℤ) ≤ i ∧ i < mint_0 (Memory.shift m (1 : ℤ))
noncomputable def p__memb_allocated (mptr_0 : Memory.addr -> Memory.addr) (mchar_0 : Memory.addr -> ℤ) (mint_0 : Memory.addr -> ℤ) (m : Memory.addr) (ptr_0 : Memory.addr) := ¬mchar_0 (Memory.shift (mptr_0 (Memory.shift m (2 : ℤ))) (l__memb_index mptr_0 mint_0 m ptr_0)) = (0 : ℤ) ∧ p__memb_has mptr_0 mint_0 m ptr_0
noncomputable def l__memb_numfree (mptr_0 : Memory.addr -> Memory.addr) (mchar_0 : Memory.addr -> ℤ) (mint_0 : Memory.addr -> ℤ) (m : Memory.addr) := A_OccArray.l_occ_a mchar_0 (0 : ℤ) (mptr_0 (Memory.shift m (2 : ℤ))) (0 : ℤ) (mint_0 (Memory.shift m (1 : ℤ)))
noncomputable def p__memb_empty (mptr_0 : Memory.addr -> Memory.addr) (mchar_0 : Memory.addr -> ℤ) (mint_0 : Memory.addr -> ℤ) (m : Memory.addr) := ∀(i : ℤ), (0 : ℤ) ≤ i → i < mint_0 (Memory.shift m (1 : ℤ)) → mchar_0 (Memory.shift (mptr_0 (Memory.shift m (2 : ℤ))) i) = (0 : ℤ)
axiom Q_mult_simplification (b : ℤ) (a : ℤ) (fact0 : (0 : ℤ) < b) (fact1 : (0 : ℤ) ≤ a) : Int.tdiv (a * b) b = a
end Axiomatic13
