SELECT A.APP_SHORT_NAME,A.SUBDIR, A.FILENAME, B.VERSION,b.creation_date
  FROM ad_files A, ad_file_versions B
 WHERE A.FILENAME like 'PABCFCKB.pls'
   AND A.FILE_ID = B.FILE_ID
   order by version