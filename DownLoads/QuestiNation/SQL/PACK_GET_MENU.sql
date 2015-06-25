CREATE OR REPLACE  PACKAGE "Q42ADMIN"."PACK_GET_MENU" AS TYPE 
    refc_PackGetMenu IS REF CURSOR;
PROCEDURE sp_getMenu (
                      vAppUserID IN PARTICIPANTS.IDS%TYPE
                     ,varSuperMenuID IN MENUS.SUPER_MENU%TYPE
                     ,v_CursorVar OUT refc_PackGetMenu
                     );
END PACK_GET_MENU;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
CREATE OR REPLACE  PACKAGE BODY "Q42ADMIN"."PACK_GET_MENU" AS  
    PROCEDURE sp_getMenu (
                            vAppUserID IN PARTICIPANTS.IDS%TYPE
                           ,varSuperMenuID IN MENUS.SUPER_MENU%TYPE
                           ,v_CursorVar OUT refc_PackGetMenu
                         )
IS
v_OrgID PARTICIPANTS.Org_ID%TYPE;
v_SuperID PARTICIPANTS.SUPERVISOR_ID%TYPE;

BEGIN

SELECT Org_ID, Supervisor_ID INTO v_OrgID, v_SuperID 
FROM PARTICIPANTS 
WHERE IDS = vAppUserID;

OPEN v_CursorVar FOR
SELECT m.IDS               AS MenuID
      ,m.MENU_ITEM         AS MenuItem
      ,m.MENU_DESCRIPTION  AS MenuDescr
      ,m.PAGE_TO_BE_CALLED AS PageToBeCalled
      ,m.IMG               AS MenuImg
FROM Q42ADMIN.MENUS m
WHERE SUPER_MENU = varSuperMenuID AND 
      MENU_OWNERSHIP = (SELECT DECODE(p.Org_ID,0, 'APPADMIN', DECODE(p.Supervisor_ID, 0, 'SUPERORG','PARTICIPANT'))
                        FROM PARTICIPANTS p 
                        WHERE p.IDS = vAppUserID
                        )
ORDER BY ORDER_TO_BE_PRESENTED;
----------------------------------------------------------------
END sp_getMenu;
END PACK_GET_MENU;