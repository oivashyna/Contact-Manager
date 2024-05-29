const urlBase = 'http://olga-cop4331.com/LAMPAPI';
const extension = 'php';

let userId = 0;
let firstName = "";
let lastName = "";

function doLogin() {
    userId = 0;
    firstName = "";
    lastName = "";

    let login = document.getElementById("loginName").value;
    let password = document.getElementById("loginPassword").value;
    let hash = md5(password); // Hash the password using MD5

    document.getElementById("loginResult").innerHTML = "";

    let tmp = { login: login, password: hash };
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
}

function doLogout() {
    userId = 0;
    firstName = "";
    lastName = "";
    document.cookie = "firstName= ; expires = Thu, 01 Jan 1970 00:00:00 GMT";
    window.location.href = "index.html";
}

function addContact() {
    // Get the input values from the edit-table
    let firstName = document.getElementById("first-name").value;
    let lastName = document.getElementById("last-name").value;
    let email = document.getElementById("email").value;
    let phoneNumber = document.getElementById("phone").value;

    // Check if any of the required fields are empty
    if (firstName === "" || lastName === "" || email === "" || phoneNumber === "") {
        alert("Please fill out all fields.");
        return;
    }

    // Get the table body element
    let tableBody = document.getElementById('table-body');

    // Create a new row
    let newRow = tableBody.insertRow();
    newRow.setAttribute('data-contact-id', Date.now()); // Assign a unique ID based on current timestamp

    // Create cells for the contact data
    let firstNameCell = newRow.insertCell();
    let lastNameCell = newRow.insertCell();
    let emailCell = newRow.insertCell();
    let phoneCell = newRow.insertCell();
    let dateCreatedCell = newRow.insertCell();
    let actionCell = newRow.insertCell(); // Add action cell for delete button

    // Fill the cells with the input values
    firstNameCell.textContent = firstName;
    lastNameCell.textContent = lastName;
    emailCell.textContent = email;
    phoneCell.textContent = phoneNumber;

    // Get the current date and format it
    let currentDate = new Date();
    let formattedDate = currentDate.toLocaleDateString('en-US', { year: 'numeric', month: 'long', day: 'numeric' });
    dateCreatedCell.textContent = formattedDate;

    // Create delete button
    let deleteButton = document.createElement('button');
    deleteButton.textContent = 'Delete';
    deleteButton.addEventListener('click', function() {
        deleteContact(newRow.getAttribute('data-contact-id'));
    });

    // Append the delete button to the action cell
    actionCell.appendChild(deleteButton);

    // Add event listener to fill up the edit-table with contact's information when clicked
    newRow.addEventListener('click', function() {
        fillEditTable(this);
    });

    // Clear the input fields
    document.getElementById("first-name").value = '';
    document.getElementById("last-name").value = '';
    document.getElementById("email").value = '';
    document.getElementById("phone").value = '';

    // Prepare JSON payload to send to the server (if needed)
    let tmp = { newFirstName: firstName, newLastName: lastName, emailAddress: email, phoneNumber: phoneNumber, userId: ID };
    let jsonPayload = JSON.stringify(tmp);

    // Send data to the server (if needed)
    let url = urlBase + '/AddContact.' + extension;
    let xhr = new XMLHttpRequest();
    xhr.open("POST", url, true);
    xhr.setRequestHeader("Content-type", "application/json; charset=UTF-8");
    try {
        xhr.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                document.getElementById("contactAddResult").innerHTML = "Contact has been added";
            }
        };
        xhr.send(jsonPayload);
    } catch (err) {
        document.getElementById("contactAddResult").innerHTML = err.message;
    }
}

function editContact(id) {
    // Find the row with the given contactId and edit the contact details
    const row = document.querySelector(`[data-contact-id='${id}']`);
    if (row) {
        // Populate the form with existing values for editing
        document.getElementById('first-name').value = row.cells[0].innerText;
        document.getElementById('last-name').value = row.cells[1].innerText;
        document.getElementById('email').value = row.cells[2].innerText;
        document.getElementById('phone').value = row.cells[3].innerText;

        // Remove the existing row (optional, based on your edit logic)
        row.remove();
    }
}

function deleteContact(id) {
    // Find the row with the given contactId and remove it from the table
    const row = document.querySelector(`[data-contact-id='${id}']`);
    if (row) {
        row.remove();
    }
}

function fillEditTable(row) {
    // Populate the form with existing values for editing
    document.getElementById('first-name').value = row.cells[0].innerText;
    document.getElementById('last-name').value = row.cells[1].innerText;
    document.getElementById('email').value = row.cells[2].innerText;
    document.getElementById('phone').value = row.cells[3].innerText;

    // Optionally, you can set a hidden field or some indicator for the current editing row
    document.getElementById('edit-id').value = row.getAttribute('data-contact-id');
}
