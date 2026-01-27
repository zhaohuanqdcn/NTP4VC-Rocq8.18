namespace UChar
axiom cast_mem : Type
axiom cast_mem_inhabited : Inhabited cast_mem
attribute [instance] cast_mem_inhabited
axiom mi : cast_mem -> ℤ
axiom ma : cast_mem -> ℤ
axiom z : cast_mem -> C.zone
axiom l : cast_mem -> ℤ
axiom ok : cast_mem -> Bool
end UChar
