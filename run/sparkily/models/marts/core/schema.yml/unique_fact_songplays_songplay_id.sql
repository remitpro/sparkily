
  
  

  
  USE [Sparkily];
  EXEC('create view 

    [dbt_test__audit.testview_bee99ffb94ace07ff51b5397e2b8269f]
   as 
    
    

select
    songplay_id as unique_field,
    count(*) as n_records

from "Sparkily"."dw"."fact_songplays"
where songplay_id is not null
group by songplay_id
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

    [dbt_test__audit.testview_bee99ffb94ace07ff51b5397e2b8269f]
  
  ) dbt_internal_test;

  USE [Sparkily];
  EXEC('drop view 

    [dbt_test__audit.testview_bee99ffb94ace07ff51b5397e2b8269f]
  ;')