
  
    USE [Sparkily];
    USE [Sparkily];
    
    

    

    
    USE [Sparkily];
    EXEC('
        create view "dev"."my_first_dbt_model__dbt_tmp__dbt_tmp_vw" as /*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/



with source_data as (

    select 1 as id
    union all
    select null as id

)

select *
from source_data

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null;
    ')

EXEC('
            SELECT * INTO "Sparkily"."dev"."my_first_dbt_model__dbt_tmp" FROM "Sparkily"."dev"."my_first_dbt_model__dbt_tmp__dbt_tmp_vw" 
    OPTION (LABEL = ''dbt-sqlserver'');

        ')

    
    EXEC('DROP VIEW IF EXISTS dev.my_first_dbt_model__dbt_tmp__dbt_tmp_vw')



    
    use [Sparkily];
    if EXISTS (
        SELECT *
        FROM sys.indexes with (nolock)
        WHERE name = 'dev_my_first_dbt_model__dbt_tmp_cci'
        AND object_id=object_id('dev_my_first_dbt_model__dbt_tmp')
    )
    DROP index "dev"."my_first_dbt_model__dbt_tmp".dev_my_first_dbt_model__dbt_tmp_cci
    CREATE CLUSTERED COLUMNSTORE INDEX dev_my_first_dbt_model__dbt_tmp_cci
    ON "dev"."my_first_dbt_model__dbt_tmp"

   


  