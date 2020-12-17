-- Giver en liste over tilflyttere i en given periode. Husk at ændre f.DatoTil!

SELECT 
  	RIGHT('0000000000' + CAST(p.PNR AS varchar), 10) AS cpr,
  	c.Adresseringsnavn AS navn,
  	c.CO_Navn AS co_navn,
  	c.Standardadresse AS adresse,
  	CONCAT_WS(' ', c.POSTNR, c.Postdistrikt) AS postdistrikt
  FROM cpr.Kom_Personer_basis p
  INNER JOIN cpr.Kom_FlytningerFraTil f
  ON p.PNR = f.PNR 
  INNER JOIN LOIS.dbo.CPR_AktivView c
  ON p.PNR = c.CPR 
  WHERE p.Aktuel = 1 
  	AND f.DatoTil >= '2020-08-01' 
  	AND f.DatoTil < '2020-12-01'
  	AND f.Tilflytter = 1
  	AND p.alder >= 18
