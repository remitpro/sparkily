
  
  

  
  USE [Sparkily];
  EXEC('create view 

    [dbt_test__audit.testview_e984ae15873a323438ae6ce380b9b475]
   as 
    
    

select
    artist_id as unique_field,
    count(*) as n_records

from "Sparkily"."dw"."dim_artists"
where artist_id is not null
group by artist_id
having count(*) > 1


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_e984ae15873a323438ae6ce380b9b475]
  
  ) dbt_internal_test;

  USE [Sparkily];
  EXEC('drop view 

    [dbt_test__audit.testview_e984ae15873a323438ae6ce380b9b475]
  ;')