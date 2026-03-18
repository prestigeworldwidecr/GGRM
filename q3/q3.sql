/*
	You may run exploratory queries to inspect the data. All tables are preloaded. 
    
	Prompt 
    
	The firm is evaluating whether Workers Compensation cases or Personal Injury cases are more efficient to resolve. 
	Write a query that uses a CTE named settled_stats to calculate, for each settled case: 
	the case_type
	settlement_amount
	the number of days from open_date to close_date (as days_to_settle). 

	Then, in the outer query, combine with the full cases table to return each case_type with:
	total_cases - total number of cases regardless of status 
	settled_count - number of settled cases 
	avg_settlement - average settlement amount rounded to two decimal places 
	avg_days_to_settle - average days to settle, rounded to the nearest whole number 

*/

/*

*/