// Set the date we're counting down to
const launchTimer = () => {
  const timerFlash = document.getElementById('timerFlash');

  if (timerFlash) {
    const expirationLimit = timerFlash.dataset.expiration
    const dateCreatedAt = timerFlash.dataset.created
    var countDownDate = new Date(dateCreatedAt);
    const dateExpiration = new Date(countDownDate.getTime() + expirationLimit*60000);

    // Update the count down every 1 second
    var x = setInterval(function() {

      // Get today's date and time
      var now = new Date().getTime();

      // Find the distance between now and the count down date
      var distance = dateExpiration - now;

      // Time calculations for days, hours, minutes and seconds
      var days = Math.floor(distance / (1000 * 60 * 60 * 24));
      var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
      var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
      var seconds = Math.floor((distance % (1000 * 60)) / 1000);

      // Display the result in the element with id="demo"
      const countDown = document.getElementById("countDown");

      if (countDown) {
        countDown.innerHTML = minutes + "m " + seconds + "s ";
        if (distance < 0) {
          clearInterval(x);
          document.getElementById("countDown").innerHTML = "EXPIRED";
          document.location.href="/";
        }
      }
      // If the count down is finished, write some text
    }, 1000);
  }
}

export { launchTimer };
