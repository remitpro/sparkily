
    
    

select
    songplay_id as unique_field,
    count(*) as n_records

from "Sparkily"."dw"."fact_songplays"
where songplay_id is not null
group by songplay_id
having count(*) > 1


