* Convert the price to numeric format
destring price, replace ignore("$,")

* Convert the reviews rating to numeric format, converting NAs to missing values
destring review_scores_rating, replace ignore("NA")

* Convert the host response rate to numeric format, but previously removing values which placed in this column by mistake
gen letters_response = regexm(host_response_rate, "[A-Za-z]")
drop if letters_response == 1
drop letters_response
destring host_response_rate, replace ignore("%")

* Replace "f" and "t" by 0 and 1
replace host_identity_verified = "0" if host_identity_verified == "f"
replace host_identity_verified = "1" if host_identity_verified == "t"

destring host_identity_verified, replace