# qc-to-testrail-migration
tools used to migrate our tests

1) Run the script in qcexport.sql in QC. Modify this line - PATH from all_lists start with al_description = 'Migrating - Access Gateway - DONE'
2) Use the Description Remover.xlsm macro on the export to clean up the sheet
3) Save the export as a .csv
4) Use the Import tool in Testrail, with the cfg file testrail-import-sandbox_project___au-2017-12-21.cfg