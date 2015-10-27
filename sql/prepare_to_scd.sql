DELETE
  FROM good
WHERE `good`.`version` > 1;
COMMIT;
UPDATE `good`
SET good.`start_date` = '1900-01-01',
    good.`end_date` = '2199-12-31',
    `good`.`last_update` = '2015-02-01',
    good.`version` = 1,
    `good`.`is_current` = '1';
COMMIT;
UPDATE good g
SET g.swsdp_id = 0
WHERE g.swsdp_id IS NULL;
UPDATE good g
SET g.swsdfusd_id = 0
WHERE g.swsdfusd_id IS NULL;

COMMIT;
