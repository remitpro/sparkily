
  
  

  
  USE [Sparkily];
  EXEC('create view 

    [dbt_test__audit.testview_d254810690311551bbc7e294b9a4e77d]
   as 
    
    

select
    song_id as unique_field,
    count(*) as n_records

from "Sparkily"."dw"."dim_songs"
where song_id is not null
group by song_id
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

    [dbt_test__audit.testview_d254810690311551bbc7e294b9a4e77d]
  
  ) dbt_internal_test;

  USE [Sparkily];
  EXEC('drop view 

    [dbt_test__audit.testview_d254810690311551bbc7e294b9a4e77d]
  ;')