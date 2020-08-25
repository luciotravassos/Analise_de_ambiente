declare
l_errcode number;
l_errstr varchar2(4000);
begin
FND_SVC_COMPONENT.start_Component(10000, l_errcode, l_errstr);
FND_SVC_COMPONENT.start_Component(10001, l_errcode, l_errstr);
FND_SVC_COMPONENT.start_Component(10002, l_errcode, l_errstr);
FND_SVC_COMPONENT.start_Component(10003, l_errcode, l_errstr);
FND_SVC_COMPONENT.start_Component(10004, l_errcode, l_errstr);
FND_SVC_COMPONENT.start_Component(10005, l_errcode, l_errstr);
FND_SVC_COMPONENT.start_Component(10006, l_errcode, l_errstr);
FND_SVC_COMPONENT.start_Component(10020, l_errcode, l_errstr);
FND_SVC_COMPONENT.start_Component(10021, l_errcode, l_errstr);
FND_SVC_COMPONENT.start_Component(10041, l_errcode, l_errstr);
FND_SVC_COMPONENT.start_Component(10022, l_errcode, l_errstr);
FND_SVC_COMPONENT.start_Component(10023, l_errcode, l_errstr);
FND_SVC_COMPONENT.start_Component(10040, l_errcode, l_errstr);

commit;
end;


declare
l_errcode number;
l_errstr varchar2(4000);
begin
FND_SVC_COMPONENT.stop_Component(10000, l_errcode, l_errstr);
FND_SVC_COMPONENT.stop_Component(10001, l_errcode, l_errstr);
FND_SVC_COMPONENT.stop_Component(10002, l_errcode, l_errstr);
FND_SVC_COMPONENT.stop_Component(10003, l_errcode, l_errstr);
FND_SVC_COMPONENT.stop_Component(10004, l_errcode, l_errstr);
FND_SVC_COMPONENT.stop_Component(10005, l_errcode, l_errstr);
FND_SVC_COMPONENT.stop_Component(10006, l_errcode, l_errstr);
FND_SVC_COMPONENT.stop_Component(10020, l_errcode, l_errstr);
FND_SVC_COMPONENT.stop_Component(10021, l_errcode, l_errstr);
FND_SVC_COMPONENT.stop_Component(10041, l_errcode, l_errstr);
FND_SVC_COMPONENT.stop_Component(10022, l_errcode, l_errstr);
FND_SVC_COMPONENT.stop_Component(10023, l_errcode, l_errstr);
FND_SVC_COMPONENT.stop_Component(10040, l_errcode, l_errstr);

commit;
end;