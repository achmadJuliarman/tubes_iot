<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Automatic Watering Plant</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  </head>
  <body>
    <div class="container">
      <div class="container text-center"><h1>TUBES IOT</h1></div>
        <div class="container bg-dark mt-3" style="border-radius: 30px;">
          <div class="d-flex text-center">
            <div class="container p-2">
              <div class="card m-3 bg-dark">
                <h4 class="card-body fw-bold text-white d-flex flex-column">
                  <div class="mois mb-4 d-flex justify-content-center">
                    <img src="icons/moisture.png" alt="mois" style="width: 10%;"> 
                    <h4 id="mois" class="align-self-center mx-4">Moisture --</h4>
                  </div>
                  <div class="humidity mb-4 d-flex justify-content-center">
                    <img src="icons/humidity.png" alt="mois" style="width: 10%;">
                    <h4 id="hum" class="align-self-center mx-4">Humidity --</h4>
                  </div>
                  <div class="temperature mb-4 d-flex justify-content-center">
                    <img src="icons/temperature.png" alt="mois" style="width: 10%;">
                    <h4 id="temp" class="align-self-center mx-4">Temperature --</h4>
                  </div>
                </h4>
                <h4 class="card-body fw-bold text-warning">DC Pump Status <h4 id="status" class="text-primary"></h4></h4>
              </div>
            </div>
        </div>
      </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script>
      setInterval(() => {
        fetch(`http://localhost/tubesIOT/api/realtime`, {
          headers: {
            'Content-Type': 'application/json'
          }
        })
          .then((response) => {
            return response.json();
          })
          .then((data) => {
            console.log(data);
            document.getElementById("mois").innerHTML = "Moisture " + data[0]["moisture"] + " %";
            document.getElementById("hum").innerHTML = "Humidity " + data[0]["humidity"] + " %";
            document.getElementById("temp").innerHTML = "Temperature " + data[0]["temperature"] + " %";
            let status = "none";
            if (parseInt(data[0]["moisture"]) >= 2500) {
              status = "ON";
            } else {
              status = "OFF";
            }
            console.log(status);
            document.getElementById("status").innerHTML = status;
          });
      }, 500);
    </script>
  </body>
</html>