SELECT
  m1.*,
  b1.name,
  m2.brand_id,
  b2.name
FROM mapbrand m1
  JOIN mapbrand m2
    ON (m1.brand_id > m2.brand_id)
  JOIN brand b1
    ON (m1.brand_id = b1.brand_id)
  JOIN brand b2
    ON (m2.brand_id = b2.brand_id)
WHERE m1.swsdpid = m2.swsdpid
 