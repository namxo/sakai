-- MSGCNTR-708 - change the boolean SENDEMAILOUT functionality to a multiple
-- option setting for finer grained control of email copies of messages

alter table MFR_AREA_T add column SEND_TO_EMAIL int(11) not null DEFAULT 1;

-- set the SEND_TO_EMAIL column equal to the equivalent value for SENDEMAILOUT
update MFR_AREA_T area set area.SEND_TO_EMAIL=0 
where area.SENDEMAILOUT=0 and 
area.TYPE_UUID = (select types.uuid from cmn_type_t types where types.KEYWORD = 'privateForums');