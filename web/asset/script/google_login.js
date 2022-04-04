function onSignIn(googleUser) {
    signOut();
    var profile = googleUser.getBasicProfile();
    var id = profile.getId();
    var name = !profile.getName() ? "" : profile.getName();
    var image = !profile.getImageUrl() ? "" : profile.getImageUrl();
    var email = (!profile.getEmail()) ? "" : profile.getEmail();
    var family_name = !profile.getFamilyName() ? "" : profile.getFamilyName();
    var given_name = !profile.getGivenName() ? "" : profile.getGivenName();
    post_to_url("login/google",
            {submit: "submit", id: id, name: name, email: email, family_name: family_name, given_name: given_name});
}
function post_to_url(path, params, method) {
    method = method || "post";

    var form = document.createElement("form");

    //Move the submit function to another variable
    //so that it doesn't get overwritten.
    form._submit_function_ = form.submit;

    form.setAttribute("method", method);
    form.setAttribute("action", path);

    for (var key in params) {
        var hiddenField = document.createElement("input");
        hiddenField.setAttribute("type", "hidden");
        hiddenField.setAttribute("name", key);
        hiddenField.setAttribute("value", params[key]);

        form.appendChild(hiddenField);
    }

    document.body.appendChild(form);
    form._submit_function_(); //Call the renamed function.
}
function signOut() {
    var auth2 = gapi.auth2.getAuthInstance();
    auth2.signOut().then(function () {
        console.log('User signed out.');
        auth2.disconnect();
    });
}