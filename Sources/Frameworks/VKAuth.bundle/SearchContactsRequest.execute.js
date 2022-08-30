var fields = "photo_200,city";
var response = {};

response.contacts = API.account.searchContacts({"fields": fields,
                                               "contacts": Args.contacts,
                                               "search_only": 0,
                                               "start_from": 0,
                                               "count": 100});

return response;
