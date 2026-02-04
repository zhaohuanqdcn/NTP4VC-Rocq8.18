namespace Compound
end Compound
namespace Axiomatic15
noncomputable def p_finite_floatvect3 (mflt_0 : Memory.addr -> ℝ) (v : Memory.addr) := Cfloat.is_finite32 (mflt_0 (Memory.shift v (0 : ℤ))) ∧ Cfloat.is_finite32 (mflt_0 (Memory.shift v (1 : ℤ))) ∧ Cfloat.is_finite32 (mflt_0 (Memory.shift v (2 : ℤ)))
noncomputable def p_rvalid_floatvect3 (malloc_0 : ℤ -> ℤ) (mflt_0 : Memory.addr -> ℝ) (v : Memory.addr) := p_finite_floatvect3 mflt_0 v ∧ Memory.valid_rd malloc_0 v (3 : ℤ)
end Axiomatic15
