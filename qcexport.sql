-- For use with ALM QC 12.50
SELECT
b.TS_TEST_ID as "Test ID", b.TS_NAME as "Test Name", b.TS_DESCRIPTION as "Description", b.TS_USER_20 as "Test Priority", a.DS_STEP_NAME as "Step Name", a.DS_DESCRIPTION as "Step Descr.", a.DS_EXPECTED as "Expected Result", c.AL_DESCRIPTION as "Test Folder Name", d.PATH as "Folder Path"
FROM DESSTEPS a, TEST b, ALL_LISTS c, (select AL_ITEM_ID, sys_connect_by_path(al_description,'\') as  PATH from all_lists start with al_description = 'Migrating - Access Gateway - DONE'
connect by prior al_item_id = al_father_id ) d
where a.DS_TEST_ID = b.TS_TEST_ID
and b.TS_SUBJECT = c.AL_ITEM_ID
and d.al_item_id = c.al_item_id
and b.ts_subject in d.al_item_id
order by b.TS_TEST_ID, a.DS_STEP_ORDER