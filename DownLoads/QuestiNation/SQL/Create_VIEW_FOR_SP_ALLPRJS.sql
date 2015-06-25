CREATE OR REPLACE VIEW VIEW_FOR_SP_ALLPRJS AS
SELECT IDS,
  DESCRIPTIONS,
  TO_CHAR(START_DATE,'MM/DD/YYYY') AS START_DATE,
  TO_CHAR(END_DATE,'MM/DD/YYYY') AS END_DATE,
  ANYBODY_ANSWERED,
  -------------------------------
  'from '||
  TO_CHAR(START_DATE,'MM/DD/YYYY')||
  '  to  '||
  TO_CHAR(END_DATE,'MM/DD/YYYY')||
  '   '||
  (SUBSTR(DESCRIPTIONS, 0, 10))  AS PrjBrfDescr,
  -------------------------------
  DECODE((SELECT COUNT(*) FROM ANSWERS a WHERE rd.IDS=a.REASERCH_ID), 0, 'NA',
                (SELECT TO_CHAR(o.IDS)
                 FROM ORGANIZATIONS o
                 WHERE o.IDS = (SELECT p.ORG_ID
                                FROM USERS p
                                WHERE p.IDS = (SELECT a.PARTICIPANT_ID
                                               FROM ANSWERS a
                                               WHERE ROWNUM = 1 AND rd.IDS = a.REASERCH_ID
                                               )
                                )
                )
        ) AS OrgID,
  -------------------------------
  DECODE((SELECT COUNT(*) FROM ANSWERS a WHERE rd.IDS=a.REASERCH_ID), 0, '(not assigned)',
                'assigned to '||
                (SELECT o.ABBREVIATION
                 FROM ORGANIZATIONS o
                 WHERE o.IDS = (SELECT p.ORG_ID
                                FROM USERS p
                                WHERE p.IDS = (SELECT a.PARTICIPANT_ID
                                               FROM ANSWERS a
                                               WHERE ROWNUM = 1 AND rd.IDS = a.REASERCH_ID
                                               )
                                )
                )
        ) AS AssignedToOrg
  -------------------------------
  FROM REASERCH_DATES rd
  ORDER BY  TO_DATE(START_DATE, 'MM/DD/YYYY');