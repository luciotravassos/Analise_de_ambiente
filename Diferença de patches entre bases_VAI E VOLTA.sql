/* create database link m001 connect to apps identified by h0mo10log using 'QVISAI';
create database link m001 connect to apps identified by gpebs0806 using 'GVISAI'; */

select distinct upper(patch_name) patch
from    apps.ad_applied_patches@m001
minus
select distinct upper(patch_name) patch
from    apps.ad_applied_patches
/
select distinct upper(patch_name) patch
from    apps.ad_applied_patches
minus
select distinct upper(patch_name) patch
from    apps.ad_applied_patches@m001
/
