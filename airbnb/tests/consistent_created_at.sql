select
    r.listing_id,
    r.review_date as review_created_at,
    l.created_at as listing_created_at
from {{ ref('fct_reviews') }} r
join {{ ref('dim_listings_cleansed') }} l
    on r.listing_id = l.listing_id
where r.review_date < l.created_at