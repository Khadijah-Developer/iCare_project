/**
 * 
 */
  //show signup and hide login after on clicking signup link
    $('#signup-link').click(function() {
      $('#login-box').hide(500, function() {
        $('#signup-box').show(500); //show signup box
        linkStyleOnClick($('#signup-link')); //CSS on click of signup link
        linkStyleOffClick($('#login-link')) //change the color and border of login link to its original color
        $('#login-form').trigger("reset"); //Reset login form once signup is clicked
        resetEyeToggle($('#toggle-login-pass')); //Resetting login eye toggle
      });
    });

    //show login and hide signup on clicking login link
    $('#login-link').click(function() {
      $('#signup-box').hide(500, function() {
        $('#login-box').show(500); //show login box
        linkStyleOnClick($('#login-link')); //CSS on click of login link
        linkStyleOffClick($('#signup-link')) //change the color and border of signup link to its original color
        $('#signup-form').trigger("reset"); //Reset signup form once login is clicked
        //Resetting signup pass and confirm eye toggle
        resetEyeToggle($('#toggle-signup-pass'));
        resetEyeToggle($('#toggle-confirm-pass'));
      });
    });

    function linkStyleOnClick(link) {
      link.css({
        "color": "#ccc",
        "border": "1px solid #59B4B4"
      });
    }

    function linkStyleOffClick(link) {
      link.css({
        "color": "#59B4B4",
        "border": "none"
      });
    }

    //Resetting Eye Toggle on leaving the particular box
    function resetEyeToggle(eye) {
      if (eye.hasClass('fa-eye-slash')) {
        eye.removeClass('fa-eye-slash');
        eye.addClass('fa-eye');
        var input = $(eye.attr("toggle"));
        input.attr("type", "password");
      }
    }

    /***********************************************************************************************************************/
    //changing color hovering on login-link and returning back to its original color if its in signup-box
    $(document).ready(function() {
      $('.login-tab').find('.col').hover(function() {
        $(this).css("color", "#ccc");
      }, function() {
        // out hover function --- change the color if only that box is not visible
        if ($('#login-box').is(':hidden')) {
          $('#login-link').css("color", "#59B4B4");
        }

        if ($('#signup-box').is(':hidden')) {
          $('#signup-link').css("color", "#59B4B4");
        }
      });
    });

    /***********************************************************************************************************************/
    //Toggle eye icon of login pass
    $('#toggle-login-pass').click(function() {
      toggleEye($(this));
    });

    //Toggle eye icon of signup pass
    $('#toggle-signup-pass').click(function() {
      toggleEye($(this));
    });

    //Toggle eye icon of confirm pass
    $('#toggle-confirm-pass').click(function() {
      toggleEye($(this));
    });

    //function TO toggle EYE ICON of passwords
    function toggleEye(eye) {
      eye.toggleClass("fa-eye fa-eye-slash");
      var input = $(eye.attr("toggle"));
      if (eye.hasClass("fa-eye-slash")) {
        input.attr("type", "text");
      } else {
        input.attr("type", "password");
      }
    }