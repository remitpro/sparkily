
    
    

select
    song_id as unique_field,
    count(*) as n_records

from "Sparkily"."dw"."dim_songs"
where song_id is not null
group by song_id
having count(*) > 1


