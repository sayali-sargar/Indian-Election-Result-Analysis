-- Indian Election Result Analysis
-- Database: MySQL
-- Author: Sayali Sargar


-- Total Seats

	SELECT 
	  DISTINCT COUNT (Parliament_Constituency) AS Total_Seats
	FROM constituencywise_results;


-- What is the total number of seats available for elections in each state

    SELECT 
      s.State AS State_Name,
      COUNT(cr.Constituency_ID) AS Total_Seats_Available
    FROM 
      constituencywise_results cr
    JOIN 
      statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
    JOIN 
      states s ON sr.State_ID = s.State_ID
    GROUP BY 
      s.State
    ORDER BY 
      s.State;


-- total seats won by NDA Alliance

SELECT 
    SUM(CASE
        WHEN
            party IN ('Bharatiya Janata Party - BJP' , 'Telugu Desam - TDP',
                'Janata Dal  (United) - JD(U)',
                'Shiv Sena - SHS',
                'AJSU Party - AJSUP',
                'Apna Dal (Soneylal) - ADAL',
                'Asom Gana Parishad - AGP',
                'Hindustani Awam Morcha (Secular) - HAMS',
                'Janasena Party - JnP',
                'Janata Dal  (Secular) - JD(S)',
                'Lok Janshakti Party(Ram Vilas) - LJPRV',
                'Nationalist Congress Party  - NCP',
                'Rashtriya Lok Dal - RLD',
                'Sikkim Krantikari Morcha - SKM')
        THEN
            Won
        ELSE 0
    END) AS NDA_total_seats_won 
FROM
    partywise_results;
    

-- seats won by NDA Alliance parties
 
SELECT 
    party AS party_name, won AS seats_won
FROM
    partywise_results
WHERE
    party IN ('Bharatiya Janata Party - BJP' , 'Telugu Desam - TDP',
        'Janata Dal  (United) - JD(U)',
        'Shiv Sena - SHS',
        'AJSU Party - AJSUP',
        'Apna Dal (Soneylal) - ADAL',
        'Asom Gana Parishad - AGP',
        'Hindustani Awam Morcha (Secular) - HAMS',
        'Janasena Party - JnP',
        'Janata Dal  (Secular) - JD(S)',
        'Lok Janshakti Party(Ram Vilas) - LJPRV',
        'Nationalist Congress Party - NCP',
        'Rashtriya Lok Dal - RLD',
        'Sikkim Krantikari Morcha - SKM')
ORDER BY seats_won DESC;
    

-- total seats won by I.N.D.I.A alliance

SELECT 
    SUM(CASE
        WHEN
            party IN ('Indian National Congress - INC' , 'Aam Aadmi Party - AAAP',
                'All India Trinamool Congress - AITC',
                'Bharat Adivasi Party - BHRTADVSIP',
                'Communist Party of India  (Marxist) - CPI(M)',
                'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
                'Communist Party of India - CPI',
                'Dravida Munnetra Kazhagam - DMK',
                'Indian Union Muslim League - IUML',
                'Nat`Jammu & Kashmir National Conference - JKN',
                'Jharkhand Mukti Morcha - JMM',
                'Jammu & Kashmir National Conference - JKN',
                'Kerala Congress - KEC',
                'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
                'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
                'Rashtriya Janata Dal - RJD',
                'Rashtriya Loktantrik Party - RLTP',
                'Revolutionary Socialist Party - RSP',
                'Samajwadi Party - SP',
                'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
                'Viduthalai Chiruthaigal Katchi - VCK')
        THEN
            Won
        ELSE 0
    END) AS INDIA_total_seats_won
FROM
    partywise_results;
    

-- seats won by I.N.D.I.A alliance parties

SELECT 
    party AS party_name, won AS seats_won
FROM
    partywise_results
WHERE
    party IN ('Indian National Congress - INC' , 'Aam Aadmi Party - AAAP',
        'All India Trinamool Congress - AITC',
        'Bharat Adivasi Party - BHRTADVSIP',
        'Communist Party of India  (Marxist) - CPI(M)',
        'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
        'Communist Party of India - CPI',
        'Dravida Munnetra Kazhagam - DMK',
        'Indian Union Muslim League - IUML',
        'Nat`Jammu & Kashmir National Conference - JKN',
        'Jharkhand Mukti Morcha - JMM',
        'Jammu & Kashmir National Conference - JKN',
        'Kerala Congress - KEC',
        'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
        'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
        'Rashtriya Janata Dal - RJD',
        'Rashtriya Loktantrik Party - RLTP',
        'Revolutionary Socialist Party - RSP',
        'Samajwadi Party - SP',
        'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
        'Viduthalai Chiruthaigal Katchi - VCK')
ORDER BY seats_won DESC;


-- add new column field in table partywise_results to get party allianz as NDA ,I.N.D.I.A and Other

alter table partywise_results
add column party_allianz varchar(100);

UPDATE partywise_results 
SET 
    party_allianz = CASE
        WHEN
            party IN ('Bharatiya Janata Party - BJP' , 'Telugu Desam - TDP',
                'Janata Dal  (United) - JD(U)',
                'Shiv Sena - SHS',
                'AJSU Party - AJSUP',
                'Apna Dal (Soneylal) - ADAL',
                'Asom Gana Parishad - AGP',
                'Hindustani Awam Morcha (Secular) - HAMS',
                'Janasena Party - JnP',
                'Janata Dal  (Secular) - JD(S)',
                'Lok Janshakti Party(Ram Vilas) - LJPRV',
                'Nationalist Congress Party - NCP',
                'Rashtriya Lok Dal - RLD',
                'Sikkim Krantikari Morcha - SKM')
        THEN
            'NDA'
        WHEN
            party IN ('Indian National Congress - INC' , 'Aam Aadmi Party - AAAP',
                'All India Trinamool Congress - AITC',
                'Bharat Adivasi Party - BHRTADVSIP',
                'Communist Party of India  (Marxist) - CPI(M)',
                'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
                'Communist Party of India - CPI',
                'Dravida Munnetra Kazhagam - DMK',
                'Indian Union Muslim League - IUML',
                'Jammu & Kashmir National Conference - JKN',
                'Jharkhand Mukti Morcha - JMM',
                'Kerala Congress - KEC',
                'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
                'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
                'Rashtriya Janata Dal - RJD',
                'Rashtriya Loktantrik Party - RLTP',
                'Revolutionary Socialist Party - RSP',
                'Samajwadi Party - SP',
                'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
                'Viduthalai Chiruthaigal Katchi - VCK')
        THEN
            'I.N.D.I.A'
        ELSE 'other'
    END;
    

--Which party alliance (NDA, I.N.D.I.A, or OTHER) won the most seats across all states?

SELECT 
    p.party_alliance,
    COUNT(cr.Constituency_ID) AS Seats_Won
FROM 
    constituencywise_results cr
JOIN 
    partywise_results p ON cr.Party_ID = p.Party_ID
WHERE 
    p.party_alliance IN ('NDA', 'I.N.D.I.A', 'OTHER')
GROUP BY 
    p.party_alliance
ORDER BY 
    Seats_Won DESC;


-- winning candidate's name , their party name, total votes, and margin of victory for a secific state and constituency?

SELECT 
    cr.Winning_Candidate,
    p.Party,
    p.party_allianz,
    cr.Total_Votes,
    cr.Margin,
    cr.Constituency_Name,
    s.State
FROM
    constituencywise_results cr
        JOIN
    partywise_results p ON cr.Party_ID = p.Party_ID
        JOIN
    statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
        JOIN
    states s ON sr.State_ID = s.State_ID
WHERE
    cr.Constituency_Name = 'AGRA'; 


-- what is the distribution of EVM votes versus postal votes for candidate in a specific constituency?
 
SELECT 
    cd.Candidate,
    cd.Party,
    cd.EVM_Votes,
    cd.Postal_Votes,
    cd.Total_Votes,
    cr.Constituency_Name
FROM
    constituencywise_details cd
        JOIN
    constituencywise_results cr ON cd.Constituency_ID = cr.Constituency_ID
WHERE
    cr.Constituency_Name = 'AMROHA';


-- which parties won the most seats in state, and how many seats did each party win? 
 
SELECT 
    p.party, COUNT(cr.Constituency_ID) AS total_seats_won
FROM
    constituencywise_results cr
        JOIN
    partywise_results p ON cr.Party_ID = p.Party_ID
        JOIN
    statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
        JOIN
    states s ON sr.State_ID = s.State_ID
WHERE
    s.State = 'Andhra Pradesh'
GROUP BY p.Party
ORDER BY total_seats_won DESC;
 

-- what is the total number of seats won by each party alliance (NDA ,I.N.D.I.A and Other)in each state for the india elections 2024

SELECT 
    s.State AS State_Name,
    SUM(CASE
    WHEN pr.party_allianz = 'NDA' 
    THEN 1
    ELSE 0
    END) AS NDA_Seats_Won,
    
    SUM(CASE
    WHEN pr.party_allianz = 'I.N.D.I.A'
    THEN 1 
    ELSE 0 
    END) AS INDIA_Seats_Won,

	SUM(CASE
    WHEN pr.party_allianz = 'OTHER'
    THEN 1 
    ELSE 0 
    END) AS OTHER_Seats_Won
FROM 
    constituencywise_results cr
JOIN 
    partywise_results pr ON cr.Party_ID = pr.Party_ID
JOIN 
    statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
JOIN 
    states s ON sr.State_ID = s.State_ID
WHERE 
    pr.party_allianz IN ('NDA', 'I.N.D.I.A',  'OTHER')
GROUP BY 
    s.State
ORDER BY 
    s.State;


-- which candidate received the highest number of ENM votes in each constituency (top=10)?

SELECT 
    cr.Constituency_Name,
    cd.Constituency_ID,
    cd.Candidate,
    cd.EVM_Votes
FROM 
    constituencywise_details cd
JOIN 
    constituencywise_results cr ON cd.Constituency_ID = cr.Constituency_ID
WHERE 
    cd.EVM_Votes = (
        SELECT MAX(cd1.EVM_Votes)
        FROM constituencywise_details cd1
        WHERE cd1.Constituency_ID = cd.Constituency_ID
    )
ORDER BY 
    cd.EVM_Votes DESC
LIMIT 10;


-- which candidate won and which candidate was the runner-up in each constituency of state for 2024 elections? 

with RankedCandidates as(
select
cd.Constituency_ID,
cd.Candidate,
cd.Party,
cd.EVM_Votes,
cd.Postal_votes,
cd.EVM_Votes + cd.Postal_Votes as total_votes,
row_number()over(partition by cd.Constituency_ID order by cd.EVM_Votes + cd.Postal_Votes desc) as VoteRank
from constituencywise_details cd
join constituencywise_results cr on cd.Constituency_ID = cr.Constituency_ID
join statewise_results sr on sr.Parliament_Constituency = cr.Parliament_Constituency
join states s on s.State_ID =sr.State_ID
Where
s.state = 'Maharashtra'
)

select
cr.Constituency_Name,
max(case
 when rc.VoteRank = 1 
 then rc.Candidate 
 end) as winning_candidate,
 
 max(case
 when rc.VoteRank = 2
 then rc.Candidate 
 end) as runnerup_candidate
 
 from RankedCandidates rc
 join constituencywise_results cr on rc.Constituency_ID =cr.Constituency_ID
group by cr.Constituency_Name 
 order by cr.Constituency_Name;


-- for the state of maharashtra , what are the total number of seats , total number of candidates , total number of parties, toatal votes (includeing EVM and postal), and breakdown of EVM  and postal votes?
SELECT 
    COUNT(DISTINCT cr.Constituency_ID) AS total_seats,
    COUNT(DISTINCT cd.Candidate) AS total_candidates,
    COUNT(DISTINCT pr.Party) AS total_parties,
    SUM(cd.EVM_Votes + cd.Postal_Votes) AS total_votes,
    SUM(cd.EVM_Votes) AS total_EVM_votes,
    SUM(cd.Postal_Votes) AS total_postal_votes
FROM
    constituencywise_results cr
        JOIN
    constituencywise_details cd ON cr.Constituency_ID = cd.Constituency_ID
        JOIN
    statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
        JOIN
    states s ON sr.State_ID = s.State_ID
        JOIN
    partywise_results pr ON pr.Party_ID = cr.Party_ID
WHERE
    s.State = 'Maharashtra';






  


