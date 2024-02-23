* Uploading csv file
import delimited using "\Users\Shatilov_Vladislav\Code\coding_for_economists\homework\CforE_H\stata\Airbnb.csv", clear

* Assuming that we need only those observations where response rate is known and has at least one review
drop if host_response_rate == "N/A" | number_of_reviews == 0

* Keeping only needed columns
keep id host_id host_response_rate price number_of_reviews host_identity_verified review_scores_rating