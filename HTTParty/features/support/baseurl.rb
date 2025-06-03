module Employee 
    include HTTParty
    base_uri 'http://dummy.restapiexample.com/api/v1'
    format :json
    headers 'Content-Type': 'application/json', 'Authorization': 'Bearer Valor Do Token'
end    
