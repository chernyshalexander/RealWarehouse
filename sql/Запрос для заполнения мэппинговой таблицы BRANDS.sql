SELECT  b.brand_id, b.name, m.swsdfid, m.swsdfusdid, m.swsdpid, m.navid,
  m.swsdfid_ari, m.swsdpid_ari
  FROM brand b
  JOIN mapbrand m ON b.brand_id=m.brand_id