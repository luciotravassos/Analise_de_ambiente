REM $Header: afimchk.sql 115.4 2000/01/10 12:25:09 pkm ship $
REM +======================================================================+
REM |   Copyright (c) 1992 Oracle Corporation Belmont, California, USA     |
REM |                       All rights reserved.                           |
REM +======================================================================+
REM FILENAME
REM   chkvp.sql
REM DESCRIPTION
REM   Checks to see if the Concurrent Manager monitor is actually running
REM
REM          Ram Bhoopalam  Created
REM +======================================================================+

Set Head On
Column Since Format A23
Column PMON  Format A6
Column Status Heading Status
Column Since  Heading Since
Column PMON   Heading Method
Column Status format A47

Select ('Internal Conc Manager is running on - ' || node_name) Status,
        To_Char(P.Last_Update_Date, 'DD-MON-YY HH:MI:SS AM') Since,
	Profile_Option_Value PMON
  from  Fnd_Concurrent_Processes P, FND_V$Process, Fnd_Profile_Options PO,
        Fnd_Profile_Option_Values POV
 where  ( ( Profile_Option_Value != 'OS' And
           (OS_Process_Id     = Spid And Oracle_Process_Id = pid  ) And
           (Concurrent_Queue_Id  = 1 And Queue_Application_ID = 0 ))
       OR ( Profile_Option_Value = 'OS' And
            OS_Process_ID = Spid And
           (Concurrent_Queue_Id  = 1 And Queue_Application_ID = 0 )) )
    And ( PO.Profile_Option_ID = POV.Profile_Option_ID And
          PO.Application_ID    = POV.Application_ID )
    And Profile_Option_Name    = 'CONC_PMON_METHOD'
    And Process_Status_Code = 'A' ;

Set Head Off
Column Logfile_Name Format A50
Column Logfile_name Heading Logfile

Select 'Log File - ' || Logfile_Name 
  from  Fnd_Concurrent_Processes P, FND_V$Process, Fnd_Profile_Options PO,
        Fnd_Profile_Option_Values POV
 where  ( ( Profile_Option_Value != 'OS' And
           (OS_Process_Id     = Spid And Oracle_Process_Id = pid  ) And
           (Concurrent_Queue_Id  = 1 And Queue_Application_ID = 0 ))
       OR ( Profile_Option_Value = 'OS' And
            OS_Process_ID = Spid And
           (Concurrent_Queue_Id  = 1 And Queue_Application_ID = 0 )) )
    And ( PO.Profile_Option_ID = POV.Profile_Option_ID And
          PO.Application_ID    = POV.Application_ID )
    And Profile_Option_Name    = 'CONC_PMON_METHOD'
    And Process_Status_Code = 'A' ;

REM Select 'Sleep interval -' Sleep_Seconds
REM   from  Fnd_Concurrent_Processes P, FND_V$Process, Fnd_Profile_Options PO,
REM        Fnd_Profile_Option_Values POV, Fnd_Concurrent_Queues Q
REM where  Q.Application_ID = P.Queue_Application_ID
REM   And  Q.Concurrent_Queue_ID = P.Concurrent_Queue_ID
REM   And	 ( ( Profile_Option_Value = 'RDBMS' And
REM           (OS_Process_Id     = Spid And Oracle_Process_Id = pid  ) And
REM           (P.Concurrent_Queue_Id  = 1 And Queue_Application_ID = 0 ))
REM       OR ( Profile_Option_Value = 'OS' And
REM            OS_Process_ID = Spid And
REM           (P.Concurrent_Queue_Id  = 1 And Queue_Application_ID = 0 )) )
REM    And ( PO.Profile_Option_ID = POV.Profile_Option_ID And
REM          PO.Application_ID    = POV.Application_ID )
REM    And Profile_Option_Name    = 'CONC_PMON_METHOD'
REM    And Process_Status_Code = 'A' ;
