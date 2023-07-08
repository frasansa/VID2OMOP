/*********************************************************************************
last revised: 2023-07-06

author:  Francisco Sanchez-Saez


*************************/

COPY vid_consign.PERSON FROM 'D:\R_Projects\EHDEN\Target_tables\person_vid.csv' WITH DELIMITER E',' CSV HEADER QUOTE E'\b' ;
COPY vid_consign.OBSERVATION_PERIOD FROM 'D:\R_Projects\EHDEN\Target_tables\observation_period_vid.csv' WITH DELIMITER E',' CSV HEADER QUOTE E'\b' ;
COPY vid_consign.VISIT_OCCURRENCE FROM 'D:\R_Projects\EHDEN\Target_tables\visit_occurrence_vid.csv' WITH DELIMITER E',' CSV HEADER QUOTE E'\b' ;
COPY vid_consign.CONDITION_OCCURRENCE FROM 'D:\R_Projects\EHDEN\Target_tables\condition_occurrence_vid.csv' WITH DELIMITER E',' CSV HEADER QUOTE E'\b' ;
COPY vid_consign.PROCEDURE_OCCURRENCE FROM 'D:\R_Projects\EHDEN\Target_tables\procedure_occurrence_vid.csv' WITH DELIMITER E',' CSV HEADER QUOTE E'\b' ;
COPY vid_consign.DEATH FROM 'D:\R_Projects\EHDEN\Target_tables\death_vid.csv' WITH DELIMITER E',' CSV HEADER QUOTE E'\b' ;
