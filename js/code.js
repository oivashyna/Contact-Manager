const urlBase = 'http://cop4331notar.online/LAMPAPI';
const extension = 'php';

let userId = 0;
let firstName = "";
let lastName = "";
const ids = []

//show password
function showPasswordLogin() {
    var passwordField = document.getElementById("loginPassword");
    if (passwordField.type === "password") {
        passwordField.type = "text";
    } else {
        passwordField.type = "password";
    }
}


function doLogin() {
    userId = 0;
    firstName = "";
    lastName = "";

    let login = document.getElementById("loginName").value;
    let password = document.getElementById("loginPassword").value;
    let hash = md5(password); // Hash the password using MD5

    document.getElementById("loginResult").innerHTML = "";

    var tmp = { login: login, password: hash }; //command for debugging
    let jsonPayload = JSON.stringify(tmp);

    let url = urlBase + '/Login.' + extension;

    let xhr = new XMLHttpRequest();
    xhr.open("POST", url, true);
    xhr.setRequestHeader("Content-type", "application/json; charset=UTF-8");
    try {
        xhr.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                let jsonObject = JSON.parse(xhr.responseText);
                userId = jsonObject.id;

                if (userId < 1) {
                    document.getElementById("loginResult").innerHTML = "User/Password combination incorrect";
                    return;
                }

                firstName = jsonObject.firstName;
                lastName = jsonObject.lastName;

                saveCookie();

                window.location.href = "contacts.html";
            }
        };
        xhr.send(jsonPayload);
    } catch (err) {
        document.getElementById("loginResult").innerHTML = err.message;
    }
}

function doRegister() {
     let login = document.getElementById("loginName").value;
     let password = document.getElementById("loginPassword").value;
    let firstName = document.getElementById("firstName").value;
     let lastName = document.getElementById("lastName").value;
     let hash = md5(password); // Hash the password using MD5

     document.getElementById("registerResult").innerHTML = "";

     let tmp = { login: login, password: hash, firstName: firstName, lastName: lastName };
     let jsonPayload = JSON.stringify(tmp);

     let url = urlBase + '/Register.' + extension;

     let xhr = new XMLHttpRequest();
    xhr.open("POST", url, true);
    xhr.setRequestHeader("Content-type", "application/json; charset=UTF-8");
     try {
        xhr.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                 document.getElementById("registerResult").innerHTML = "User has been registered";
                 window.location.href = "contacts.html";
            }
        };
        xhr.send(jsonPayload);
     } catch (err) {
         document.getElementById("registerResult").innerHTML = err.message;
     }
 }

//logout
function doLogout() {
    userId = 0;
    firstName = "";
    lastName = "";
    document.cookie = "firstName= ; expires = Thu, 01 Jan 1970 00:00:00 GMT";
    window.location.href = "index.html";
}

function saveCookie() {
    let minutes = 20;
    let date = new Date();
    date.setTime(date.getTime() + (minutes * 60 * 1000));
    document.cookie = "firstName=" + firstName + ",lastName=" + lastName + ",userId=" + userId + ";expires=" + date.toGMTString();
}

function readCookie() {
    userId = -1;
    let data = document.cookie;
    let splits = data.split(",");
    for (var i = 0; i < splits.length; i++) {
        let thisOne = splits[i].trim();
        let tokens = thisOne.split("=");
        if (tokens[0] == "firstName") {
            firstName = tokens[1];
        }
        else if (tokens[0] == "lastName") {
            lastName = tokens[1];
        }
        else if (tokens[0] == "userId") {
            userId = parseInt(tokens[1].trim());
        }
    }

    if (userId < 0) {
        window.location.href = "index.html";
    }

    else {
        document.getElementById("userName").innerHTML = "Welcome, " + firstName + " " + lastName + "!";
        searchContact();
    }
}

function addContact() {

        // Get the input values from the edit-table
        let firstName = document.getElementById("first-name").value;
        let lastName = document.getElementById("last-name").value;
        let phoneNumber = document.getElementById("phone").value;
        let emailAddress = document.getElementById("email").value;
        
        //phone email format
        const regexP = /[0-9]{3}-[0-9]{3}-[0-9]{4}/;
        const regexE = /[a-z0-9._%+\-]+@[a-z0-9.\-]+\.[a-z]{2,}$/;

        // Check if any of the required fields are empty
        if (firstName === "" || lastName === "" || emailAddress === "" || phoneNumber === "") {
            alert("Please fill out all fields.");
            return;
        }

        // Validate phone number format
        if (!regexP.test(phoneNumber)) {
            console.log("Phone number is not valid");
            alert("Phone number format is not valid. Expected format: xxx-xxx-xxxx");
            return;
        }

        // Validate email format
        if (!regexE.test(emailAddress)) {
            console.log("Email address is not valid");
            alert("Email address format is not valid.");
            return;
        }
        
        // Prepare data for API call
        // let userId = getCookie("userId"); // Assuming userId is stored in a cookie


        // Prepare JSON payload to send to the server (if needed)
        let tmp = { 
            firstName: firstName, 
            lastName: lastName, 
            phoneNumber: phoneNumber, 
            emailAddress: emailAddress, 
            userID: userId
        };

        let jsonPayload = JSON.stringify(tmp);
    
        // Send data to the server (if needed)
        let url = urlBase + '/AddContact.' + extension;
        let xhr = new XMLHttpRequest();
        xhr.open("POST", url, true);
        xhr.setRequestHeader("Content-type", "application/json; charset=UTF-8");

        try {
            xhr.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    document.getElementById("first-name").value = "";
                    document.getElementById("last-name").value = "";
                    document.getElementById("email").value = "";
                    document.getElementById("phone").value = "";
                    document.getElementById("contact-search").value = "";
                    searchContact();
                }
            };
        xhr.send(jsonPayload);
    
        } catch (err) {
            document.getElementById("contactAddResult").innerHTML = err.message;
        }
    }


// Function to get a cookie value by name
function getCookie(name) {
    let cookieArr = document.cookie.split(";");
    for (let i = 0; i < cookieArr.length; i++) {
        let cookiePair = cookieArr[i].split("=");
        if (name == cookiePair[0].trim()) {
            return decodeURIComponent(cookiePair[1]);
        }
    }
    return null;
}

function showTable() {
    var x = document.getElementById("contactForm");
    if (x.style.display === "none") {
        x.style.display = "block";
    } else {
        x.style.display = "none";
    }
}

function editContact(id) {
    document.getElementById("edit_button" + id).style.display = "none";
    document.getElementById("save_button" + id).style.display = "inline-block";

    var firstName = document.getElementById("firstName" + id);
    var lastName = document.getElementById("lastName" + id);
    var email = document.getElementById("email" + id);
    var phone = document.getElementById("phone" + id);

    var namef_data = firstName.innerText;
    var namel_data = lastName.innerText;
    var email_data = email.innerText;
    var phone_data = phone.innerText;

    firstName.innerHTML = "<input type='text' id='namef_text" + id + "' value='" + namef_data + "'>";
    lastName.innerHTML = "<input type='text' id='namel_text" + id + "' value='" + namel_data + "'>";
    email.innerHTML = "<input type='text' id='email_text" + id + "' value='" + email_data + "'>";
    phone.innerHTML = "<input type='text' id='phone_text" + id + "' value='" + phone_data + "'>";
    }

    //save contact
    function saveContact(id) {
        var firstName = document.getElementById("namef_text" + id).value;
        var lastName = document.getElementById("namel_text" + id).value;
        var email = document.getElementById("email_text" + id).value;
        var phone = document.getElementById("phone_text" + id).value;
    
        let tmp = {
            ID: ids[id],
            firstName: firstName,
            lastName: lastName,
            phoneNumber: phone,
            emailAddress: email
        };
    
        let jsonPayload = JSON.stringify(tmp);
    
        let url = urlBase + '/EditContact.' + extension;
    
        let xhr = new XMLHttpRequest();
        xhr.open("POST", url, true);
        xhr.setRequestHeader("Content-type", "application/json; charset=UTF-8");
        try {
            xhr.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    console.log("Contact has been updated");
                    document.getElementById("firstName" + id).innerHTML = firstName;
                    document.getElementById("lastName" + id).innerHTML = lastName;
                    document.getElementById("email" + id).innerHTML = email;
                    document.getElementById("phone" + id).innerHTML = phone;
                    document.getElementById("edit_button" + id).style.display = "inline-block";
                    document.getElementById("save_button" + id).style.display = "none";
                }
            };
            xhr.send(jsonPayload);
        } catch (err) {
            console.log(err.message);
        }
    }

function deleteContact(contactID) {
    if(confirm("Are you sure you want to delete this contact?")){
        var tmp = {
            ID : contactID
        };
        
        var jsonPayload = JSON.stringify(tmp);
        var url = urlBase + '/DeleteContact.' + extension;
        var xhr = new XMLHttpRequest();
        xhr.open("POST", url, true);
        xhr.setRequestHeader("Content-type", "application/json; charset=UTF-8");

        xhr.onreadystatechange = function () {
            if(this.readyState == 4 && this.status == 200){
                console.log("Contact deleted successfully.");
                searchContact();
            }
            else{
                console.log("Error while deleting " + contactID);
            }
        };
        xhr.send(jsonPayload);
    }
}


function fillEditTable(row) {
    // Populate the form with existing values for editing
    // document.getElementById('first-name').value = row.cells[0].innerText;
    // document.getElementById('last-name').value = row.cells[1].innerText;
    // document.getElementById('email').value = row.cells[2].innerText;
    // document.getElementById('phone').value = row.cells[3].innerText;

    // // Optionally, you can set a hidden field or some indicator for the current editing row
    // document.getElementById('edit-id').value = row.getAttribute('data-contact-id');

    const form = document.getElementById("contactForm");
    if (form.style.display === 'none') {
        form.style.display = 'block';
    } else {
        form.style.display = 'none';
    }
}

function searchContact() {

    let srch = document.getElementById("contact-search").value;
    let tmp = {
        search: srch,
        userID: userId
    };

    let jsonPayload = JSON.stringify(tmp);

    let url = urlBase + '/SearchContact.' + extension;
    let xhr = new XMLHttpRequest();
    xhr.open("POST", url, true);
    xhr.setRequestHeader("Content-type", "application/json; charset=UTF-8");

    try {
        xhr.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                let jsonObject = JSON.parse(xhr.responseText);

                if (jsonObject.error) {
                    console.log(jsonObject.error);
                    document.getElementById("table-body").innerHTML = "<p> No Contacts Found. </p>";
                    return;
                } 
                else 
                {
                    let text = "<table border='1'>";
                    for (let i = 0; i < jsonObject.results.length; i++) 
                    {
                        ids[i] = jsonObject.results[i].ID;

                        text += "<tr id='row" + i + "'>";
                        text += "<td id='firstName" + i + "'><span>" + jsonObject.results[i].FirstName + "</span></td>";
                        text += "<td id='lastName" + i + "'><span>" + jsonObject.results[i].LastName + "</span></td>";
                        text += "<td id='email" + i + "'><span>" + jsonObject.results[i].EmailAddress + "</span></td>";
                        text += "<td id='phone" + i + "'><span>" + jsonObject.results[i].PhoneNumber + "</span></td>";
                        text += "<td><button id='edit_button" + i + "' class='edit-button' ><img src= 'images/edit_button.png' width= '25' height= '25' alt= 'Edit button' onclick='editContact(" + i + ")'></button>";
                        text += "<button id='save_button" + i + "' class='edit-button' style='display:none;'><img src= 'images/save button.png' width= '25' height= '25' alt= 'Save button'onclick='saveContact(" + i + ")' ></button></td>";
                        text += "<td><button class='delete_button'> <img src= 'images/delete_button.png' width= '25' height= '25' alt= 'Delete button' onclick='deleteContact(" + ids[i] + ")'></button></td>";
                        text += "</tr>";
                    }
                    text += "</table>";
                    document.getElementById("table-body").innerHTML = text;
                }
            }
        };
        xhr.send(jsonPayload);
    } catch (err) {
        console.log(err.message);
    }
}
