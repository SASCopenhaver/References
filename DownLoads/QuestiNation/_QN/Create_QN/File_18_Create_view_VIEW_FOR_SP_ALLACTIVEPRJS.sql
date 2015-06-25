CREATE OR REPLACE VIEW VIEW_FOR_SP_ALLACTIVEPRJS AS
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
  DECODE((PACK_FUNC.f_countAnswrs(rd.IDS)
          --SELECT COUNT(*) 
          --FROM ANSWERS a 
          --WHERE a.REASERCH_ID = rd.IDS
          ), 
          /*if*/0, /*then*/'NA',
          /*else*/
          PACK_FUNC.f_getOrgID(rd.ids)
          /*
          (SELECT TO_CHAR(o.IDS)
            FROM ORGANIZATIONS o
            WHERE o.IDS = (SELECT p.ORG_ID
                            FROM USERS p
                            WHERE p.IDS = (SELECT a.PARTICIPANT_ID
                                            FROM ANSWERS a
                                            WHERE a.REASERCH_ID = rd.IDS 
                                            and 
                                            ROWNUM = 1
                                           )
                          )
          )
          */
        ) AS OrgID,
  -------------------------------
  DECODE((PACK_FUNC.f_countAnswrs(rd.IDS)
          --SELECT COUNT(*) 
          -- FROM ANSWERS a 
          -- WHERE a.REASERCH_ID = rd.IDS
         ),
         0, '(not assigned)',
         'assigned to '||Substr( PACK_FUNC.f_getOrgName(rd.ids), 1, Instr( PACK_FUNC.f_getOrgName(rd.ids), ' - '))
                         /*
                         (SELECT o.ABBREVIATION
                           FROM ORGANIZATIONS o
                           WHERE o.IDS = (SELECT p.ORG_ID
                                           FROM USERS p
                                           WHERE p.IDS = (SELECT a.PARTICIPANT_ID
                                                           FROM ANSWERS a
                                                           WHERE a.REASERCH_ID = rd.IDS 
                                                           and 
                                                           ROWNUM = 1
                                                         )
                                         )
                         )
                         */
        ) AS AssignedToOrg
  -------------------------------
  FROM REASERCH_DATES rd
  WHERE ANYBODY_ANSWERED = 'A'
  ORDER BY  TO_DATE(START_DATE, 'MM/DD/YYYY')

