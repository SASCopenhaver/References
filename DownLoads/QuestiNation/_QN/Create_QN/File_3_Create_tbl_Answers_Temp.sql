-- Create table
create table ANSWERS_TEMP
(
  PARTICIPANT_ID NUMBER(10) not null,
  REASERCH_ID    NUMBER(10) not null,
  Q1             NUMBER(10) default -10 not null,
  Q2             NUMBER(10) default -10 not null,
  Q3             NUMBER(10) default -10 not null,
  Q4             NUMBER(10) default -10 not null,
  Q5             NUMBER(10) default -10 not null,
  Q6             NUMBER(10) default -10 not null,
  Q7             NUMBER(10) default -10 not null,
  Q8             NUMBER(10) default -10 not null,
  Q9             NUMBER(10) default -10 not null,
  Q10            NUMBER(10) default -10 not null,
  Q11            NUMBER(10) default -10 not null,
  Q12            NUMBER(10) default -10 not null,
  Q13            NUMBER(10) default -10 not null,
  Q14            NUMBER(10) default -10 not null,
  Q15            NUMBER(10) default -10 not null,
  Q16            NUMBER(10) default -10 not null,
  Q17            NUMBER(10) default -10 not null,
  Q18            NUMBER(10) default -10 not null,
  Q19            NUMBER(10) default -10 not null,
  Q20            NUMBER(10) default -10 not null,
  Q21            NUMBER(10) default -10 not null,
  Q22            NUMBER(10) default -10 not null,
  Q23            NUMBER(10) default -10 not null,
  Q24            NUMBER(10) default -10 not null,
  Q25            NUMBER(10) default -10 not null,
  Q26            NUMBER(10) default -10 not null,
  Q27            NUMBER(10) default -10 not null,
  Q28            NUMBER(10) default -10 not null,
  Q29            NUMBER(10) default -10 not null,
  Q30            NUMBER(10) default -10 not null,
  Q31            NUMBER(10) default -10 not null,
  Q32            NUMBER(10) default -10 not null,
  Q33            NUMBER(10) default -10 not null,
  Q34            NUMBER(10) default -10 not null,
  Q35            NUMBER(10) default -10 not null,
  Q36            NUMBER(10) default -10 not null,
  Q37            NUMBER(10) default -10 not null,
  Q38            NUMBER(10) default -10 not null,
  Q39            NUMBER(10) default -10 not null,
  Q40            NUMBER(10) default -10 not null,
  Q41            NUMBER(10) default -10 not null,
  Q42            NUMBER(10) default -10 not null,
  ANSWER_STATUS  CHAR(2) default 'N' not null
)
;