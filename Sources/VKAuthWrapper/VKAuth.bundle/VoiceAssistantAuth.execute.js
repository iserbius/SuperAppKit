var appId = Args.app_id;
var deviceId = Args.device_id;
var response = {};

response.needServicePolicy = API.account.needServicePolicy({
    "app_id": appId
});

if (response.needServicePolicy) {
    response.appInfo = API.apps.get({
        "app_id": appId
    });
} else {
    response.tokens = API.auth.getCredentialsForApp({
        "app_id": appId
    });
}

response.permissions = API.apps.getDevicePermissions({
    "app_id": appId,
    "device_id": deviceId
});

return response;
