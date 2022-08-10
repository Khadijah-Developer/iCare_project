/**
 * 
 */
  //show signup and hide login after on clicking signup link
    $('#signup-link').click(function() {
	console.log("Signup box clicked")
      $('#login-box').hide(500, function() {
	console.log("hiding login box")
        $('#signup-box').show(500); //show signup box
        linkStyleOnClick($('#signup-link')); //CSS on click of signup link
        linkStyleOffClick($('#login-link')) //change the color and border of login link to its original color
        $('#login-form').trigger("reset"); //Reset login form once signup is clicked
        resetEyeToggle($('#toggle-login-pass')); //Resetting login eye toggle
      })
    });

    //show login and hide signup on clicking login link
    $('#login-link').click(function() {
	console.log("login link clicked", $("#signup-box").length)
      $('#signup-box').hide(500, function() {
		console.log("displaying login box")
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
        "border": "1px solid #f7dff7"
      });
    }

    function linkStyleOffClick(link) {
      link.css({
        "color": "#f7dff7",
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
          $('#login-link').css("color", "#f7dff7");
        }

        if ($('#signup-box').is(':hidden')) {
          $('#signup-link').css("color", "#f7dff7");
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

    $("#signup-form").on("submit", function(e) {
		e.preventDefault();
		$.ajax({
			url: '/register',
			method: 'post',
			data: $(this).serialize(),
			success: function(result) {
				if(result.success == true) {
					window.location.href = result.data;
				} else {
					$("#signup-form input").val("").removeClass('is-invalid');
					let errorsDict = {};
					for(let err of result.fieldErrors) {
						if(err.field in errorsDict) {
							errorsDict[err.field].push(err.defaultMessage);
						} else {
							errorsDict[err.field] = [err.defaultMessage];
						}
					}
					
					for(let fieldName in errorsDict) {
						let errorMessages = errorsDict[fieldName]
						$(`#signup-form #${fieldName}-error`).html(errorMessages.join("<br />"));
						$(`#signup-form input[name=${fieldName}]`).addClass('is-invalid');
					}
				}
			},
			error: function(err) {
				console.log(err);
			}
		})
		return false;
})
    $("#login-form").on("submit", function(e) {
		e.preventDefault();
		$.ajax({
			url: '/login',
			method: 'post',
			data: $(this).serialize(),
			success: function(result) {
				if(result.success == true) {
					window.location.href = result.data;
				} else {
				  $("#login-form input").val("").removeClass('is-invalid');
					let errorMessages = {};
					for(let err of result.fieldErrors) {
						errorMessages[err.field] = err.defaultMessage;
						$(`#${err.field}-error`).text(err.defaultMessage);
						$(`#login-form input[name=${err.field}]`).addClass('is-invalid');
					}
					console.log(errorMessages);
				}
			},
			error: function(err) {
				console.log(err);
			}
		})
		return false;
})