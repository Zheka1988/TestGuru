document.addEventListener('turbolinks:load', function() {
  var timerView = document.querySelector('.timer');

  if (timerView) {
    var timeLeft = timerView.dataset.timer;

    var intervalID = setInterval(function() {
      if (timeLeft > 0) {
        timeLeft -= 1;
      } else {
        alert('Time is over!');
        document.querySelector('#check').submit();
        clearInterval(intervalID);
      }

      resultTime = parseInt(timeLeft / 60) + ':' + timeLeft % 60;
      timerView.innerHTML = resultTime;
    }, 1000)
  }
})
