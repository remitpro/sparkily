
  
  

  
  USE [Sparkily];
  EXEC('create view 

    [dbt_test__audit.testview_639a27bf798de507ee4029b9b4c6532f]
   as 
    
    



select user_id
from "Sparkily"."dw"."dim_users"
where user_id is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_639a27bf798de507ee4029b9b4c6532f]
  
  ) dbt_internal_test;

  USE [Sparkily];
  EXEC('drop view 

    [dbt_test__audit.testview_639a27bf798de507ee4029b9b4c6532f]
  ;')