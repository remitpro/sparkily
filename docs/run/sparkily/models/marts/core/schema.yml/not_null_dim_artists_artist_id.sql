
  
  

  
  USE [Sparkily];
  EXEC('create view 

    [dbt_test__audit.testview_e76cf34c202fc82b44bb708ac0f8b406]
   as 
    
    



select artist_id
from "Sparkily"."dw"."dim_artists"
where artist_id is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_e76cf34c202fc82b44bb708ac0f8b406]
  
  ) dbt_internal_test;

  USE [Sparkily];
  EXEC('drop view 

    [dbt_test__audit.testview_e76cf34c202fc82b44bb708ac0f8b406]
  ;')