
  
  

  
  USE [Sparkily];
  EXEC('create view 

    [dbt_test__audit.testview_2b857771fcb47309428b9e4da06b59ee]
   as 
    
    



select songplay_id
from "Sparkily"."dw"."fact_songplays"
where songplay_id is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_2b857771fcb47309428b9e4da06b59ee]
  
  ) dbt_internal_test;

  USE [Sparkily];
  EXEC('drop view 

    [dbt_test__audit.testview_2b857771fcb47309428b9e4da06b59ee]
  ;')