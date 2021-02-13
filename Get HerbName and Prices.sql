SELECT RefNum,HerbName,
(SELECT Price FROM HerbPrice WHERE HerbRefNum = RefNum AND Supplier='Phenix') AS PhoenixPrice,
(SELECT Price FROM HerbPrice WHERE HerbRefNum = RefNum AND Supplier='Balance') AS BalancePrice
FROM AllHerbs INNER JOIN
                      HerbPrice ON AllHerbs.RefNum = HerbPrice.HerbRefNum