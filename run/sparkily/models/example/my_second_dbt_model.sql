USE [Sparkily];
    
    

    

    
    USE [Sparkily];
    EXEC('
        create view "dev"."my_second_dbt_model__dbt_tmp" as -- Use the `ref` function to select from other models

select *
from "Sparkily"."dev"."my_first_dbt_model"
where id = 1;
    ')

