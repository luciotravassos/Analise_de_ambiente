select 
 REQUEST_ID                                     
,REQUEST_DATE                                   
,REQUESTED_BY                                   
,PHASE_CODE                                     
,STATUS_CODE                                    
,PRIORITY_REQUEST_ID                            
,PRIORITY                                       
,REQUESTED_START_DATE                           
,HOLD_FLAG                                      
,ENFORCE_SERIALITY_FLAG                         
,SINGLE_THREAD_FLAG                             
,HAS_SUB_REQUEST                                
,IS_SUB_REQUEST                                 
,IMPLICIT_CODE                                  
,UPDATE_PROTECTED                               
,QUEUE_METHOD_CODE                              
,ARGUMENT_INPUT_METHOD_CODE                     
,ORACLE_ID                                      
,PROGRAM_APPLICATION_ID                         
,CONCURRENT_PROGRAM_ID                          
,RESPONSIBILITY_APPLICATION_ID                  
,RESPONSIBILITY_ID                              
,NUMBER_OF_ARGUMENTS                            
,NUMBER_OF_COPIES                               
,SAVE_OUTPUT_FLAG                               
,NLS_COMPLIANT                                  
,LAST_UPDATE_LOGIN                              
,NLS_LANGUAGE                                   
,NLS_TERRITORY                                  
,PRINTER                                        
,PRINT_STYLE                                    
,PRINT_GROUP                                    
,REQUEST_CLASS_APPLICATION_ID                   
,CONCURRENT_REQUEST_CLASS_ID                    
,PARENT_REQUEST_ID                              
,CONC_LOGIN_ID                                  
,LANGUAGE_ID                                    
,DESCRIPTION                                    
,REQ_INFORMATION                                
,RESUBMIT_INTERVAL                              
,RESUBMIT_INTERVAL_UNIT_CODE                    
,RESUBMIT_INTERVAL_TYPE_CODE                    
,RESUBMIT_TIME                                  
,RESUBMIT_END_DATE                              
,RESUBMITTED                                    
,CONTROLLING_MANAGER                            
,ACTUAL_START_DATE                              
,ACTUAL_COMPLETION_DATE                         
,COMPLETION_TEXT                                
,OUTCOME_PRODUCT                                
,OUTCOME_CODE                                   
,CPU_SECONDS                                    
,LOGICAL_IOS                                    
,PHYSICAL_IOS                                   
,LOGFILE_NAME                                   
,LOGFILE_NODE_NAME                              
,OUTFILE_NAME                                   
,OUTFILE_NODE_NAME                              
,ARGUMENT_TEXT                                  
,CRM_THRSHLD                                    
,CRM_TSTMP                                      
,CRITICAL                                       
,REQUEST_TYPE                                   
,ORACLE_PROCESS_ID                              
,ORACLE_SESSION_ID                              
,OS_PROCESS_ID                                  
,PRINT_JOB_ID                                   
,OUTPUT_FILE_TYPE                               
,RELEASE_CLASS_APP_ID                           
,RELEASE_CLASS_ID                               
,STALE_DATE                                     
,CANCEL_OR_HOLD                                 
,NOTIFY_ON_PP_ERROR                             
,CD_ID                                          
,REQUEST_LIMIT                                  
,CRM_RELEASE_DATE                               
,POST_REQUEST_STATUS                            
,COMPLETION_CODE                                
,INCREMENT_DATES                                
,RESTART                                        
,ENABLE_TRACE                                   
,RESUB_COUNT                                    
,NLS_CODESET                                    
,OFILE_SIZE                                     
,LFILE_SIZE                                     
,STALE                                          
,SECURITY_GROUP_ID                              
,RESOURCE_CONSUMER_GROUP                        
,EXP_DATE                                       
,QUEUE_APP_ID                                   
,QUEUE_ID                                       
,OPS_INSTANCE                                   
,INTERIM_STATUS_CODE                            
,ROOT_REQUEST_ID                                
,ORIGIN                                         
,NLS_NUMERIC_CHARACTERS                         
,QUEUE_APPLICATION_ID                           
,CONCURRENT_QUEUE_ID                            
,CONCURRENT_QUEUE_NAME                          
,CONTROL_CODE                                   
,PROCESSOR_APPLICATION_ID                       
,CONCURRENT_PROCESSOR_ID                        
,RUNNING_PROCESSES                              
,MAX_PROCESSES                                  
,CACHE_SIZE                                     
,QUEUE_DESCRIPTION                              
,CONCURRENT_PROGRAM_NAME                        
,EXECUTION_METHOD_CODE                          
,ARGUMENT_METHOD_CODE                           
,QUEUE_CONTROL_FLAG                             
,RUN_ALONE_FLAG                                 
,ENABLED_FLAG                                   
,PROGRAM_DESCRIPTION                            
,USER_CONCURRENT_PROGRAM_NAME                   
 REQUEST_DESCRIPTION                            
 from APPS.FND_CONCURRENT_WORKER_REQUESTS 
 WHERE STATUS_CODE ='R'
 AND PHASE_CODE ='R'
 ORDER BY REQUEST_DATE DESC