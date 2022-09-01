var response = {};

var data = {"access_key": Args.access_key};
if (Args.track_code) {
    data.track_code = Args.track_code;
}
if (Args.add) {
    response.result = API.friends.add(data);
} else {
    response.result = API.friends.delete(data);
}

return response;
