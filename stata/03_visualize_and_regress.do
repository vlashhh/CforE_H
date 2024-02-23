* Filter observations for the price not higher than 50 and review scores not less than 75
keep if price <= 50 & review_scores_rating >= 75

* Distribution of reviews and prices
hist price
graph export "prices.png"

hist review_scores_rating
graph export "reviews.png"

* Scatter plot of number and scores from reviews
scatter number_of_reviews review_scores_rating

* Regress the number of reviews on scores and price
reg number_of_reviews review_scores_rating price 

