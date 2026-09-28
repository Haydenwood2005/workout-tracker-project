const apiButton = document.getElementById("apiButton");
const apiStatus = document.getElementById("apiStatus");


apiButton.addEventListener("click", async () => {

    apiStatus.textContent = "Checking API...";

    try {

        const response = await fetch("http://127.0.0.1:8000/health");

        const data = await response.json();

        if (response.ok) {

            apiStatus.textContent =
                "API connected successfully!";

        } else {

            apiStatus.textContent =
                "API returned an error.";

        }

    } catch (error) {

        apiStatus.textContent =
            "Could not connect to API.";

        console.error(error);
    }

});
