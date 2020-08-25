SELECT 
CONCURRENT_TIME_PERIOD_NAME,
FROM_WEEK_DAY,
TO_WEEK_DAY,
SPECIFIC_DATE,
DESCRIPTION,
APPLICATION_ID,
START_TIME,
END_TIME,
CONCURRENT_TIME_PERIOD_ID,
CONCURRENT_DAYS_SPEC_METHOD
                FROM 
                FND_CONCURRENT_TIME_PERIODS  
 order by APPLICATION_ID, 
 DECODE(CONCURRENT_TIME_PERIOD_ID, 0, 1, 2), 
 CONCURRENT_TIME_PERIOD_NAME