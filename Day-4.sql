
-- Table creation
CREATE TABLE medical_docs_requests (
    request_id INT PRIMARY KEY,
    user_id INT,
    request_date DATE,
    document_id VARCHAR(10)
);

-- Insert sample records
INSERT INTO medical_docs_requests (request_id, user_id, request_date, document_id) VALUES
(101, 512, '2022-02-22', 'A20'),
(102, 512, '2022-02-22', 'A21'),
(103, 634, '2022-03-02', 'A50'),
(104, 634, '2022-03-02', 'A51'),
(105, 512, '2022-02-25', 'A60');
select * from medical_docs_requests;

-- Question 1: Identify Power Users in Veeva

select extract(month from request_date)as mnth,user_id,
count(request_id) as num_reqs 
from medical_docs_requests
group by 1,2
having count(request_id) >2;

 
/*EXPLAINATION:
Here we used extract to get just month out of the request_date(which is in complete date format) 
   then we counted number of requests grouped by month and user_id, filtering for users with more than 2 requests. */
 
