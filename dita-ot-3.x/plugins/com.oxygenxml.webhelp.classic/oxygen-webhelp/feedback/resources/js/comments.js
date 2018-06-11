/*

 Oxygen WebHelp Plugin
 Copyright (c) 1998-2018 Syncro Soft SRL, Romania.  All rights reserved.

 */
var pageSearch = window.location.href;
var pageHash = window.location.hash;
var isModerator = false;
var isAnonymous = false;
var pathName = window.location.pathname;


$(document).ready(function(){

    $(".bt_close").click(closeDialog);
    $(".bt_cancel").click(function () {
        $(".bt_close").click();
    });

    $("#l_addNewCmt").click(showNewCommentDialog);
    $("#recoverPwd form").submit(recover);

    //debug("js 4");
    $("#bt_yesDelete").click(deleteComment);
    $("#bt_approveAll").click(showApproveAllDialog);
    $("#bt_yesApprove").click(approveAllComments);
    $("#bt_noApprove").click(hideApproveDialog);

    $('#bt_editProfile').click(function(e){
        e.preventDefault();
        showProfileChange(e);
    });

    $("#bt_logIn").click(function () {
        $(".anonymous_post_cmt").remove();
        $('#loginData').off('shown.bs.modal');
        $('#loginResponse').html('');
        showLoggInDialog();
    });

    $("#bt_signUp").click(function (e) {
        $('#loginData').off('shown.bs.modal');
        // show signup form
        $("#signUpResponse").html('');
        $('#loginData').modal('show');
        $('#loginData').on('shown.bs.modal',function(ev){
            $('#l_signUp2').trigger('click');
        });

        // get the shared projects
        sharedWith();
    });


    $("#bt_profile").click(updateUserProfile);
    $("#bt_logOff").click(loggOffUser);

    $(window).on("scroll", function () {
        if ((parseInt($("#bt_new").position().top) - parseInt($(window).scrollTop()) < $("#comments").height()) && $("#l_addNewCmt").is(":visible")) {
            $("#comments").addClass('float_comments');
        } else {
            $("#comments").removeClass('float_comments');
        }
    });


    if (checkConfig()) {
        showComments(pagePath);
    }
});