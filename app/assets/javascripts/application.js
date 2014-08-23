//= require bootstrap.min
//= require_tree .
//= require jquery 
//= require jquery_ujs
//= require jquery.validate
//= require jquery.validate.additional-methods
//= require jquery.clipboard

$.validator.addMethod(
        "regex",
        function(value, element, regexp) {
            var re = new RegExp(regexp);
            return this.optional(element) || re.test(value);
        },
        "Please enter a valid URL (using http)"
);

$('#new_link').ready(function() {
  var password_validator = $('#new_link').validate({
    rules: {
      'link[given_url]': {
        required: true,
        regex: "^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}"
      },
    },
    messages: {
      'link[given_url]': {
        required: 'Please put in a URL',
      }
    }
  });
});