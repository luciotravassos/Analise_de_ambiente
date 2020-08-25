SELECT REQUEST_ID, STATUS_CODE, LOGFILE_NAME, OUTFILE_NAME
  FROM APPS.FND_CONCURRENT_REQUESTS
 WHERE STATUS_CODE = 'E'
   AND TRUNC(request_date) > TRUNC(SYSDATE - 7)
 ORDER BY REQUEST_ID DESC