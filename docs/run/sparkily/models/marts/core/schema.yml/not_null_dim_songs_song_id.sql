
  
  

  
  USE [Sparkily];
  EXEC('create view 

    [dbt_test__audit.testview_d0d1b529ee46d416dacc456121324c20]
   as 
    
    



select song_id
from "Sparkily"."dw"."dim_songs"
where song_id is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_d0d1b529ee46d416dacc456121324c20]
  
  ) dbt_internal_test;

  USE [Sparkily];
  EXEC('drop view 

    [dbt_test__audit.testview_d0d1b529ee46d416dacc456121324c20]
  ;')