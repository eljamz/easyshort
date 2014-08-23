//= require bootstrap.min
//= require_tree .
//= require jquery 
//= require jquery_ujs
//= require jquery.validate
//= require jquery.validate.additional-methods
//= require ZeroClipboard

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

// fade out notices
setTimeout(function() {
    $('.alert').fadeOut('fast');
}, 5000);

// ZeroClipboard
ZeroClipboard.moviePath = '/assets/ZeroClipboard.swf';

$(function() {
    $("#links tbody td:last-child").each(function() {
        //Create a new clipboard client
        var clip = new ZeroClipboard.Client();

        //Cache the last td and the parent row    
        var lastTd = $(this);
        var parentRow = lastTd.parent("tr");

        //Glue the clipboard client to the last td in each row
        clip.glue(lastTd[0]);

        //Grab the text from the parent row of the icon
        var txt = $.trim($("td:nth-child(2)", parentRow).text());
        clip.setText(txt);

        //Debug
        //Add a complete event to let the user know the text was copied
        // clip.addEventListener('complete', function(client, text) {
        //    alert("Copied text to clipboard:\n" + text);
        //});
    });
});