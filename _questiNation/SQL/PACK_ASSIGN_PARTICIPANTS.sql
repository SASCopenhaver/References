CREATE OR REPLACE  PACKAGE "Q42ADMIN"."PACK_ASSIGN_PARTICIPANTS" 
AS TYPE rc_AssignParticipants IS REF CURSOR;

PROCEDURE sp_assignParticipants 
(
  refCursor_ReaserchDates OUT rc_AssignParticipants,
  refCursor_Orgs          OUT rc_AssignParticipants,
  refCursor_Parts         OUT rc_AssignParticipants,
  refCursor_Parts_Answers OUT rc_AssignParticipants
);
END PACK_ASSIGN_PARTICIPANTS;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
CREATE OR REPLACE  PACKAGE BODY "Q42ADMIN"."PACK_ASSIGN_PARTICIPANTS" 
    AS
PROCEDURE sp_assignParticipants
(
  refCursor_ReaserchDates OUT rc_AssignParticipants,
  refCursor_Orgs          OUT rc_AssignParticipants,
  refCursor_Parts         OUT rc_AssignParticipants,
  refCursor_Parts_Answers OUT rc_AssignParticipants
)
IS
BEGIN
-----------------------------------------------------------------------------
OPEN refCursor_ReaserchDates FOR
SELECT 0 AS ReaserchID
      ,'' AS ReaserchDescr
      ,'' AS StartDate
      ,'' AS EndDate
      ,'=== Select Project Dates ===' AS DatesToShow
      ,0 AS OrgID
      ,'' AS IfAssigned
      ,0 AS NumOfAnswers
FROM DUAL
UNION
SELECT IDS AS ReaserchID
      ,rd.DESCRIPTIONS AS ReaserchDescr
      ,TO_CHAR(rd.START_DATE,'MM/DD/YYYY') AS StartDate
      ,TO_CHAR(rd.END_DATE,'MM/DD/YYYY') AS EndDate
      ,'from  '||TO_CHAR(rd.START_DATE,'MM/DD/YYYY')||'  to  '||
        TO_CHAR(rd.END_DATE,'MM/DD/YYYY')||'   '||SUBSTR(rd.DESCRIPTIONS, 0, 10) AS DatesToShow
      ,v.OrgID AS OrgID
      ,DECODE(v.OrgID, -1, ' (not assigned) ', ' (assigned to '||v.OrgName||') ') AS IfAssigned
      ,v.NumOfAnswers
FROM REASERCH_DATES rd, V_RSRCH_ASSIGN_ANSWRD v
WHERE rd.IDS <> 1 AND 
      --SYSDATE < rd.START_DATE AND 
      rd.IDS = v.ReaserchID --AND 
      --rd.ANYBODY_ANSWERED = 'N'
;
-----------------------------------------------------------------------------
OPEN refCursor_Orgs FOR
 SELECT  0 AS OrgID
        ,'=== Select Organization ===' AS OrgToShow
 FROM DUAL
 UNION
 SELECT  IDS AS OrgID
        ,ABBREVIATION||' - '||INITCAP(FULL_NAME) AS OrgToShow
 FROM Q42ADMIN.ORGANIZATIONS
 ORDER BY 1;
-----------------------------------------------------------------------------
OPEN refCursor_Parts FOR
  SELECT IDS             AS PartID
        ,ACT_INACT       AS PartActInact
        ,Org_ID          AS PartOrgID
        ,Supervisor_ID   AS PartSuperID
        ,UPPER(LName)||', '||INITCAP(FName) AS PartFullName
        ,'S'             AS PartST --Participant Source or Target
  FROM Q42ADMIN.PARTICIPANTS
  WHERE Supervisor_ID <> 100000 AND Supervisor_ID <> 0
  ORDER BY  LName
  ;
-----------------------------------------------------------------------------
OPEN refCursor_Parts_Answers FOR
 SELECT  a.REASERCH_ID AS RID
        ,a.PARTICIPANT_ID AS PID
 FROM ANSWERS a, REASERCH_DATES rd
 WHERE rd.IDS <> 1 AND 
      SYSDATE < rd.START_DATE AND 
      rd.IDS = a.REASERCH_ID AND 
      rd.ANYBODY_ANSWERED = 'N'
 ORDER BY 1;
 
-----------------------------------------------------------------------------
END sp_assignParticipants;
END pack_assign_participants;