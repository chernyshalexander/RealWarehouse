UPDATE mapbrand 
  SET mapbrand.navid='' WHERE mapbrand.navid ='----';
UPDATE mapbrand 
  SET mapbrand.swsdfid=0 WHERE mapbrand.swsdfid IS NULL;
UPDATE mapbrand 
  SET mapbrand.swsdpid=0 WHERE mapbrand.swsdpid IS NULL;
UPDATE mapbrand 
  SET mapbrand.swsdfusdid=0 WHERE mapbrand.swsdfusdid IS NULL;
UPDATE location 
  SET location.nav_id='' WHERE location.nav_id IS NULL;
UPDATE location 
  SET location.swsdf_id=0 WHERE location.swsdf_id IS NULL;
UPDATE location 
  SET location.swsdp_id=0 WHERE location.swsdp_id IS NULL;
UPDATE location 
  SET location.swsdfusd_id=0 WHERE location.swsdfusd_id IS NULL;