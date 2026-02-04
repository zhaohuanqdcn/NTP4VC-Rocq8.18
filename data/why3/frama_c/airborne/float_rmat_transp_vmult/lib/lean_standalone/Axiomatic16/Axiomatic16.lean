namespace Axiomatic16
noncomputable def l_l_vect_of_floatvect3 (mflt_0 : Memory.addr -> ℝ) (v : Memory.addr) := S9_RealVect3_s.s9_realvect3_s.mk (mflt_0 (Memory.shift v (0 : ℤ))) (mflt_0 (Memory.shift v (1 : ℤ))) (mflt_0 (Memory.shift v (2 : ℤ)))
end Axiomatic16
