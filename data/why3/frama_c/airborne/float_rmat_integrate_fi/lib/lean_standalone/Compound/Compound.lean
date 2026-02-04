namespace S5_FloatRMat
structure s5_floatrmat where
  f5_floatrmat_m : ℤ -> ℝ
axiom inhabited_axiom_s5_floatrmat : Inhabited s5_floatrmat
attribute [instance] inhabited_axiom_s5_floatrmat
end S5_FloatRMat
namespace Compound
axiom array1_float : Memory.addr -> ℤ -> (Memory.addr -> ℝ) -> ℤ -> ℝ
noncomputable def load_s5_floatrmat (p : Memory.addr) (mflt_0 : Memory.addr -> ℝ) := S5_FloatRMat.s5_floatrmat.mk (array1_float (Memory.shift p (0 : ℤ)) (9 : ℤ) mflt_0)
axiom Q_Array1_float_access (i : ℤ) (n : ℤ) (p : Memory.addr) (mflt_0 : Memory.addr -> ℝ) (fact0 : (0 : ℤ) ≤ i) (fact1 : i < n) : array1_float p n mflt_0 i = mflt_0 (Memory.shift p i)
axiom Q_Array1_float_update_Mflt (p : Memory.addr) (n : ℤ) (q : Memory.addr) (mflt_0 : Memory.addr -> ℝ) (v : ℝ) (fact0 : Memory.separated p n q (1 : ℤ)) : array1_float p n (Function.update mflt_0 q v) = array1_float p n mflt_0
axiom Q_Array1_float_eqmem_Mflt (p : Memory.addr) (n : ℤ) (q : Memory.addr) (k : ℤ) (mflt_0 : Memory.addr -> ℝ) (mflt_1 : Memory.addr -> ℝ) (fact0 : Memory.included p n q k) (fact1 : Memory.eqmem mflt_0 mflt_1 q k) : array1_float p n mflt_1 = array1_float p n mflt_0
axiom Q_Array1_float_havoc_Mflt (mflt_2 : Memory.addr -> ℝ) (mflt_0 : Memory.addr -> ℝ) (q : Memory.addr) (k : ℤ) (mflt_1 : Memory.addr -> ℝ) (p : Memory.addr) (n : ℤ) (fact0 : Memory.havoc mflt_2 mflt_0 q k = mflt_1) (fact1 : Memory.separated p n q k) : array1_float p n mflt_1 = array1_float p n mflt_0
axiom Q_Load_S5_FloatRMat_update_Mflt (p : Memory.addr) (q : Memory.addr) (mflt_0 : Memory.addr -> ℝ) (v : ℝ) (fact0 : Memory.separated p (9 : ℤ) q (1 : ℤ)) : load_s5_floatrmat p (Function.update mflt_0 q v) = load_s5_floatrmat p mflt_0
axiom Q_Load_S5_FloatRMat_eqmem_Mflt (p : Memory.addr) (q : Memory.addr) (k : ℤ) (mflt_0 : Memory.addr -> ℝ) (mflt_1 : Memory.addr -> ℝ) (fact0 : Memory.included p (9 : ℤ) q k) (fact1 : Memory.eqmem mflt_0 mflt_1 q k) : load_s5_floatrmat p mflt_1 = load_s5_floatrmat p mflt_0
axiom Q_Load_S5_FloatRMat_havoc_Mflt (mflt_2 : Memory.addr -> ℝ) (mflt_0 : Memory.addr -> ℝ) (q : Memory.addr) (k : ℤ) (mflt_1 : Memory.addr -> ℝ) (p : Memory.addr) (fact0 : Memory.havoc mflt_2 mflt_0 q k = mflt_1) (fact1 : Memory.separated p (9 : ℤ) q k) : load_s5_floatrmat p mflt_1 = load_s5_floatrmat p mflt_0
end Compound
