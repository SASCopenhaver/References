select distinct
 (select DECODE(c.score, 'N', 6, 'U', 7, c.score) from checklist_3 c where c.eval_item_id = 1  and c.project_number = c3.project_number) as Q_101
,(select DECODE(c.score, 'N', 6, 'U', 7, c.score) from checklist_3 c where c.eval_item_id = 2  and c.project_number = c3.project_number) as Q_102
,(select DECODE(c.score, 'N', 6, 'U', 7, c.score) from checklist_3 c where c.eval_item_id = 3  and c.project_number = c3.project_number) as Q_103
,(select DECODE(c.score, 'N', 6, 'U', 7, c.score) from checklist_3 c where c.eval_item_id = 4  and c.project_number = c3.project_number) as Q_104
,(select DECODE(c.score, 'N', 6, 'U', 7, c.score) from checklist_3 c where c.eval_item_id = 5  and c.project_number = c3.project_number) as Q_105
,(select DECODE(c.score, 'N', 6, 'U', 7, c.score) from checklist_3 c where c.eval_item_id = 6  and c.project_number = c3.project_number) as Q_106
,(select DECODE(c.score, 'N', 6, 'U', 7, c.score) from checklist_3 c where c.eval_item_id = 7  and c.project_number = c3.project_number) as Q_107
,(select DECODE(c.score, 'N', 6, 'U', 7, c.score) from checklist_3 c where c.eval_item_id = 8  and c.project_number = c3.project_number) as Q_108
,(select DECODE(c.score, 'N', 6, 'U', 7, c.score) from checklist_3 c where c.eval_item_id = 9  and c.project_number = c3.project_number) as Q_109
,(select DECODE(c.score, 'N', 6, 'U', 7, c.score) from checklist_3 c where c.eval_item_id = 10 and c.project_number = c3.project_number) as Q_110
,(select DECODE(c.score, 'N', 6, 'U', 7, c.score) from checklist_3 c where c.eval_item_id = 11 and c.project_number = c3.project_number) as Q_111
,(select DECODE(c.score, 'N', 6, 'U', 7, c.score) from checklist_3 c where c.eval_item_id = 12 and c.project_number = c3.project_number) as Q_112
,(select DECODE(c.score, 'N', 6, 'U', 7, c.score) from checklist_3 c where c.eval_item_id = 13 and c.project_number = c3.project_number) as Q_113
,(select DECODE(c.score, 'N', 6, 'U', 7, c.score) from checklist_3 c where c.eval_item_id = 14 and c.project_number = c3.project_number) as Q_114
,(select DECODE(c.score, 'N', 6, 'U', 7, c.score) from checklist_3 c where c.eval_item_id = 15 and c.project_number = c3.project_number) as Q_115
,(select DECODE(c.score, 'N', 6, 'U', 7, c.score) from checklist_3 c where c.eval_item_id = 16 and c.project_number = c3.project_number) as Q_116
,(select DECODE(c.score, 'N', 6, 'U', 7, c.score) from checklist_3 c where c.eval_item_id = 17 and c.project_number = c3.project_number) as Q_117
,(select DECODE(c.score, 'N', 6, 'U', 7, c.score) from checklist_3 c where c.eval_item_id = 18 and c.project_number = c3.project_number) as Q_118
,(select DECODE(c.score, 'N', 6, 'U', 7, c.score) from checklist_3 c where c.eval_item_id = 19 and c.project_number = c3.project_number) as Q_119
,(select DECODE(c.score, 'N', 6, 'U', 7, c.score) from checklist_3 c where c.eval_item_id = 20 and c.project_number = c3.project_number) as Q_120
,(select DECODE(c.score, 'N', 6, 'U', 7, c.score) from checklist_3 c where c.eval_item_id = 21 and c.project_number = c3.project_number) as Q_121
,(select DECODE(c.score, 'N', 6, 'U', 7, c.score) from checklist_3 c where c.eval_item_id = 22 and c.project_number = c3.project_number) as Q_122
,(select DECODE(c.score, 'N', 6, 'U', 7, c.score) from checklist_3 c where c.eval_item_id = 23 and c.project_number = c3.project_number) as Q_123
,(select DECODE(c.score, 'N', 6, 'U', 7, c.score) from checklist_3 c where c.eval_item_id = 24 and c.project_number = c3.project_number) as Q_124
,(select DECODE(c.score, 'N', 6, 'U', 7, c.score) from checklist_3 c where c.eval_item_id = 25 and c.project_number = c3.project_number) as Q_125
,(select DECODE(c.score, 'N', 6, 'U', 7, c.score) from checklist_3 c where c.eval_item_id = 26 and c.project_number = c3.project_number) as Q_126
,(select DECODE(c.score, 'N', 6, 'U', 7, c.score) from checklist_3 c where c.eval_item_id = 27 and c.project_number = c3.project_number) as Q_127
from checklist_3 c3
where c3.project_number = 'E/VGF-2003-0098'
