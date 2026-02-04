namespace S8_Int32Quat
structure s8_int32quat where
  f8_int32quat_qi : ℤ
  f8_int32quat_qx : ℤ
  f8_int32quat_qy : ℤ
  f8_int32quat_qz : ℤ
axiom inhabited_axiom_s8_int32quat : Inhabited s8_int32quat
attribute [instance] inhabited_axiom_s8_int32quat
end S8_Int32Quat
