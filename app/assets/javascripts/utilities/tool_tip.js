document.addEventListener('turbolinks:load', function() {
  var email = document.querySelector('#user_email')

  if (email) {
    email.addEventListener('mouseover', ()=> {
      let hint = document.querySelector('#tooltip')
      hint.classList.remove('hide')
      // sleep(1000)
    })
    email.addEventListener('mouseout', ()=> {
      var hint = document.querySelector('#tooltip')
      hint.classList.add('hide')
      // sleep(1000)
    })
  }
})

function sleep(millis) {
    var t = (new Date()).getTime();
    var i = 0;
    while (((new Date()).getTime() - t) < millis) {
        i++;
    }
}
