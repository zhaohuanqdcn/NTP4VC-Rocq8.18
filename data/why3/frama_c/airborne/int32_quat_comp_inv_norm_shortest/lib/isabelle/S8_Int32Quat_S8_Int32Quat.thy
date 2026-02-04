theory S8_Int32Quat_S8_Int32Quat
  imports "NTP4Verif.NTP4Verif" "Why3STD.Qed_Qed"
begin
datatype  s8_int32quat = s8_int32quat'mk (f8_int32quat_qi: "int") (f8_int32quat_qx: "int") (f8_int32quat_qy: "int") (f8_int32quat_qz: "int")
end
