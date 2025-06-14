
  
  

  
  USE [Sparkily];
  EXEC('create view 

    [dbt_test__audit.testview_62477b1071a8ba2a789eafedf5d83213]
   as 
    
    

select
    user_id as unique_field,
    count(*) as n_records

from "Sparkily"."dw"."dim_users"
where user_id is not null
group by user_id
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

    [dbt_test__audit.testview_62477b1071a8ba2a789eafedf5d83213]
  
  ) dbt_internal_test;

  USE [Sparkily];
  EXEC('drop view 

    [dbt_test__audit.testview_62477b1071a8ba2a789eafedf5d83213]
  ;')