/*Verifica a diferença de patches entre as bases*/
select distinct upper(patch_name) patch
  from apps.ad_applied_patches
minus
select distinct upper(patch_name) patch from apps.ad_applied_patches@m001