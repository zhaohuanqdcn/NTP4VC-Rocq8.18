theory S3_FloatQuat_S3_FloatQuat
  imports "NTP4Verif.NTP4Verif" "Why3STD.Qed_Qed"
begin
datatype  s3_floatquat = s3_floatquat'mk (f3_floatquat_qi: "real") (f3_floatquat_qx: "real") (f3_floatquat_qy: "real") (f3_floatquat_qz: "real")
end
