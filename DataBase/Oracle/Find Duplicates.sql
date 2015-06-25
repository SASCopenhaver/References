select area_name, area_width, area_height, screen_id, area_order, area_type, area_alignment, area_style, area_class, tab_name, area_widget_align, frame, default_area 
from sg_area_t a1
where rowid > (select min(rowid) 
                 from sg_area_t a2
                 where a1.area_name = a2.area_name
                   and a1.screen_id = a2.screen_id
              )
;


SELECT col2, col3, count(*)
  FROM tbl_name
GROUP BY col2, col3
HAVING COUNT(*) > 1;