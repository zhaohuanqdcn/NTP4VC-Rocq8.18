import Why3.Base
import Why3.why3.Ref.Ref
import Why3.map.MapEq
import Why3.mach.int.Unsigned
import Why3.mach.c.C
open Classical
open Lean4Why3
namespace ccursor_PtrCursor_cursorqtvc
theorem cursor'vc (o1 : C.ptr (BitVec 32)) (fact0 : C.is_not_null o1) (fact1 : C.plength o1 = (1 : ℤ)) (fact2 : C.offset o1 = (0 : ℤ)) (fact3 : C.min o1 = (0 : ℤ)) (fact4 : C.max o1 = C.plength o1) (fact5 : C.writable o1 = true) (fact6 : BitVec.toInt ((C.data o1)[(0 : ℕ)]!) = (0 : ℤ)) : (0 : ℤ) < (1 : ℤ) ∧ ((0 : ℤ) < (1 : ℤ) → C.plength o1 = (1 : ℤ) ∧ C.offset o1 = (0 : ℤ) ∧ C.valid o1 (1 : ℤ) ∧ C.min o1 = (0 : ℤ) ∧ C.max o1 = (1 : ℤ) ∧ C.is_not_null o1 ∧ C.writable o1 = true ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < (1 : ℤ) → BitVec.toInt ((C.data o1)[Int.toNat i]!) < (42 : ℤ)))
  := sorry
end ccursor_PtrCursor_cursorqtvc
