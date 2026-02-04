import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.standard_algorithms.axiom_push_of_pop_top.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace Axiomatic
noncomputable def l_storage (mptr_0 : Memory.addr -> Memory.addr) (s : Memory.addr) := mptr_0 (Memory.shift s (0 : ℤ))
noncomputable def l_size (mint_0 : Memory.addr -> ℤ) (s : Memory.addr) := mint_0 (Memory.shift s (2 : ℤ))
noncomputable def p_equalranges_1' (mint_0 : Memory.addr -> ℤ) (mint_1 : Memory.addr -> ℤ) (a : Memory.addr) (n : ℤ) (b : Memory.addr) := ∀(i : ℤ), (0 : ℤ) ≤ i → i < n → mint_1 (Memory.shift a i) = mint_0 (Memory.shift b i)
noncomputable def p_equal (mptr_0 : Memory.addr -> Memory.addr) (mint_0 : Memory.addr -> ℤ) (mptr_1 : Memory.addr -> Memory.addr) (mint_1 : Memory.addr -> ℤ) (s : Memory.addr) (t : Memory.addr) := let x : ℤ := l_size mint_1 s; l_size mint_0 t = x ∧ p_equalranges_1' mint_0 mint_1 (l_storage mptr_1 s) x (l_storage mptr_0 t)
noncomputable def l_capacity (mint_0 : Memory.addr -> ℤ) (s : Memory.addr) := mint_0 (Memory.shift s (1 : ℤ))
noncomputable def p_invariant (malloc_0 : ℤ -> ℤ) (mptr_0 : Memory.addr -> Memory.addr) (mint_0 : Memory.addr -> ℤ) (s : Memory.addr) := let x : ℤ := l_capacity mint_0 s; let x_1 : ℤ := l_size mint_0 s; let a : Memory.addr := Memory.shift (l_storage mptr_0 s) (0 : ℤ); (0 : ℤ) < x ∧ x_1 ≤ x ∧ (0 : ℤ) ≤ x_1 ∧ Memory.valid_rw malloc_0 a x ∧ Memory.separated s (3 : ℤ) a x
noncomputable def p_full (mint_0 : Memory.addr -> ℤ) (s : Memory.addr) := l_size mint_0 s = l_capacity mint_0 s
noncomputable def p_unchanged_1' (mint_0 : Memory.addr -> ℤ) (mint_1 : Memory.addr -> ℤ) (a : Memory.addr) (m : ℤ) (n : ℤ) := ∀(i : ℤ), let a_1 : Memory.addr := Memory.shift a i; m ≤ i → i < n → mint_1 a_1 = mint_0 a_1
noncomputable def p_empty (mint_0 : Memory.addr -> ℤ) (s : Memory.addr) := l_size mint_0 s = (0 : ℤ)
noncomputable def l_top (mptr_0 : Memory.addr -> Memory.addr) (mint_0 : Memory.addr -> ℤ) (s : Memory.addr) := mint_0 (Memory.shift (mptr_0 (Memory.shift s (0 : ℤ))) (mint_0 (Memory.shift s (2 : ℤ)) - (1 : ℤ)))
axiom Q_TL_Size (mint_0 : Memory.addr -> ℤ) (s : Memory.addr) : Cint.is_uint32 (l_size mint_0 s)
axiom Q_TL_Capacity (mint_0 : Memory.addr -> ℤ) (s : Memory.addr) : Cint.is_uint32 (l_capacity mint_0 s)
axiom Q_TL_Top (mptr_0 : Memory.addr -> Memory.addr) (mint_0 : Memory.addr -> ℤ) (s : Memory.addr) : Cint.is_sint32 (l_top mptr_0 mint_0 s)
end Axiomatic
