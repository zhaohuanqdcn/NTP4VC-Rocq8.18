namespace BitCounting32
noncomputable def step0 (n : BitVec 32) (x1 : BitVec 32) := x1 = n - ((n >>> BitVec.toNat (1 : BitVec 32)) &&& (1431655765 : BitVec 32))
noncomputable def step1 (x1 : BitVec 32) (x2 : BitVec 32) := x2 = (x1 &&& (858993459 : BitVec 32)) + ((x1 >>> BitVec.toNat (2 : BitVec 32)) &&& (858993459 : BitVec 32))
noncomputable def step2 (x2 : BitVec 32) (x3 : BitVec 32) := x3 = x2 + (x2 >>> BitVec.toNat (4 : BitVec 32)) &&& (252645135 : BitVec 32)
noncomputable def step3 (x3 : BitVec 32) (x4 : BitVec 32) := x4 = x3 + (x3 >>> BitVec.toNat (8 : BitVec 32))
noncomputable def step4 (x4 : BitVec 32) (x5 : BitVec 32) := x5 = x4 + (x4 >>> BitVec.toNat (16 : BitVec 32))
axiom nth_closure : BitVec 32 -> ℤ -> Bool
axiom nth_closure_def (y : BitVec 32) (y1 : ℤ) : nth_closure y y1 = y[Int.toNat y1]!
noncomputable def count_logic (n : BitVec 32) := NumOf.numof (nth_closure n) (0 : ℤ) (32 : ℤ)
end BitCounting32
