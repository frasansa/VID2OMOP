/*********************************************************************************
# Copyright 2014 Observational Health Data Sciences and Informatics
#
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
********************************************************************************/

/************************

 ####### #     # ####### ######      #####  ######  #     #           ####### 
 #     # ##   ## #     # #     #    #     # #     # ##   ##    #    # #       
 #     # # # # # #     # #     #    #       #     # # # # #    #    # #       
 #     # #  #  # #     # ######     #       #     # #  #  #    #    # ######  
 #     # #     # #     # #          #       #     # #     #    #    #       # 
 #     # #     # #     # #          #     # #     # #     #     #  #  #     # 
 ####### #     # ####### #           #####  ######  #     #      ##    #####  
                                                                              

Script to load the common data model, version 5.0 vocabulary tables for PostgreSQL database on Windows (MS-DOS style file paths)
The database account running this script must have the "superuser" permission in the database.

Notes

1) There is no data file load for the SOURCE_TO_CONCEPT_MAP table because that table is deprecated in CDM version 5.0
2) This script assumes the CDM version 5 vocabulary zip file has been unzipped into the "C:\CDMV5VOCAB" directory. 
3) If you unzipped your CDM version 5 vocabulary files into a different directory then replace all file paths below, with your directory path.
4) Truncate each table that will be lodaed below, before running this script.


author:  Lee Evans


last revised: 2023-07-07 (By Francisco Sanchez Saez)


*************************/

TRUNCATE vid_consign.DRUG_STRENGTH;

COPY vid_consign.DRUG_STRENGTH FROM 'D:\R_Projects\EHDEN\Vocabularies3\DRUG_STRENGTH.csv' WITH DELIMITER E'\t' CSV HEADER QUOTE E'\b' ;

TRUNCATE vid_consign.CONCEPT;

COPY vid_consign.CONCEPT FROM 'D:\R_Projects\EHDEN\Vocabularies3\CONCEPT.csv' WITH DELIMITER E'\t' CSV HEADER QUOTE E'\b' ;

TRUNCATE vid_consign.CONCEPT_RELATIONSHIP;

COPY vid_consign.CONCEPT_RELATIONSHIP FROM 'D:\R_Projects\EHDEN\Vocabularies3\CONCEPT_RELATIONSHIP.csv' WITH DELIMITER E'\t' CSV HEADER QUOTE E'\b' ;

TRUNCATE vid_consign.CONCEPT_ANCESTOR;

COPY vid_consign.CONCEPT_ANCESTOR FROM 'D:\R_Projects\EHDEN\Vocabularies3\CONCEPT_ANCESTOR.csv' WITH DELIMITER E'\t' CSV HEADER QUOTE E'\b' ;

TRUNCATE vid_consign.CONCEPT_SYNONYM;

COPY vid_consign.CONCEPT_SYNONYM FROM 'D:\R_Projects\EHDEN\Vocabularies3\CONCEPT_SYNONYM.csv' WITH DELIMITER E'\t' CSV HEADER QUOTE E'\b' ;

TRUNCATE vid_consign.VOCABULARY;

COPY vid_consign.VOCABULARY FROM 'D:\R_Projects\EHDEN\Vocabularies3\VOCABULARY.csv' WITH DELIMITER E'\t' CSV HEADER QUOTE E'\b' ;

TRUNCATE vid_consign.RELATIONSHIP;

COPY vid_consign.RELATIONSHIP FROM 'D:\R_Projects\EHDEN\Vocabularies3\RELATIONSHIP.csv' WITH DELIMITER E'\t' CSV HEADER QUOTE E'\b' ;

TRUNCATE vid_consign.CONCEPT_CLASS;

COPY vid_consign.CONCEPT_CLASS FROM 'D:\R_Projects\EHDEN\Vocabularies3\CONCEPT_CLASS.csv' WITH DELIMITER E'\t' CSV HEADER QUOTE E'\b' ;

TRUNCATE vid_consign.DOMAIN;

COPY vid_consign.DOMAIN FROM 'D:\R_Projects\EHDEN\Vocabularies3\DOMAIN.csv' WITH DELIMITER E'\t' CSV HEADER QUOTE E'\b' ;

