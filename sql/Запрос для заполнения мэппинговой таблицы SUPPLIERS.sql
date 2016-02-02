SELECT
  s.supplier_id,
  s.name,
  m.swsdfid,
  m.swsdfusdid,
  m.swsdpid,
  m.navid,
  m.swsdfid_ari,
  m.swsdpid_ari
FROM supplier s
  JOIN mapsup m
    ON s.supplier_id = m.supplier_id