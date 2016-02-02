SELECT
  m1.supplier_id AS supplier_id1,
  (SELECT
      COUNT(*)
    FROM supply
    WHERE supply.supplier_id = m1.supplier_id) AS supply_count1,
  (SELECT
      COUNT(*)
    FROM sale
    WHERE sale.supplier_id = m1.supplier_id) AS sale_count1,
  s1.name AS supplier_name1,
  m2.supplier_id AS supplier_id2,
  (SELECT
      COUNT(*)
    FROM supply
    WHERE supply.supplier_id = m2.supplier_id) AS supply_count2,
  (SELECT
      COUNT(*)
    FROM sale
    WHERE sale.supplier_id = m2.supplier_id) AS sale_count2,
  s2.name AS supplier_name1,
  m1.swsdfusdid,
  m2.swsdfusdid
FROM mapsup m1,
     mapsup m2,
     supplier s1,
     supplier s2
WHERE m1.swsdfusdid = m2.swsdfusdid
AND m1.supplier_id > m2.supplier_id
AND m1.swsdfusdid != 0
AND m2.swsdfusdid != 0
AND m1.supplier_id = s1.supplier_id
AND m2.supplier_id = s2.supplier_id 
  
  