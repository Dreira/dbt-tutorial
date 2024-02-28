with intl_education as (
  SELECT
    country_code,
    indicator_name,
    indicator_code,
    year
    from `de-sanbox-environment.world_bank_intl_education.international_education`
)
,
country_summary as (
  SELECT
    country_code,
    income_group,
    ppp_survey_year,
    imf_data_dissemination_standard 
    from `de-sanbox-environment.world_bank_intl_education.country_summary`
)
,
final as(
  SELECT
    intl_education.country_code,
    indicator_name,
    indicator_code,
    income_group,
    ppp_survey_year,
    imf_data_dissemination_standard    
from intl_education
left join country_summary on  intl_education.country_code = country_summary.country_code)
select * from final
