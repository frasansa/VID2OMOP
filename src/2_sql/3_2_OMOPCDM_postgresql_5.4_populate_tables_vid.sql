/*********************************************************************************
last revised: 2023-07-06

author:  Francisco Sanchez-Saez


*************************/

COPY vid_consign.DRUG_EXPOSURE FROM 'D:\R_Projects\EHDEN\Target_tables\drug_exposure_vid.csv' WITH DELIMITER E',' CSV HEADER QUOTE E'\b' ;
COPY vid_consign.CARE_SITE FROM 'D:\R_Projects\EHDEN\Target_tables\care_site_vid.csv' WITH DELIMITER E',' CSV HEADER QUOTE E'\b' ;
-- COPY vid_consign.FACT_RELATIONSHIP FROM 'D:\R_Projects\EHDEN\Target_tables\fact_relationship_vid.csv' WITH DELIMITER E',' CSV HEADER QUOTE E'\b' ;
COPY vid_consign.DEVICE_EXPOSURE FROM 'D:\R_Projects\EHDEN\Target_tables\device_exposure_vid.csv' WITH DELIMITER E',' CSV HEADER QUOTE E'\b' ;
COPY vid_consign.MEASUREMENT FROM 'D:\R_Projects\EHDEN\Target_tables\measurement_vid.csv' WITH DELIMITER E',' CSV HEADER QUOTE E'\b' ;
COPY vid_consign.OBSERVATION FROM 'D:\R_Projects\EHDEN\Target_tables\observation_vid.csv' WITH DELIMITER E',' CSV HEADER QUOTE E'\b' ;
COPY vid_consign.CDM_SOURCE FROM 'D:\R_Projects\EHDEN\Target_tables\cdm_source_vid.csv' WITH DELIMITER E',' CSV HEADER QUOTE E'\b' ;
