document.addEventListener('turbolinks:load', function() {

  var controls = document.querySelectorAll('.form-inline-link')

  if (controls) {
    for (var i=0; i < controls.length; i++) {
      controls[i].addEventListener('click', formInlineLinkHandler)
    }
  }

  // $('.form-inline-link').on('click', formInlineLinkHandler)

  var errors = document.querySelector('.resource-errors')

  if(errors) {
    var resourceId = errors.dataset.resourceId

    formInlineHandler(resourceId)
  }


})

function formInlineLinkHandler(event) {
  event.preventDefault()

  var testId = this.dataset.testId
  if (testId) {
    formInlineHandler(testId)
  }

}

function formInlineHandler(testId) {
  var link = document.querySelector('.form-inline-link[data-test-id="' + testId + '"]')
  // var testTitle = document.querySelector('.test-title[data-test-id="' + testId + '"]')
  // var formInline = document.querySelector('.form-inline[data-test-id="' + testId + '"]')

  var $testTitle = $('.test-title[data-test-id="' + testId + '"]')
  var $formInline = $('.form-inline[data-test-id="' + testId + '"]')

  // if (formInline.classList.contains('hide')) {
  $formInline.toggle()
  $testTitle.toggle()
  if ($formInline.is(':visible')) {
    // testTitle.classList.add('hide')
    // formInline.classList.remove('hide')
    if(link) {
      link.innerHTML = 'Cancel'//I18n.t('admin.tests.index.inline')
    }
  } else {
    // testTitle.classList.remove('hide')
    // formInline.classList.add('hide')
    if(link) {
      link.innerHTML = 'Edit'
    }
  }

}
