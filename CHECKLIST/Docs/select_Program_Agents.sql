select  po.po_person_id        as PersonID
       ,per.per_sort_name      as PersonFullName
       ,o1.org_organization_id as PersonOrgID
 from usia.person_organization po
      ,usia.organization o1
      ,usia.person per
 
 where     per.per_person_id = po.po_person_id
       and per.per_sort_name is not null
       and po.po_status = 'A'
       and po.po_primary = 'Y'
       and o1.org_organization_id = po.po_organization_id
       and po.po_organization_id in 
(
select distinct 
       ppa.ppa_program_agency--,
       --o.org_title
 from usia.project_program_agency ppa,
      usia.organization o
 where     o.org_organization_id = ppa.ppa_program_agency
       and o.org_title NOT LIKE ('ECA%')
 --order by 1
 )